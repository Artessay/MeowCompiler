#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>

#include <stdlib.h>

int main() {
    LLVMInitializeAllTargetInfos();
    LLVMInitializeAllTargets();
    LLVMInitializeAllTargetMCs();
    LLVMInitializeAllAsmParsers();
    LLVMInitializeAllAsmPrinters();

    LLVMContextRef context = LLVMGetGlobalContext();
    LLVMModuleRef module = LLVMModuleCreateWithName("conversion_module");
    LLVMBuilderRef builder = LLVMCreateBuilderInContext(context);

    // 创建char[]数组
    LLVMTypeRef charArrayType = LLVMArrayType(LLVMInt8TypeInContext(context), 14);
    LLVMValueRef array = LLVMAddGlobal(module, charArrayType, "array");
    LLVMSetInitializer(array, LLVMConstString("Hello, World!", 14, 0));
    LLVMSetLinkage(array, LLVMPrivateLinkage);

    // 将char[]数组转换为char*类型的指针
    LLVMValueRef pointer = LLVMBuildBitCast(builder, array, LLVMPointerType(LLVMInt8TypeInContext(context), 0), "pointer");

    // 打印字符串
    LLVMValueRef printfFunction = LLVMGetNamedFunction(module, "printf");
    LLVMValueRef formatString = LLVMBuildGlobalStringPtr(builder, "%s\n", "format_string");
    LLVMValueRef printfArgs[] = { formatString, pointer };
    LLVMBuildCall(builder, printfFunction, printfArgs, 2, "");

    // 返回0
    LLVMBuildRet(builder, LLVMConstInt(LLVMInt32TypeInContext(context), 0, 0));

    // 创建执行引擎
    LLVMExecutionEngineRef engine;
    char* error = NULL;
    LLVMCreateExecutionEngineForModule(&engine, module, &error);

    // 运行main函数
    int (*mainFunctionPtr)() = (int (*)())LLVMGetFunctionAddress(engine, "main");
    int result = mainFunctionPtr();

    // 清理资源
    LLVMDisposeExecutionEngine(engine);
    LLVMDisposeBuilder(builder);
    LLVMDisposeModule(module);
    LLVMContextDispose(context);

    return result;
}
