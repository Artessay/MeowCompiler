#include "bucket.h"
#include "utility.h"

#include <string.h>
#include <stdlib.h>


struct bucket *Bucket(char *key, void *binding, struct bucket *next) {
    struct bucket *b = checked_malloc(sizeof(*b));
    b->key = key; b->binding = binding; b->next = next;
    return b;
}

void insert(char *key, void *binding) {
    unsigned int index = hash(key) % BUCKET_SIZE;
    table[index] = Bucket(key, binding, table[index]);
}

void *lookup(char *key) {
    unsigned int index = hash(key) % BUCKET_SIZE;
    for (struct bucket *b = table[index]; b != NULL; b = b->next) {
        if (strcmp(b->key, key) == 0) {
            return b->binding;
        }
    }
    return NULL;
}

void pop(char *key) {
    unsigned int index = hash(key) % BUCKET_SIZE;
    struct bucket *b = table[index];
    table[index] = table[index]->next;
    free(b);
}