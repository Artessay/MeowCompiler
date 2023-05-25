#include "semantic.h"

#include "config.h"
#include "symbol.h"
#include "utility.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <llvm-c/Core.h>
#include <llvm-c/Target.h>

typedef struct SEM_context_ *SEM_context;

struct SEM_context_ {
    LLVMContextRef context;
    LLVMModuleRef module;
    LLVMBuilderRef builder;

    LLVMValueRef currentFunction;
};

SEM_context SEM_Context(LLVMModuleRef module, LLVMContextRef context, LLVMBuilderRef builder, LLVMValueRef currentFunction) {
    SEM_context p = (SEM_context)checked_malloc(sizeof(*p));
    p->module = module;
    p->context = context;
    p->builder = builder;

    p->currentFunction = currentFunction;
    return p;
};

typedef struct SEM_table_ *SEM_table;

struct SEM_table_ {
    S_table variableTable;
    S_table functionTable;
};

SEM_table tables = NULL;

SEM_table SEM_Table() {
    SEM_table p = (SEM_table)checked_malloc(sizeof(*p));
    
    p->variableTable = S_empty();
    p->functionTable = S_empty();
    
    return p;
}

void SEM_enterScope(SEM_table t) {
    S_beginScope(t->variableTable);
    S_beginScope(t->functionTable);
}

void SEM_leaveScope(SEM_table t) {
    S_endScope(t->variableTable);
    S_endScope(t->functionTable);
}

static void transProgram(A_topClauseList root, SEM_context env);
static void transTopClause(A_topClause root, SEM_context env);

static void transFunctionDeclare(A_funcDeclare root, SEM_context env);
static void transGlobalVarDefine(A_varDeclare root, SEM_context env);

static void transStatementList(A_stmtList root, SEM_context env);
static void transStatement(A_stmt root, SEM_context env);

static void transVarDefine(A_varDeclare root, SEM_context env);
static void transVarDec(A_varDec root, LLVMTypeRef varType, char isGlobal, SEM_context env);
static LLVMValueRef transVar(A_var var, SEM_context env);
static LLVMTypeRef transVarType(A_var var, LLVMTypeRef varType, SEM_context env);

static LLVMValueRef transExpression(A_exp root, SEM_context env);
static LLVMValueRef transVariableExpression(A_exp root, SEM_context env);
static LLVMValueRef transAmpersandExp(A_var root, SEM_context env);
static LLVMValueRef transStarExp(A_var root, SEM_context env);
static LLVMValueRef transTypeCast(A_exp root, SEM_context env);
static LLVMValueRef transCallExpression(A_exp root, SEM_context env);
static LLVMValueRef transBinaryExpression(A_exp root, SEM_context env);
static LLVMValueRef transAssignExpression(A_exp root, SEM_context env);

LLVMModuleRef SEM_transProgram(A_topClauseList program, char *module_name, char* ir_filename) {
    // initial LLVM
    LLVMInitializeCore(LLVMGetGlobalPassRegistry());
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();

    // create LLVM context
    LLVMContextRef context = LLVMContextCreate();

    // create module
    LLVMModuleRef module = LLVMModuleCreateWithName(module_name);
        
    // create LLVMBuilderRef Object
    LLVMBuilderRef builder = LLVMCreateBuilder();

    SEM_context env = SEM_Context(module, context, builder, NULL);

    tables = SEM_Table();
    SEM_enterScope(tables);

    transProgram(program, env);

    SEM_leaveScope(tables);

    // print module content
    // LLVMDumpModule(module);

    // output to file
    LLVMPrintModuleToFile(module, ir_filename, NULL);

    // dispose LLVM context
    LLVMContextDispose(context);

    return module;
}

