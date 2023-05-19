#include "utility.h"

#include <stdlib.h>

unsigned int hash(char *s) {
    unsigned int h = 0;
    for (char *p = s; *p; ++p) {
        h = h * HASH_MAGIC + *p;
    }
    return h;
}

void *checked_malloc(int len) {
    void *p = malloc(len);
    assert(p);
    return p;
}