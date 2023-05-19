#ifndef _TABLE_H_
#define _TABLE_H_

#define TABLE_SIZE 1289

#include "symbol.h"

typedef struct TAB_bucket_ *TAB_bucket;

typedef struct TAB_table_ *TAB_table;

struct TAB_bucket_ {
    char *key;
    void *value;
    struct TAB_bucket_ *next;

    char *previous; // previous key
};

TAB_bucket TAB_Bucket(char *key, void *value, TAB_bucket next, char *prev);

struct TAB_table_ {
    char *top;
    TAB_bucket table[TABLE_SIZE];
};

TAB_table TAB_empty();

void TAB_enter(TAB_table t, char *key, void *value);

void *TAB_look(TAB_table t, char *key);

char *TAB_pop(TAB_table t);

#endif