#ifndef _BUCKET_H_
#define _BUCKET_H_

#define BUCKET_SIZE 1289

struct bucket {
    char *key;
    void *binding;
    struct bucket *next;
};

struct bucket *table[BUCKET_SIZE];

struct bucket *Bucket(char *key, void *binding, struct bucket *next);

void insert(char *key, void *binding);

void *lookup(char *key);

void pop(char *key);

#endif