static LLVMTypeRef transType(A_varType typ, SEM_context env) {
    if (typ == NULL) {
        return NULL;
    }

    switch (typ->kind) {
        case A_basic:
            switch (typ->u.basic) {
                case A_intType:
                    return LLVMInt32Type();
                    
                case A_doubleType:
                    return LLVMDoubleType();

                case A_charType:
                    return LLVMInt8Type();

                case A_stringType:
                    return LLVMPointerType(LLVMInt8Type(), 0);

                case A_voidType:
                    return LLVMVoidType();
            }
            break;
        case A_point:
            return LLVMPointerType(transType(typ->u.point, env), 0);
        case A_array:
            break;
    }

    puts("[error] unrecognized type, debug needed");
    return NULL;
}

static void transProgram(A_topClauseList root, SEM_context env) {
    for (A_topClauseList p = root; p != NULL; p = p->next) {
        if (p->value == NULL) {
            puts("[error] top clause is null");
            continue;
        }
        
        transTopClause(p->value, env);
    }
}

static void transTopClause(A_topClause root, SEM_context env) {
    switch (root->kind) {
        case A_Preprocess:
            puts("TODO: preprocess");
            break;
        case A_FunctionDeclare:
            transFunctionDeclare(root->u.function, env);
            break;
        case A_GlobalVarDefine:
            transGlobalVarDefine(root->u.globalVar, env);
            break;
    }
}

static void transFunctionDeclare(A_funcDeclare root, SEM_context env) {
    unsigned int param_count = 0;
    LLVMTypeRef param_types[MAX_FUNCTION_PARAMS];
    S_symbol param_names[MAX_FUNCTION_PARAMS];

    for (A_argList p = root->params; p != NULL; p = p->next) {
        A_arg arg = p->value;
        if (arg == NULL) {
            break;
        }

        LLVMTypeRef basic_type = transType(arg->typ, env);
        param_types[param_count] = transVarType(arg->var, basic_type, env);
        param_names[param_count] = S_getVarSymbol(arg->var);
        ++param_count;

        if (param_count == MAX_FUNCTION_PARAMS) {
            puts("[error] parameters exceeds maximum");
            return;
        }
    }

    char *func_name = S_name(root->name);
    
    LLVMTypeRef ret_type = LLVMFunctionType(transType(root->returnType, env), param_types, param_count, root->isVarArg);
    LLVMValueRef function = LLVMAddFunction(env->module, func_name, ret_type);
    
    S_enter(tables->functionTable, root->name, function);

    if (root->isImplment) {
        // create function basic block
        LLVMBasicBlockRef functionEntryBlock = LLVMAppendBasicBlock(function, "entry");

        // create function LLVMBuilderRef 
        LLVMBuilderRef functionBuilder = LLVMCreateBuilder();

        // entry function basic block and set instruction insert point
        LLVMPositionBuilderAtEnd(functionBuilder, functionEntryBlock);

        SEM_context functionEnv = SEM_Context(env->module, env->context, functionBuilder, function);

        SEM_enterScope(tables);

        for (unsigned int i = 0; i < param_count; ++i) {
            LLVMValueRef param = LLVMGetParam(function, i);
            LLVMValueRef paramPoint = LLVMBuildAlloca(functionBuilder, LLVMTypeOf(param), "");
            LLVMBuildStore(functionBuilder, param, paramPoint);
            S_enter(tables->variableTable, param_names[i], paramPoint);
        }

        transStatementList(root->body, functionEnv);

        SEM_leaveScope(tables);

        free(functionEnv);
    }
}

static void transGlobalVarDefine(A_varDeclare root, SEM_context env) {
    LLVMTypeRef varType = transType(root->typ, env);
    
    for (A_varDecList p = root->decs; p != NULL; p = p->next) {
        A_varDec dec = p->value;
        if (dec == NULL) {
            break;
        }

        transVarDec(dec, varType, 1, env);
    }
}

