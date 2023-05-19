#include "semantic.h"
#include "config.h"
#include "utility.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <llvm-c/Core.h>
#include <llvm-c/Target.h>


static LLVMContextRef context = NULL;
static LLVMModuleRef module = NULL;
static LLVMBuilderRef builder = NULL;

static void transProgram(A_topClauseList root);
static void transTopClause(A_topClause root);
static void transFunctionDeclare(A_funcDeclare root);
static void transGlobalVarDefine(A_varDeclare root);

void SEM_transProgram(A_topClauseList program, char *module_name) {
    // initial LLVM
    LLVMInitializeCore(LLVMGetGlobalPassRegistry());
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();

    // create LLVM context
    context = LLVMContextCreate();
    // LLVMContextRef context = LLVMContextCreate();

    // create module
    module = LLVMModuleCreateWithNameInContext(module_name, context);
    // LLVMModuleRef module = LLVMModuleCreateWithNameInContext(module_name, context);
        
    // create LLVMBuilderRef Object
    builder = LLVMCreateBuilder();
    // LLVMBuilderRef builder = LLVMCreateBuilder();

    transProgram(program);

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

static LLVMTypeRef transType(A_varType typ) {
    switch (typ->kind) {
        case A_basic:
            switch (typ->u.basic->kind) {
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

static void transProgram(A_topClauseList root) {
    for (A_topClauseList p = root; p != NULL; p = p->next) {
        transTopClause(p->value);
    }
}

static void transTopClause(A_topClause root) {
    switch (root->kind) {
        case A_Preprocess:
            puts("TODO: preprocess");
            break;
        case A_FunctionDeclare:
            transFunctionDeclare(root->u.function);
            break;
        case A_GlobalVarDefine:
            transGlobalVarDefine(root->u.globalVar);
            break;
    }
}

static void transFunctionDeclare(A_funcDeclare root) {
    unsigned int param_count = 0;
    LLVMTypeRef param_types[MAX_FUNCTION_PARAMS];

    for (A_fieldList p = root->params; p != NULL; p = p->next) {
        A_field field = p->value;
        if (field == NULL) {
            // puts("[warrning] field is null");
            // continue;
            break;
        }

        param_types[param_count] = transType(field->typ);
        ++param_count;
    }

    char *func_name = S_name(root->name);
    // puts("function name:");
    // puts(func_name);
    // puts("");
    
    LLVMTypeRef ret_type = LLVMFunctionType(transType(root->returnType), param_types, param_count, root->isVarArg);
    LLVMValueRef function = LLVMAddFunction(module, func_name, ret_type);
}

static void transGlobalVarDefine(A_varDeclare root) {
    switch (root->typ->kind) {
        case A_basic:
            switch (root->typ->u.basic->kind) {
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