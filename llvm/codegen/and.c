#include <llvm-c/Core.h>
#include <stdio.h>

int main() {
    // 创建 LLVM 上下文和基本块
    LLVMContextRef context = LLVMGetGlobalContext();
    LLVMModuleRef module = LLVMModuleCreateWithNameInContext("logic_and_module", context);
    LLVMBuilderRef builder = LLVMCreateBuilderInContext(context);
    LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlockInContext(context, LLVMGetEntryBasicBlock(LLVMGetFirstFunction(module)), "entry");

    // 在 entry 基本块中生成代码
    LLVMPositionBuilderAtEnd(builder, entryBlock);

    // 创建两个整数值作为操作数
    LLVMValueRef op1 = LLVMConstInt(LLVMInt1TypeInContext(context), 1, 0);
    LLVMValueRef op2 = LLVMConstInt(LLVMInt1TypeInContext(context), 0, 0);

    // 执行按位与操作
    LLVMValueRef andResult = LLVMBuildAnd(builder, op1, op2, "andResult");

    // 创建条件操作符，实现逻辑与操作
    LLVMValueRef condition = LLVMBuildICmp(builder, LLVMIntNE, op1, LLVMConstNull(LLVMTypeOf(op1)), "condition");
    LLVMValueRef logicalAndResult = LLVMBuildSelect(builder, condition, andResult, LLVMConstNull(LLVMTypeOf(andResult)), "logicalAndResult");

    // 输出结果
    LLVMBuildCall(builder, LLVMGetNamedFunction(module, "printf"), &logicalAndResult, 1, "");

    // 构建 main 函数返回
    LLVMBuildRet(builder, LLVMConstNull(LLVMInt32TypeInContext(context)));

    // 打印生成的 LLVM IR
    char *irStr = LLVMPrintModuleToString(module);
    printf("%s\n", irStr);
    LLVMDisposeMessage(irStr);

    // 释放资源
    LLVMDisposeBuilder(builder);
    LLVMDisposeModule(module);

    return 0;
}