static LLVMTypeRef transValueType(A_var var, LLVMValueRef variable, SEM_context env) {
    if (var->kind == A_simpleVar) {
        return LLVMTypeOf(variable);
    } else if (var->kind == A_subscriptVar) {
        return LLVMGetElementType(transValueType(var->u.subscript.var, variable, env));
    } else if (var->kind == A_pointVar) {
        return LLVMPointerType(transValueType(var->u.point, variable, env), 0);
    } else {
        puts("[error] unrecognized value type");
        return NULL;
    }
}

static LLVMTypeRef transVarType(A_var var, LLVMTypeRef varType, SEM_context env) {
    assert(var != NULL && varType != NULL);

    LLVMValueRef expValue = NULL;
    unsigned int elementCount = 0;

    switch (var->kind) {
        case A_simpleVar:
            // puts("[debug] transVarType: simple var");
            break;

        case A_subscriptVar:
            // puts("[debug] transVarType: subscript var");
            for (A_var p = var; p->kind == A_subscriptVar; p = p->u.subscript.var) {
                expValue = transExpression(p->u.subscript.exp, env);
                if (LLVMIsAConstantInt(expValue)) {
                    elementCount = LLVMConstIntGetZExtValue(expValue);
                    varType = LLVMArrayType(varType, elementCount);
                } else {
                    puts("[error] subscript is not a constant int");
                    return NULL;
                }
            }
            break;

        case A_pointVar:
            // puts("[debug] transVarType: point var");

            varType = transVarType(var->u.point, varType, env);
            varType = LLVMPointerType(varType, 0);
            break;

        default:
            puts("[error] unrecognized var kind");
            break;
    }

    return varType;
}

static void transArrayVar(A_var p, LLVMValueRef *variable, LLVMTypeRef *varType, LLVMValueRef *index, SEM_context env) {
    if (p->kind == A_simpleVar) {
        *varType = LLVMTypeOf(*variable);
        return;
    }

    transArrayVar(p->u.subscript.var, variable, varType, index, env);

    *varType = LLVMGetElementType(*varType);
    index[1] = transExpression(p->u.subscript.exp, env);
    *variable = LLVMBuildGEP2(env->builder, *varType, *variable, index, 2, "arrayElement");
}

static LLVMValueRef transVar(A_var var, SEM_context env) {
    assert(var != NULL);
    LLVMValueRef variable = NULL;
        
    // find local variable
    // printf("var kind: %d\n", var->kind);
    if (var->kind == A_simpleVar) {
        // printf("[debug] find local simple variable: %s\n", var->u.simple->name);
        variable = S_look(tables->variableTable, var->u.simple);
    } else if (var->kind == A_subscriptVar) {
        // printf("[debug] find local subscript variable %s\n", S_name(S_getVarSymbol(var)));
        variable = S_look(tables->variableTable, S_getVarSymbol(var->u.subscript.var));
        LLVMValueRef index[2];
        index[0] = LLVMConstInt(LLVMInt32Type(), 0, 0);
                
        LLVMTypeRef varType = NULL;

        transArrayVar(var, &variable, &varType, index, env);
        
    } else if (var->kind == A_derefVar) {
        // printf("[debug] find local deref variable: %s\n", S_name(S_getVarSymbol(var)));
        variable = S_look(tables->variableTable, S_getVarSymbol(var->u.deref));
        LLVMTypeRef varType = LLVMGetElementType(LLVMTypeOf(variable));

        // LLVMDumpType(varType); putchar('\n');
        variable = LLVMBuildLoad2(env->builder, varType, variable, S_name(S_getVarSymbol(var)));
    } else {
        puts("[error] unimplemented variable expression");
        variable = NULL;
    }

    // find global variable
    if (variable == NULL) {
        // puts("[debug] find global variable");
        variable = LLVMGetNamedGlobal(env->module, var->u.simple->name);
    }
    
    // still not found
    if (variable == NULL) {
        puts("[error] variable not found");
        return NULL;
    }

    return variable;
}

