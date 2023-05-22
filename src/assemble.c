#include <string.h>
#include <stdlib.h>

#include <llvm-c/Core.h>
#include <llvm-c/TargetMachine.h>

#include "utility.h"

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