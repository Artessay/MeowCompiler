#include "ParseTree.h"
#include "utility.h"

#include <stdlib.h>

A_topClauseList A_root = NULL;

A_var A_SimpleVar(A_pos pos, S_symbol sym) {
	A_var p = checked_malloc(sizeof(*p));
	p->kind = A_simpleVar;
	p->pos = pos;
	p->u.simple = sym;
	return p;
}

A_var A_FieldVar(A_pos pos, A_var var, S_symbol sym) {
	A_var p = checked_malloc(sizeof(*p));
	p->kind = A_fieldVar;
	p->pos = pos;
	p->u.field.var = var;
	p->u.field.sym = sym;
	return p;
}

A_var A_SubscriptVar(A_pos pos, A_var var, A_exp exp) {
	A_var p = checked_malloc(sizeof(*p));
	p->kind = A_subscriptVar;
	p->pos = pos;
	p->u.subscript.var = var;
	p->u.subscript.exp = exp;
	return p;
}

A_topClause A_TopClause(A_pos pos, S_symbol sym, A_funcDeclare funcDeclare, A_funcImplment funcImplment, A_define define) {
	A_topClause p = checked_malloc(sizeof(*p));
	p->pos = pos;
	p->sym = sym;
	p->funcDeclare = funcDeclare;
	p->funcImplment = funcImplment;
	p->define = define;
	return p;
}

A_topClauseList A_TopClauseList(A_topClause value, A_topClause next) {
	A_topClauseList p = checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}