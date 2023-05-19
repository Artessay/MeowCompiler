#include "semantic.h"

#include <stdio.h>

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>

void SEM_transProgram(A_topClause program) {
    // initial LLVM
    LLVMInitializeCore(LLVMGetGlobalPassRegistry());
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();

    // create LLVM context
    LLVMContextRef context = LLVMContextCreate();

    // create module
    LLVMModuleRef module = LLVMModuleCreateWithNameInContext("main_module", context);

    // create main function type
    LLVMTypeRef mainFunctionType = LLVMFunctionType(LLVMInt32TypeInContext(context), NULL, 0, 0);

    // create main function
    LLVMValueRef mainFunction = LLVMAddFunction(module, "main", mainFunctionType);

    // create entry block
    LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlock(mainFunction, "entry");

    // enter entry block
    LLVMPositionBuilderAtEnd(LLVMCreateBuilder(), entryBlock);

    // create const string
    LLVMValueRef constStr = LLVMBuildGlobalStringPtr(LLVMGetGlobalContext(), "Hello, LLVM IR!\n", "hello");

    // call printf function
    LLVMValueRef printfFunction = LLVMGetNamedFunction(module, "printf");
    LLVMValueRef args[] = {constStr};
    LLVMBuildCall(LLVMCreateBuilder(), printfFunction, args, 1, "");

    // return 0
    LLVMBuildRet(LLVMCreateBuilder(), LLVMConstInt(LLVMInt32TypeInContext(context), 0, 0));

    // print module content
    LLVMDumpModule(module);

    LLVMPrintModuleToFile(module, "output.txt", NULL);

    // 创建执行引擎
    LLVMExecutionEngineRef engine;
    char *error = NULL;
    LLVMCreateJITCompilerForModule(&engine, module, 2, &error);

    // 执行main函数
    LLVMGenericValueRef result = LLVMRunFunction(engine, mainFunction, 0, NULL);

    // 获取返回值
    int returnValue = LLVMGenericValueToInt(result, 0);

    // 打印返回值
    printf("Return value: %d\n", returnValue);

    // 清理内存
    LLVMDisposeGenericValue(result);
    LLVMDisposeExecutionEngine(engine);
    LLVMContextDispose(context);
}