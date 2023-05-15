#ifndef _BUCKET_H_
#define _BUCKET_H_

#define BUCKET_SIZE 1289

struct bucket {
    char *key;
    void *binding;
    struct bucket *next;
};

struct bucket *table[BUCKET_SIZE];



#endif