static void transVarDec(A_varDec root, LLVMTypeRef varType, char isGlobal, SEM_context env) {
    assert(root != NULL);
    assert(varType != NULL);
    
    A_var var = root->var;
    assert(var != NULL);
    
    S_symbol varName = S_getVarSymbol(var);
    // printf("var name: %s\n", S_name(varName));

    varType = transVarType(var, varType, env);
    assert(varType != NULL);
    // LLVMDumpType(varType); puts("");

    LLVMValueRef localVar = NULL;
    if (isGlobal) {
        localVar = LLVMAddGlobal(env->module, varType, S_name(varName));
        LLVMSetValueName2(localVar, S_name(varName), strlen(S_name(varName)));
        
        LLVMSetInitializer(localVar, LLVMConstNull(varType));
    } else {
        localVar = LLVMBuildAlloca(env->builder, varType, S_name(varName));
    }
    
    S_enter(tables->variableTable, varName, localVar);

    if (root->init != NULL) {
        LLVMValueRef initExp = transExpression(root->init, env);
        LLVMBuildStore(env->builder, initExp, localVar);
    }

    return;
}

static void transVarDefine(A_varDeclare root, SEM_context env) {
    LLVMTypeRef varType = transType(root->typ, env);
    
    for (A_varDecList p = root->decs; p != NULL; p = p->next) {
        A_varDec dec = p->value;
        if (dec == NULL) {
            break;
        }

        transVarDec(dec, varType, 0, env);
    }
    // puts("var declare done");
}

static void transStatementList(A_stmtList root, SEM_context env) {
    if (root == NULL) {
        return;
    }

    A_stmt statement = root->value;
    transStatement(statement, env);
    // puts("statement done");
    transStatementList(root->next, env);
}

static void transSelection(A_if root, SEM_context env) {
    LLVMValueRef cond = transExpression(root->condition, env);

    LLVMBasicBlockRef thenBlock = LLVMAppendBasicBlock(env->currentFunction, "if.then");
    LLVMBasicBlockRef elseBlock = LLVMAppendBasicBlock(env->currentFunction, "if.else");
    LLVMBasicBlockRef mergeBlock = LLVMAppendBasicBlock(env->currentFunction, "if.merge");

    LLVMBuildCondBr(env->builder, cond, thenBlock, elseBlock);

    LLVMPositionBuilderAtEnd(env->builder, thenBlock);
    transStatement(root->then, env);
    LLVMBuildBr(env->builder, mergeBlock);

    LLVMPositionBuilderAtEnd(env->builder, elseBlock);
    transStatement(root->elsee, env);
    LLVMBuildBr(env->builder, mergeBlock);

    LLVMPositionBuilderAtEnd(env->builder, mergeBlock);
}

static void transFor(A_for root, SEM_context env) {
    assert(root != NULL);

    SEM_enterScope(tables);

    transStatement(root->init, env);

    LLVMBasicBlockRef loopBlock = LLVMAppendBasicBlock(env->currentFunction, "for.loop");
    LLVMBasicBlockRef bodyBlock = LLVMAppendBasicBlock(env->currentFunction, "for.body");
    LLVMBasicBlockRef afterBlock = LLVMAppendBasicBlock(env->currentFunction, "for.after");

    LLVMBuildBr(env->builder, loopBlock);

    LLVMPositionBuilderAtEnd(env->builder, loopBlock);
    LLVMValueRef cond = transExpression(root->condition, env);
    LLVMBuildCondBr(env->builder, cond, bodyBlock, afterBlock);

    LLVMPositionBuilderAtEnd(env->builder, bodyBlock);
    transStatement(root->body, env);
    transExpression(root->step, env);
    LLVMBuildBr(env->builder, loopBlock);

    LLVMPositionBuilderAtEnd(env->builder, afterBlock);

    SEM_leaveScope(tables);
}

