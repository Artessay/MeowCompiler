#ifndef _ASSEMBLE_H_
#define _ASSEMBLE_H_

#include <llvm-c/Types.h>

void AS_emit(LLVMModuleRef module, char *module_name);
void AS_emits(LLVMModuleRef module, char *module_name);

#endif