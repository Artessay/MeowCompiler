#include "ErrorMessage.h"

#include "list.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

int EM_tokPos = 0;

static char *file_name = "";

static int line_number;

static List line_pos_list = NULL;

void EM_reset(char *file) {
    file_name = strdup(file);
    line_number = 1;
    line_pos_list = create_list();
}

void EM_setTokenPos(int pos) {
    EM_tokPos = pos;
}

int EM_getTokenPos() {
    return EM_tokPos;
}

void EM_newline() {
    line_number++;
    line_pos_list = prepend(line_pos_list, EM_tokPos);
}

void EM_error(int pos, char *message, ...) {
    va_list ap;
    
    int current_line_number = line_number;
    Node *current_line_pos = line_pos_list->head;

    while (current_line_pos != NULL && current_line_number >= pos) {
        current_line_pos = current_line_pos->next;
        current_line_number--;
    }

    fprintf(stderr, "%s:%d.%d: ", file_name, current_line_number, pos - current_line_pos->data);

    va_start(ap, message);
    vfprintf(stderr, message, ap);
    va_end(ap);
    fprintf(stderr, "\n");
}