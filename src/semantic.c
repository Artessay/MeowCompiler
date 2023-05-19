#include "semantic.h"

#include <stdio.h>

#include <llvm-c/Core.h>
#include <llvm-c/Target.h>

void SEM_transProgram(A_topClauseList program, char *module_name, char *output_filename) {
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

    LLVMPrintModuleToFile(module, output_filename, NULL);

    // dispose LLVM context
    LLVMContextDispose(context);
}