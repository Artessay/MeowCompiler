#ifndef _ASSEMBLE_H_
#define _ASSEMBLE_H_

#include <llvm-c/Types.h>

void AS_emit(LLVMModuleRef module, char *ir_filename);
void AS_emits(LLVMModuleRef module, char *ir_filename, char *asm_filename);

#endif