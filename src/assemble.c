#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <llvm-c/Core.h>
#include <llvm-c/TargetMachine.h>

#include "assemble.h"
#include "utility.h"


void AS_emits(LLVMModuleRef module, char *module_name) {
    char *input_filename = (char *)checked_malloc(strlen(module_name) + 4);
    strcpy(input_filename, module_name);
    strcat(input_filename, ".ll");

    char *output_filename = (char *)checked_malloc(strlen(module_name) + 4);
    strcpy(output_filename, module_name);
    strcat(output_filename, ".o");

    // 构建命令字符串
    const char* llcCommandFormat = "llc -filetype=obj %s -o %s";
    int commandBufferSize = snprintf(NULL, 0, llcCommandFormat, input_filename, output_filename);
    char* commandBuffer = (char*)malloc(commandBufferSize + 1);
    snprintf(commandBuffer, commandBufferSize + 1, llcCommandFormat, input_filename, output_filename);

    // 执行命令
    int result = system(commandBuffer);
    if (result != 0) {
        printf("llc command failed.\n");
    }

    // 释放资源
    free(commandBuffer);
    
    // LLVMTargetMachineEmitToFile(targetMachine, module, output_filename, LLVMObjectFile, NULL);
    
    free(output_filename);
}

void AS_emit(LLVMModuleRef module, char *module_name) {
    LLVMInitializeAllTargetInfos();
    LLVMInitializeAllTargets();
    LLVMInitializeAllTargetMCs();
    LLVMInitializeAllAsmParsers();
    LLVMInitializeAllAsmPrinters();

    LLVMTargetRef target;
    const char* targetTriple = LLVMGetDefaultTargetTriple();
    LLVMGetTargetFromTriple(targetTriple, &target, NULL);

    LLVMCodeGenOptLevel optLevel = LLVMCodeGenLevelDefault;
    LLVMRelocMode relocMode = LLVMRelocDefault;
    LLVMCodeModel codeModel = LLVMCodeModelDefault;
    LLVMTargetMachineRef targetMachine = LLVMCreateTargetMachine(target, targetTriple, "", "", optLevel, relocMode, codeModel);
    
    char *output_filename = (char *)checked_malloc(strlen(module_name) + 4);
    strcpy(output_filename, module_name);
    strcat(output_filename, ".o");

    LLVMTargetMachineEmitToFile(targetMachine, module, output_filename, LLVMObjectFile, NULL);
    
    free(output_filename);
}