static void transWhile(A_while root, SEM_context env) {
    assert(root != NULL);

    LLVMBasicBlockRef loopBlock = LLVMAppendBasicBlock(env->currentFunction, "while.loop");
    LLVMBasicBlockRef bodyBlock = LLVMAppendBasicBlock(env->currentFunction, "while.body");
    LLVMBasicBlockRef afterBlock = LLVMAppendBasicBlock(env->currentFunction, "while.after");

    LLVMBuildBr(env->builder, loopBlock);

    LLVMPositionBuilderAtEnd(env->builder, loopBlock);
    LLVMValueRef cond = transExpression(root->condition, env);
    LLVMBuildCondBr(env->builder, cond, bodyBlock, afterBlock);

    LLVMPositionBuilderAtEnd(env->builder, bodyBlock);
    transStatement(root->body, env);
    LLVMBuildBr(env->builder, loopBlock);

    LLVMPositionBuilderAtEnd(env->builder, afterBlock);
}

static void transStatement(A_stmt root, SEM_context env) {
    if (root == NULL) {
        return;
    }

    LLVMValueRef exp = NULL;

    switch (root->kind) {
        case A_expStmt:
            // puts("expression");
            transExpression(root->u.exp, env);
            break;
        case A_varDecStmt:
            // puts("variable declare");
            transVarDefine(root->u.varDec, env);
            break;
        case A_compoundStmt:
            // puts("compound");
            SEM_enterScope(tables);
            transStatementList(root->u.compound, env);
            SEM_leaveScope(tables);
            break;
        case A_ifStmt:
            transSelection(&(root->u.iff), env);
            break;
        case A_forStmt:
            transFor(&(root->u.forr), env);
            break;
        case A_whileStmt:
            transWhile(&(root->u.whilee), env);
            break;
        
        case A_returnStmt:
            // puts("return");
            if (root->u.returnn.exp != NULL) {
                exp = transExpression(root->u.returnn.exp, env);
                LLVMBuildRet(env->builder, exp);
            } else {
                LLVMBuildRetVoid(env->builder);
            }
            
            break;
        default:
            printf("[error] unimplemented statement %d\n", root->kind);
            break;
    }
}

static LLVMValueRef transExpression(A_exp root, SEM_context env) {
    assert(root != NULL);

    switch (root->kind) {
        case A_varExp:
            // puts("variable expression");
            return transVariableExpression(root, env);
        case A_ampersandExp:
            // puts("& var");
            return transAmpersandExp(root->u.ampersand, env);
        case A_starExp:
            // puts("* var");
            return transStarExp(root->u.star, env);
        case A_typeCastExp:
            return transTypeCast(root, env);
        case A_nilExp:
            // @TODO
            return LLVMConstNull(LLVMInt32Type());
        case A_intExp:
            // printf("int expression: %d\n", root->u.intt);
            return LLVMConstInt(LLVMInt32Type(), root->u.intt, 1);
        case A_charExp:
            return LLVMConstInt(LLVMInt8Type(), root->u.charr, 1);
        case A_doubleExp:
            return LLVMConstReal(LLVMDoubleType(), root->u.doublee);
        case A_stringExp:
            // printf("string expression: %s\n", root->u.stringg);
            return LLVMBuildGlobalStringPtr(env->builder, root->u.stringg, "string");
        case A_callExp:
            // puts("call expression");
            return transCallExpression(root, env);
        case A_opExp:
            // puts("binary expression");
            return transBinaryExpression(root, env);
        case A_assignExp:
            // puts("assign expression");
            return transAssignExpression(root, env);
        default:
            puts("[error] unrecognized expression");
            return NULL;
    }
}

static LLVMValueRef transVariableExpression(A_exp root, SEM_context env) {
    assert(root->kind == A_varExp);

    LLVMValueRef variable = transVar(root->u.var, env);

    LLVMTypeRef varType = LLVMGetElementType(LLVMTypeOf(variable));

    return LLVMBuildLoad2(env->builder, varType, variable, S_name(S_getVarSymbol(root->u.var)));
}

