#include "semantic.h"
#include "config.h"
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
};

SEM_context SEM_Context(LLVMModuleRef module, LLVMContextRef context, LLVMBuilderRef builder) {
    SEM_context p = (SEM_context)checked_malloc(sizeof(*p));
    p->module = module;
    p->context = context;
    p->builder = builder;
    return p;
};

static void transProgram(A_topClauseList root, SEM_context env);
static void transTopClause(A_topClause root, SEM_context env);

static void transFunctionDeclare(A_funcDeclare root, SEM_context env);
static void transGlobalVarDefine(A_varDeclare root, SEM_context env);

static void transStatementList(A_stmtList root, SEM_context env);
static void transStatement(A_stmt root, SEM_context env);

static LLVMValueRef transExpression(A_exp root, SEM_context env);
static LLVMValueRef transVariableExpression(A_exp root, SEM_context env);
static LLVMValueRef transCallExpression(A_exp root, SEM_context env);
static LLVMValueRef transBinaryExpression(A_exp root, SEM_context env);

void SEM_transProgram(A_topClauseList program, char *module_name) {
    // initial LLVM
    LLVMInitializeCore(LLVMGetGlobalPassRegistry());
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();

    // create LLVM context
    LLVMContextRef context = LLVMContextCreate();

    // create module
    LLVMModuleRef module = LLVMModuleCreateWithNameInContext(module_name, context);
        
    // create LLVMBuilderRef Object
    LLVMBuilderRef builder = LLVMCreateBuilder();

    SEM_context env = SEM_Context(module, context, builder);

    transProgram(program, env);

    // // 创建主函数类型
    // LLVMTypeRef mainFunctionType = LLVMFunctionType(LLVMInt32TypeInContext(context), NULL, 0, 0);

    // // 创建主函数
    // LLVMValueRef mainFunction = LLVMAddFunction(module, "main", mainFunctionType);

    // // 创建基本块
    // LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlock(mainFunction, "entry");

    // // 进入基本块并设置指令插入点
    // LLVMPositionBuilderAtEnd(builder, entryBlock);

    // // 创建字符串常量
    // LLVMValueRef helloStr = LLVMBuildGlobalStringPtr(builder, "Hello, LLVM IR!\n", "hello");

    // LLVMBuildRet(builder, LLVMConstInt(LLVMInt32TypeInContext(context), 0, 0));

    // print module content
    LLVMDumpModule(module);

    // output to file
    char *output_filename = (char *)checked_malloc(strlen(module_name) + 4);
    strcpy(output_filename, module_name);
    strcat(output_filename, ".ll");

    LLVMPrintModuleToFile(module, output_filename, NULL);
    free(output_filename);

    // dispose LLVM context
    LLVMContextDispose(context);
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
                    puts("TODO: trans to string type");
                    return NULL;

                case A_voidType:
                    return LLVMVoidType();
            }
            break;
        case A_point:
            break;
        case A_array:
            break;
    }

    puts("[error] unrecognized type, debug needed");
    return NULL;
}

