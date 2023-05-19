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

    // 创建add函数类型
    LLVMTypeRef addFunctionArgs[] = {LLVMInt32TypeInContext(context), LLVMInt32TypeInContext(context)};
    LLVMTypeRef addFunctionType = LLVMFunctionType(LLVMInt32TypeInContext(context), addFunctionArgs, 2, 0);

    // 创建add函数
    LLVMValueRef addFunction = LLVMAddFunction(module, "add", addFunctionType);

    // 创建add函数的基本块
    LLVMBasicBlockRef addEntryBlock = LLVMAppendBasicBlock(addFunction, "entry");

    // 创建add函数的LLVMBuilderRef对象
    LLVMBuilderRef addBuilder = LLVMCreateBuilder();

    // 进入add函数的基本块并设置指令插入点
    LLVMPositionBuilderAtEnd(addBuilder, addEntryBlock);

    // 从add函数的参数中获取a和b的值
    LLVMValueRef a = LLVMGetParam(addFunction, 0);
    LLVMValueRef b = LLVMGetParam(addFunction, 1);

    // 计算a + b
    LLVMValueRef sum = LLVMBuildAdd(addBuilder, a, b, "sum");

    // 返回sum
    LLVMBuildRet(addBuilder, sum);

    // 创建主函数类型
    LLVMTypeRef mainFunctionType = LLVMFunctionType(LLVMInt32TypeInContext(context), NULL, 0, 0);

    // 创建主函数
    LLVMValueRef mainFunction = LLVMAddFunction(module, "main", mainFunctionType);

    // 创建主函数的基本块
    LLVMBasicBlockRef mainEntryBlock = LLVMAppendBasicBlock(mainFunction, "entry");

    // 创建主函数的LLVMBuilderRef对象
    LLVMBuilderRef mainBuilder = LLVMCreateBuilder();

    // 进入主函数的基本块并设置指令插入点
    LLVMPositionBuilderAtEnd(mainBuilder, mainEntryBlock);

    // 调用add函数
    LLVMValueRef addFunctionCallArgs[] = {LLVMConstInt(LLVMInt32TypeInContext(context), 1, 0),
                                          LLVMConstInt(LLVMInt32TypeInContext(context), 2, 0)};
    LLVMValueRef addResult = LLVMBuildCall(mainBuilder, addFunction, addFunctionCallArgs, 2, "add_result");

    // 返回add函数的结果
    LLVMBuildRet(mainBuilder, addResult);

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

    // 清理资源
    LLVMDisposeExecutionEngine(engine);
}