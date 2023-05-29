#ifndef _ASSEMBLE_H_
#define _ASSEMBLE_H_

#include <llvm-c/Types.h>

void AS_assemble(char *ir_filename, char *asm_filename);

void AS_emits(char *asm_filename, char *executable_filename);

#endif