static LLVMValueRef transAmpersandExp(A_var root, SEM_context env) {
    assert(root != NULL);

    LLVMValueRef variable = transVar(root, env);
    LLVMTypeRef variableType = LLVMTypeOf(variable);
    
    // LLVMValueRef addressOfVariable = LLVMBuildBitCast(env->builder, variable, LLVMPointerType(variableType, 0), S_name(S_getVarSymbol(root)));
    LLVMValueRef addressOfVariable = LLVMBuildAlloca(env->builder, variableType, S_name(S_getVarSymbol(root)));
    // LLVMDumpValue(addressOfVariable); putchar('\n');
    
    LLVMBuildStore(env->builder, variable, addressOfVariable);
    return LLVMBuildLoad2(env->builder, variableType, addressOfVariable, S_name(S_getVarSymbol(root)));
}

static LLVMValueRef transStarExp(A_var root, SEM_context env) {
    assert(root != NULL);

    LLVMValueRef value = transVar(root, env);
    LLVMTypeRef varType = LLVMTypeOf(value);
    LLVMDumpValue(value); putchar('\n');
    LLVMDumpType(varType); putchar('\n');
    LLVMValueRef addressOfValue = LLVMBuildLoad2(env->builder, varType, value, S_name(S_getVarSymbol(root)));
    return addressOfValue;
}

static LLVMValueRef transTypeCast(A_exp root, SEM_context env) {
    assert(root->kind == A_typeCastExp);

    LLVMTypeRef varType = transType(root->u.cast.castType, env);
    LLVMValueRef value = transExpression(root->u.cast.exp, env);
    
    LLVMValueRef indices[MAX_FUNCTION_PARAMS] = {LLVMConstInt(LLVMInt32Type(), 0, 0), LLVMConstInt(LLVMInt32Type(), 0, 0)};
    
    if (varType == LLVMDoubleType()) {
        return LLVMBuildSIToFP(env->builder, value, LLVMDoubleType(), "castDouble");
    } else if (varType == LLVMInt32Type()) {
        return LLVMBuildIntCast2(env->builder, value, LLVMInt32Type(), 1, "castInt");
    } else if (varType == LLVMInt8Type()) {
        return LLVMBuildIntCast2(env->builder, value, LLVMInt8Type(), 1, "castChar");
    }
    /** point cast */
    else if (varType == LLVMPointerType(LLVMInt8Type(), 0)) {
        if (root->u.cast.exp->kind == A_varExp ) {
            // && root->u.cast.exp->u.var->kind == A_subscriptVar) {
            int i = 1;
            for (A_var p = root->u.cast.exp->u.var; p->kind == A_subscriptVar; p = p->u.subscript.var) {
                indices[i++] = transExpression(p->u.subscript.exp, env);
            }
            indices[i] = LLVMConstInt(LLVMInt32Type(), 0, 0);
            return LLVMBuildGEP2(env->builder, LLVMPointerType(LLVMInt8Type(), 0), value, indices, i, "castString");
        } else {
            return LLVMBuildBitCast(env->builder, value, LLVMPointerType(LLVMInt8Type(), 0), "castString");
        }
    } else if (varType == LLVMPointerType(LLVMInt32Type(), 0)) {
        return LLVMBuildIntToPtr(env->builder, value, LLVMPointerType(LLVMInt32Type(), 0), "castInt");
    } else if (varType == LLVMPointerType(LLVMDoubleType(), 0)) {
        return LLVMBuildIntToPtr(env->builder, value, LLVMPointerType(LLVMDoubleType(), 0), "castDouble");
    } else if (varType == LLVMPointerType(LLVMPointerType(LLVMInt8Type(), 0), 0)) {
        return LLVMBuildIntToPtr(env->builder, value, LLVMPointerType(LLVMPointerType(LLVMInt8Type(), 0), 0), "castString");
    } else if (varType == LLVMPointerType(LLVMPointerType(LLVMInt32Type(), 0), 0)) {
        return LLVMBuildIntToPtr(env->builder, value, LLVMPointerType(LLVMPointerType(LLVMInt32Type(), 0), 0), "castString");
    } else if (varType == LLVMPointerType(LLVMPointerType(LLVMDoubleType(), 0), 0)) {
        return LLVMBuildIntToPtr(env->builder, value, LLVMPointerType(LLVMPointerType(LLVMDoubleType(), 0), 0), "castString");
    } else if (varType == LLVMPointerType(LLVMPointerType(LLVMPointerType(LLVMInt8Type(), 0), 0), 0)) {
        return LLVMBuildIntToPtr(env->builder, value, LLVMPointerType(LLVMPointerType(LLVMPointerType(LLVMInt8Type(), 0), 0), 0), "castString");
    } else if (varType == LLVMPointerType(LLVMPointerType(LLVMPointerType(LLVMInt32Type(), 0), 0), 0)) {
        return LLVMBuildIntToPtr(env->builder, value, LLVMPointerType(LLVMPointerType(LLVMPointerType(LLVMInt32Type(), 0), 0), 0), "castString");
    } else if (varType == LLVMPointerType(LLVMPointerType(LLVMPointerType(LLVMDoubleType(), 0), 0), 0)) {
        return LLVMBuildIntToPtr(env->builder, value, LLVMPointerType(LLVMPointerType(LLVMPointerType(LLVMDoubleType(), 0), 0), 0), "castString");
    }
    
    puts("[error] unimplemented type cast");
    return NULL;
}