static void transProgram(A_topClauseList root, SEM_context env) {
    for (A_topClauseList p = root; p != NULL; p = p->next) {
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

    for (A_fieldList p = root->params; p != NULL; p = p->next) {
        A_field field = p->value;
        if (field == NULL) {
            // puts("[warrning] field is null");
            // continue;
            break;
        }

        param_types[param_count] = transType(field->typ, env);
        ++param_count;

        if (param_count == MAX_FUNCTION_PARAMS) {
            puts("[error] parameters exceeds maximum");
            return;
        }
    }

    char *func_name = S_name(root->name);
    // puts("function name:");
    // puts(func_name);
    // puts("");
    
    LLVMTypeRef ret_type = LLVMFunctionType(transType(root->returnType, env), param_types, param_count, root->isVarArg);
    LLVMValueRef function = LLVMAddFunction(env->module, func_name, ret_type);

    if (root->isImplment) {
        // create function basic block
        LLVMBasicBlockRef functionEntryBlock = LLVMAppendBasicBlock(function, "entry");

        // create function LLVMBuilderRef 
        LLVMBuilderRef functionBuilder = LLVMCreateBuilder();

        // entry function basic block and set instruction insert point
        LLVMPositionBuilderAtEnd(functionBuilder, functionEntryBlock);

        // LLVMContextRef functionContext = LLVMContextCreate();
        // SEM_context functionEnv = SEM_Context(env->module, functionContext, functionBuilder);
        SEM_context functionEnv = SEM_Context(env->module, env->context, functionBuilder);

        transStatementList(root->body, functionEnv);

        free(functionEnv);
    }
}

static void transGlobalVarDefine(A_varDeclare root, SEM_context env) {
    switch (root->typ->kind) {
        case A_basic:
            switch (root->typ->u.basic) {
                case A_intType:
                    break;
                case A_doubleType:
                    break;
                case A_charType:
                    break;
                case A_stringType:
                    break;
                case A_voidType:
                    break;
            }
            break;
        case A_point:
            break;
        case A_array:
            break;
    }
}

static void transVarDefine(A_varDeclare root, SEM_context env) {
    LLVMTypeRef varType = transType(root->typ, env);
    LLVMValueRef localVar = LLVMBuildAlloca(env->builder, varType, S_name(root->name));

}

static void transStatementList(A_stmtList root, SEM_context env) {
    if (root == NULL) {
        return;
    }

    A_stmt statement = root->value;
    transStatementList(root->next, env);
}

static void transStatement(A_stmt root, SEM_context env) {
    if (root == NULL) {
        return;
    }

    LLVMValueRef exp = NULL;

    switch (root->kind) {
        case A_expStmt:
            transExpression(root->u.exp, env);
            break;
        case A_varDecStmt:
            transVarDefine(root->u.varDec, env);
            break;
        case A_returnStmt:
            exp = transExpression(root->u.returnn.exp, env);
            LLVMBuildRet(env->builder, exp);
            break;
        default:
            puts("[error] unimplemented statement");
            break;
    }
}

static LLVMValueRef transExpression(A_exp root, SEM_context env) {
    assert(root != NULL);

    switch (root->kind) {
        case A_varExp:
            return transVariableExpression(root, env);
        case A_nilExp:
            // @TODO
            return LLVMConstNull(LLVMInt32Type());
        case A_intExp:
            return LLVMConstInt(LLVMInt32Type(), root->u.intt, 1);
        case A_charExp:
            return LLVMConstInt(LLVMInt8Type(), root->u.charr, 1);
        case A_doubleExp:
            return LLVMConstReal(LLVMDoubleType(), root->u.doublee);
        case A_callExp:
            return transCallExpression(root, env);
        case A_opExp:
            return transBinaryExpression(root, env);
        default:
            puts("[error] unrecognized expression");
            return NULL;
    }
}

static LLVMValueRef transVariableExpression(A_exp root, SEM_context env) {
    assert(root->kind == A_varExp);

    char *var_name;
    if (root->u.var->kind == A_simpleVar) {
        var_name = S_name(root->u.var->u.simple);
    } else {
        puts("[error] unimplemented variable expression");
        return NULL;
    }

    LLVMValueRef variable = LLVMGetNamedGlobal(env->module, var_name);

    if (variable == NULL) {
        puts("[error] variable not found");
        return NULL;
    }

    return LLVMBuildLoad2(env->builder, transType(root->u.var->typ, env), variable, var_name);
}

static LLVMValueRef transCallExpression(A_exp root, SEM_context env) {
    assert(root->kind == A_callExp);

    char *func_name = S_name(root->u.call.func);
    LLVMValueRef function = LLVMGetNamedFunction(env->module, func_name);
    LLVMTypeRef functionType = LLVMGetCalledFunctionType(function);

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

    return LLVMBuildCall2(env->builder, functionType, function, args, arg_count, "callVal");
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
            return LLVMBuildAdd(env->builder, lhs, rhs, "temperate");
            
        case A_orOp:
            return LLVMBuildOr(env->builder, lhs, rhs, "temperate");
            
        // case A_eqOp: 
        //     return LLVMBuildICmp(env->builder, lhs, rhs, "temperate");
            
        // case A_neqOp: 
        //     return LLVMBuildAdd(env->builder, lhs, rhs, "temperate");
            
        // case A_ltOp: 
        //     return LLVMBuildAdd(env->builder, lhs, rhs, "temperate");
            
        // case A_leOp: 
        //     return LLVMBuildAdd(env->builder, lhs, rhs, "temperate");
            
        // case A_gtOp: 
        //     return LLVMBuildAdd(env->builder, lhs, rhs, "temperate");
            
        // case A_geOp:
        //     return LLVMBuildAdd(env->builder, lhs, rhs, "temperate");
            
        default:
            puts("[error] unrecognized binary op");
            return NULL;
    }
}