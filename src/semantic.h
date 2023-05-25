#ifndef _SEMANTIC_H_
#define _SEMANTIC_H_

#include "ParseTree.h"

#include <llvm-c/Types.h>

LLVMModuleRef SEM_transProgram(A_topClauseList program, char *module_name, char* ir_filename);

#endif