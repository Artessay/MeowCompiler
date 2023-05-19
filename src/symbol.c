#include "symbol.h"
#include "bucket.h"
#include "table.h"
#include "utility.h"

#include <string.h>

#define SYMBOL_TABLE_SIZE 109 // 1289

static S_symbol hashtable[SYMBOL_TABLE_SIZE];

static S_symbol mksymbol(char *name, S_symbol next)
{
	S_symbol s = (S_symbol)checked_malloc(sizeof(*s));
	s->name = strdup(name);
	s->next = next;
	return s;
}

S_symbol S_Symbol(char *name) {
    unsigned int index = hash(name) % SYMBOL_TABLE_SIZE;
    S_symbol syms = hashtable[index];
	
    for (S_symbol sym = syms; sym; sym = sym->next) {
        if (strcmp(sym->name, name) == 0) {
            return sym;
        }
    }
	
    S_symbol sym = mksymbol(name, syms);
	hashtable[index] = sym;
	return sym;
}

char *S_name(S_symbol symbol) {
    return symbol->name;
}