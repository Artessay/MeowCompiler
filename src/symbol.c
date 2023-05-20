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

/** Table operation */

S_table S_empty() {
    return TAB_empty();
}

void S_enter(S_table table, S_symbol sym, LLVMValueRef value) {
    TAB_enter(table, S_name(sym), (void *)value);
}

LLVMValueRef S_look(S_table table, S_symbol sym) {
    return (LLVMValueRef)TAB_look(table, S_name(sym));
}

/** Defien a mark symbol used to mark the end of one scope */
static char *markSymbol = "<mark>";

void S_beginScope(S_table table) {
    TAB_enter(table, markSymbol, NULL);
}

void S_endScope(S_table table) {
    char *mark;
    do {
        mark = TAB_pop(table);
    } while (mark != markSymbol);
}