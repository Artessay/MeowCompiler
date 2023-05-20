#include "ErrorMessage.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

int EM_tokPos = 0;

void EM_setTokenPos(int pos) {
    EM_tokPos = pos;
}

void EM_error(int pos, char *message, ...) {
    va_list ap;
    
    //@todo

    va_start(ap, message);
    vfprintf(stderr, message, ap);
    va_end(ap);
    fprintf(stderr, "\n");
}