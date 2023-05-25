#ifndef _ASSEMBLE_H_
#define _ASSEMBLE_H_

#include <llvm-c/Types.h>

void AS_emit(LLVMModuleRef module, char *ir_filename);

void AS_emits(char *ir_filename, char *asm_filename);

void AS_assemble(char *asm_filename, char *executable_filename);

#endif