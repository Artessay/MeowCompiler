#ifndef _UTILITY_H_
#define _UTILITY_H_

#include <assert.h>

#define HASH_MAGIC 65599

unsigned int hash(char *s);

void *checked_malloc(int len);

#endif