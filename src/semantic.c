#include "semantic.h"

#include <stdio.h>

#include <llvm-c/Core.h>
#include <llvm-c/Target.h>

extern char *module_name;
extern char *source_filename;
extern char *output_filename;

void SEM_transProgram(A_topClause program) {
    // initial LLVM
    LLVMInitializeCore(LLVMGetGlobalPassRegistry());
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();

    // create LLVM context
    LLVMContextRef context = LLVMContextCreate();

    // create module
    LLVMModuleRef module = LLVMModuleCreateWithNameInContext(module_name, context);

    ;

    // print module content
    LLVMDumpModule(module);

    LLVMPrintModuleToFile(module, output_filename, NULL);

    // dispose LLVM context
    LLVMContextDispose(context);
    
    // dispose LLVM module
    LLVMDisposeModule(module);
}