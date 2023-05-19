#include "table.h"
#include "utility.h"

#include <assert.h>
#include <string.h>
#include <stdlib.h>

TAB_bucket TAB_Bucket(char *key, void *value, TAB_bucket next, char *prev) {
    TAB_bucket b = (TAB_bucket)checked_malloc(sizeof(*b));
    b->key = key; b->value = value; b->next = next; b->previous = prev;
    return b;
}

TAB_table TAB_empty() {
    TAB_table t = (TAB_table)checked_malloc(sizeof(*t));
    
    t->top = NULL;
    for (int i = 0; i < TABLE_SIZE; ++i) {
        t->table[i] = NULL;
    }

    return t;
}

void TAB_enter(TAB_table t, char *key, void *value) {
    assert(t && key);

    unsigned int index = hash(key) % TABLE_SIZE;
    t->table[index] = TAB_Bucket(key, value, t->table[index], t->top);
    t->top = key;
}

void *TAB_look(TAB_table t, char *key) {
    assert(t && key);

    unsigned int index = hash(key) % TABLE_SIZE;
    for (TAB_bucket b = t->table[index]; b != NULL; b = b->next) {
        if (strcmp(b->key, key) == 0) {
            return b->value;
        }
    }
    return NULL;
}

char *TAB_pop(TAB_table t) {
    assert(t);

    char *key = t->top;
    assert(key);

    unsigned int index = hash(key) % TABLE_SIZE;
    TAB_bucket b = t->table[index];
    assert(b);

    t->table[index] = b->next;
    t->top = b->previous;

    return b->key;
}