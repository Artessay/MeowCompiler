#include "ParseTree.h"
#include "utility.h"

#include <stdlib.h>

A_topClauseList A_root = NULL;

A_topClauseList A_TopClauseList(A_topClause value, A_topClauseList next) {
	A_topClauseList p = checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}

A_topClause A_FuncDeclare(A_funcDeclare function) {
	A_topClause p = checked_malloc(sizeof(*p));
	p->kind = A_FunctionDeclare;
	p->pos = function->pos;
	p->u.function = function;
	return p;
}

A_varType A_VarTypeBasic(A_pos pos, A_basicType type) {
	A_varType p = checked_malloc(sizeof(*p));
	p->pos = pos;
	p->kind = A_basic;
	p->u.basic = type;
	return p;
}

A_basicType A_BasicType(enum A_BasicType_ type) {
	A_basicType p = checked_malloc(sizeof(*p));
	p->kind = type;
	return p;
}

A_field A_Field(A_pos pos, A_varType typ, S_symbol name) {
	A_field p = checked_malloc(sizeof(*p));
	p->pos = pos;
	p->name = name;
	p->typ = typ;
	return p;
}

A_fieldList A_FieldList(A_field value, A_fieldList next) {
	A_fieldList p = checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}

// A_var A_SimpleVar(A_pos pos, S_symbol sym) {
// 	A_var p = checked_malloc(sizeof(*p));
// 	p->kind = A_simpleVar;
// 	p->pos = pos;
// 	p->u.simple = sym;
// 	return p;
// }

// A_var A_FieldVar(A_pos pos, A_var var, S_symbol sym) {
// 	A_var p = checked_malloc(sizeof(*p));
// 	p->kind = A_fieldVar;
// 	p->pos = pos;
// 	p->u.field.var = var;
// 	p->u.field.sym = sym;
// 	return p;
// }

// A_var A_SubscriptVar(A_pos pos, A_var var, A_exp exp) {
// 	A_var p = checked_malloc(sizeof(*p));
// 	p->kind = A_subscriptVar;
// 	p->pos = pos;
// 	p->u.subscript.var = var;
// 	p->u.subscript.exp = exp;
// 	return p;
// }