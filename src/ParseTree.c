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

A_topClause A_VarDeclare(A_varDeclare globalVariable) {
	A_topClause p = checked_malloc(sizeof(*p));
	p->kind = A_GlobalVarDefine;
	p->pos = globalVariable->pos;
	p->u.globalVar = globalVariable;
	return p;
}

A_funcDeclare A_FuncDeclaration(A_pos pos, A_varType retTyp, S_symbol name, A_fieldList params, A_funcImplment body) {
	A_funcDeclare p = (A_funcDeclare)checked_malloc(sizeof(*p));
	p->pos = pos;
	p->returnType = retTyp;
	p->name = name;
	p->params = params;
	p->body = body;

	p->escape = body == NULL ? 0 : 1;

	return p;
}

A_varDeclare A_VarDeclaration(A_pos pos, A_varType typ, S_symbol name) {
	A_varDeclare p = (A_varDeclare)checked_malloc(sizeof(*p));
	p->pos = pos;
	p->typ = typ;
	p->name = name;
	return p;
}

A_stmtList A_StmtList(A_stmt value, A_stmtList next) {
	A_stmtList p = (A_stmtList)checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}

A_stmt A_ExprStmt(A_pos pos, A_exp exp) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_expStmt;
	p->pos = pos;
	p->u.exp = exp;
	return p;
}

A_stmt A_ReturnStmt(A_pos pos, A_exp exp) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_returnStmt;
	p->pos = pos;
	p->u.returnn.exp = exp;
	return p;
}

// === exp ===

A_expList A_ExpList(A_exp value, A_expList next) {
	A_expList p = checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}

A_exp A_AssignExp(A_pos pos, A_var var, A_exp exp) {
	A_exp p = checked_malloc(sizeof(*p));
	p->kind = A_assignExp;
	p->pos = pos;
	p->u.assign.var = var;
	p->u.assign.exp = exp;
	return p;
}

A_exp A_NilExp(A_pos pos)
{
	A_exp p = checked_malloc(sizeof(*p));
	p->kind = A_nilExp;
	p->pos = pos;
	return p;
}

A_exp A_IntExp(A_pos pos, int i)
{
	A_exp p = checked_malloc(sizeof(*p));
	p->kind = A_intExp;
	p->pos = pos;
	p->u.intt = i;
	return p;
}

A_exp A_CharExp(A_pos pos, char c)
{
	A_exp p = checked_malloc(sizeof(*p));
	p->kind = A_charExp;
	p->pos = pos;
	p->u.charr = c;
	return p;
}

A_exp A_DoubleExp(A_pos pos, double d)
{
	A_exp p = checked_malloc(sizeof(*p));
	p->kind = A_doubleExp;
	p->pos = pos;
	p->u.doublee = d;
	return p;
}

A_exp A_StringExp(A_pos pos, char *s)
{
	A_exp p = checked_malloc(sizeof(*p));
	p->kind = A_stringExp;
	p->pos = pos;
	p->u.stringg = s;
	return p;
}

A_exp A_CallExp(A_pos pos, S_symbol func, A_expList args)
{
	A_exp p = checked_malloc(sizeof(*p));
	p->kind = A_callExp;
	p->pos = pos;
	p->u.call.func = func;
	p->u.call.args = args;
	return p;
}

A_exp A_OpExp(A_pos pos, A_oper oper, A_exp left, A_exp right) {
	A_exp p = checked_malloc(sizeof(*p));
	p->kind = A_opExp;
	p->pos = pos;
	p->u.op.oper = oper;
	p->u.op.left = left;
	p->u.op.right = right;
	return p;
}

// === var ===

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