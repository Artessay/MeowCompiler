#include "semantic.h"
#include "utility.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <llvm-c/Core.h>
#include <llvm-c/Target.h>

void SEM_transProgram(A_topClauseList program, char *module_name) {
    // initial LLVM
    LLVMInitializeCore(LLVMGetGlobalPassRegistry());
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();

    // create LLVM context
    LLVMContextRef context = LLVMContextCreate();

    // create module
    LLVMModuleRef module = LLVMModuleCreateWithNameInContext(module_name, context);
    
    // 创建主函数类型
    LLVMTypeRef mainFunctionType = LLVMFunctionType(LLVMInt32TypeInContext(context), NULL, 0, 0);

    // 创建主函数
    LLVMValueRef mainFunction = LLVMAddFunction(module, "main", mainFunctionType);

    // 创建基本块
    LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlock(mainFunction, "entry");

    // 创建LLVMBuilderRef对象
    LLVMBuilderRef builder = LLVMCreateBuilder();

    // 进入基本块并设置指令插入点
    LLVMPositionBuilderAtEnd(builder, entryBlock);

    // 创建字符串常量
    LLVMValueRef helloStr = LLVMBuildGlobalStringPtr(builder, "Hello, LLVM IR!\n", "hello");

    LLVMBuildRet(builder, LLVMConstInt(LLVMInt32TypeInContext(context), 0, 0));

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