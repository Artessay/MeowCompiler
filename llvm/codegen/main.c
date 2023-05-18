#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <stdio.h>

int main() {
    // 初始化LLVM
    LLVMInitializeCore(LLVMGetGlobalPassRegistry());
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();

    // 创建LLVM上下文
    LLVMContextRef context = LLVMContextCreate();

    // 创建模块
    LLVMModuleRef module = LLVMModuleCreateWithNameInContext("main_module", context);

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

    // 调用printf函数
    LLVMValueRef printfFunction = LLVMGetNamedFunction(module, "printf");
    LLVMValueRef args[] = {helloStr};
    LLVMTypeRef printfFunctionType = LLVMFunctionType(LLVMInt32TypeInContext(context), NULL, 0, 0);
    LLVMBuildCall2(builder, printfFunctionType, printfFunction, args, 1, "");

    // 返回0
    LLVMBuildRet(builder, LLVMConstInt(LLVMInt32TypeInContext(context), 0, 0));

    // 打印模块内容
    LLVMDumpModule(module);

    // 打印到文件
    // printf("print %d\n", LLVMPrintModuleToFile(module, "main.ll", NULL));

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

    return 0;
}