static LLVMValueRef transCallExpression(A_exp root, SEM_context env) {
    assert(root->kind == A_callExp);

    char *func_name = S_name(root->u.call.func);
    LLVMValueRef function = LLVMGetNamedFunction(env->module, func_name);
    LLVMTypeRef functionType = LLVMGetElementType(LLVMTypeOf(function));

    if (function == NULL) {
        puts("[error] function not found");
        return NULL;
    }

    unsigned int arg_count = 0;
    LLVMValueRef args[MAX_FUNCTION_PARAMS];
    for (A_expList p = root->u.call.args; p != NULL; p = p->next) {
        args[arg_count] = transExpression(p->value, env);
        ++arg_count;

        if (arg_count == MAX_FUNCTION_PARAMS) {
            puts("[error] parameters exceeds maximum");
            return NULL;
        }
    }

    if (LLVMGetReturnType(LLVMTypeOf(function)) != LLVMVoidType()) {
        return LLVMBuildCall2(env->builder, functionType, function, args, arg_count, "callVal");
    } else {
        // TODO: Debug needed
        puts("[debug] return void type");
        LLVMBuildCall2(env->builder, functionType, function, args, arg_count, "callVal");
        return NULL;
    }
}

static LLVMValueRef transBinaryExpression(A_exp root, SEM_context env) {
    assert( root->kind ==A_opExp );

    LLVMValueRef lhs = transExpression(root->u.op.left, env);
    LLVMValueRef rhs = transExpression(root->u.op.right, env);

    LLVMTypeRef lhsType = LLVMTypeOf(lhs);
    LLVMTypeRef rhsType = LLVMTypeOf(rhs);

    switch (root->u.op.oper) {
        case A_plusOp:
            return LLVMBuildAdd(env->builder, lhs, rhs, "temperate");

        case A_minusOp:
            return LLVMBuildSub(env->builder, lhs, rhs, "temperate");
            
        case A_timesOp:
            return LLVMBuildMul(env->builder, lhs, rhs, "temperate");
            
        case A_divideOp:
            if (lhsType == LLVMDoubleType() || rhsType == LLVMDoubleType()) {
                return LLVMBuildFDiv(env->builder, lhs, rhs, "fDiv");
            } else {
                return LLVMBuildSDiv(env->builder, lhs, rhs, "sDiv");
            }            
            
        case A_modOp:
            return LLVMBuildSRem(env->builder, lhs, rhs, "temperate");
            
        case A_shlOp: 
            return LLVMBuildShl(env->builder, lhs, rhs, "temperate");
            
        case A_shrOp:
            /* warning: always logic shift right */
            return LLVMBuildLShr(env->builder, lhs, rhs, "temperate");
            
        case A_bAndOp: 
            puts("[warning] binary and is not stable");
            return LLVMBuildAnd(env->builder, lhs, rhs, "temperate");
            
        case A_bOrOp: 
            puts("[warning] binary or is not stable");
            return LLVMBuildOr(env->builder, lhs, rhs, "temperate");
            
        case A_bXorOp:
            return LLVMBuildXor(env->builder, lhs, rhs, "temperate");
            
        case A_andOp: 
            return LLVMBuildAnd(env->builder, lhs, rhs, "temperate");
            
        case A_orOp:
            return LLVMBuildOr(env->builder, lhs, rhs, "temperate");
            
        case A_eqOp: 
            if (lhsType == LLVMDoubleType() || rhsType == LLVMDoubleType()) {
                return LLVMBuildFCmp(env->builder, LLVMRealOEQ, lhs, rhs, "cmpEQ");
            } else {
                return LLVMBuildICmp(env->builder, LLVMIntEQ, lhs, rhs, "cmpEQ");
            }
            
        case A_neqOp: 
            if (lhsType == LLVMDoubleType() || rhsType == LLVMDoubleType()) {
                return LLVMBuildFCmp(env->builder, LLVMRealONE, lhs, rhs, "cmpNE");
            } else {
                return LLVMBuildICmp(env->builder, LLVMIntNE, lhs, rhs, "cmpNE");
            }
            
        case A_ltOp: 
            if (lhsType == LLVMDoubleType() || rhsType == LLVMDoubleType()) {
                return LLVMBuildFCmp(env->builder, LLVMRealOLT, lhs, rhs, "cmpLT");
            } else {
                return LLVMBuildICmp(env->builder, LLVMIntSLT, lhs, rhs, "cmpLT");
            }
            
        case A_leOp: 
            if (lhsType == LLVMDoubleType() || rhsType == LLVMDoubleType()) {
                return LLVMBuildFCmp(env->builder, LLVMRealOLE, lhs, rhs, "cmpLE");
            } else {
                return LLVMBuildICmp(env->builder, LLVMIntSLE, lhs, rhs, "cmpLE");
            }
            
        case A_gtOp: 
            if (lhsType == LLVMDoubleType() || rhsType == LLVMDoubleType()) {
                return LLVMBuildFCmp(env->builder, LLVMRealOGT, lhs, rhs, "cmpGT");
            } else {
                return LLVMBuildICmp(env->builder, LLVMIntSGT, lhs, rhs, "cmpGT");
            }
            
        case A_geOp:
            if (lhsType == LLVMDoubleType() || rhsType == LLVMDoubleType()) {
                return LLVMBuildFCmp(env->builder, LLVMRealOGE, lhs, rhs, "cmpGE");
            } else {
                return LLVMBuildICmp(env->builder, LLVMIntSGE, lhs, rhs, "cmpGE");
            }
            
        default:
            puts("[error] unrecognized binary op");
            return NULL;
    }
}

static LLVMValueRef transAssignExpression(A_exp root, SEM_context env) {
    assert(root->kind == A_assignExp);

    LLVMValueRef value = transExpression(root->u.assign.exp, env);
    assert(value != NULL);

    LLVMValueRef variable = transVar(root->u.assign.var, env);
    assert(variable != NULL);
    // LLVMDumpValue(variable); putchar('\n');
    // LLVMDumpValue(value); putchar('\n');
    
    return LLVMBuildStore(env->builder, value, variable);
}