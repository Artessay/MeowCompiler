#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <llvm-c/Core.h>
#include <llvm-c/TargetMachine.h>

#include "assemble.h"
#include "utility.h"


void AS_emits(char *ir_filename, char *asm_filename) {
    // construct command
    const char* llcCommandFormat = "llc -filetype=obj %s -o %s";
    int commandBufferSize = snprintf(NULL, 0, llcCommandFormat, ir_filename, asm_filename);
    char* commandBuffer = (char*)malloc(commandBufferSize + 1);
    snprintf(commandBuffer, commandBufferSize + 1, llcCommandFormat, ir_filename, asm_filename);

    // execute command
    int result = system(commandBuffer);
    if (result != 0) {
        printf("llc command failed.\n");
    }

    // release resource
    free(commandBuffer);
}

void AS_assemble(char *asm_filename, char *executable_filename) {
    // construct command
    const char* clangCommandFormat = "clang %s -o %s -no-pie";
    int commandBufferSize = snprintf(NULL, 0, clangCommandFormat, asm_filename, executable_filename);
    char* commandBuffer = (char*)malloc(commandBufferSize + 1);
    snprintf(commandBuffer, commandBufferSize + 1, clangCommandFormat, asm_filename, executable_filename);

    // execute command
    int result = system(commandBuffer);
    if (result != 0) {
        printf("clang command failed.\n");
    }

    // release resource
    free(commandBuffer);
}

void AS_emit(LLVMModuleRef module, char *ir_filename) {
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
    
    char *output_filename = (char *)checked_malloc(strlen(ir_filename) + 4);
    strcpy(output_filename, ir_filename);
    strcat(output_filename, ".o");

    LLVMTargetMachineEmitToFile(targetMachine, module, output_filename, LLVMObjectFile, NULL);
    
    free(output_filename);
}