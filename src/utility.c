#include "utility.h"

#include <stdlib.h>

void *checked_malloc(int len) {
    void *p = malloc(len);
    assert(p);
    return p;
}

unsigned int hash(char *s0)
{
	unsigned int h = 0;
	char *s;
	for (s = s0; *s; s++)
		h = h * 65599 + *s;
	return h;
}