#ifndef _UTILITY_H_
#define _UTILITY_H_

#include <assert.h>
#include "symbol.h"
#include "ParseTree.h"

#define HASH_MAGIC 65599

unsigned int hash(char *s);

void *checked_malloc(int len);

S_symbol S_getVarSymbol(A_var var);

#endif