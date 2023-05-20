#include "ParseTree.h"
#include "utility.h"

#include <stdlib.h>

A_topClauseList A_root = NULL;

void A_setParseTreeRoot(A_topClauseList root) {
	A_root = root;
}

A_topClauseList A_getParseTreeRoot() {
	return A_root;
}

int A_flagVarArg = 0;

void A_setVarArgFlag() {
	A_flagVarArg = 1;
}

void A_resetVarArgFlag() {
	A_flagVarArg = 0;
}

int A_getVarArgFlag() {
	return A_flagVarArg;
}

A_topClauseList A_TopClauseList(A_topClause value, A_topClauseList next) {
	A_topClauseList p = (A_topClauseList)checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}

A_topClause A_FuncDeclare(A_funcDeclare function) {
	A_topClause p = (A_topClause)checked_malloc(sizeof(*p));
	p->kind = A_FunctionDeclare;
	p->pos = function->pos;
	p->u.function = function;
	return p;
}

A_topClause A_VarDeclare(A_varDeclare globalVariable) {
	A_topClause p = (A_topClause)checked_malloc(sizeof(*p));
	p->kind = A_GlobalVarDefine;
	p->pos = globalVariable->pos;
	p->u.globalVar = globalVariable;
	return p;
}

A_funcDeclare A_FuncDeclaration(A_pos pos, A_varType retTyp, S_symbol name, A_argList params, A_stmtList body, int isVarArg) {
	A_funcDeclare p = (A_funcDeclare)checked_malloc(sizeof(*p));
	p->pos = pos;
	p->returnType = retTyp;
	p->name = name;
	p->params = params;
	p->body = body;

	p->isVarArg = isVarArg;
	p->isImplment = body == NULL ? 0 : 1;

	A_resetVarArgFlag();

	return p;
}

A_varDeclare A_VarDeclaration(A_pos pos, A_varType typ, A_varDecList decList) {
	A_varDeclare p = (A_varDeclare)checked_malloc(sizeof(*p));
	p->pos = pos;
	p->typ = typ;
	p->decs = decList;
	return p;
}

A_varDec A_VarDec(A_pos pos, A_var var, A_exp initVal) {
	A_varDec p = (A_varDec)checked_malloc(sizeof(*p));
	p->pos = pos;
	p->var = var;
	p->init = initVal;
	return p;
}

A_varDecList A_VarDecList(A_varDec value, A_varDecList next) {
	A_varDecList p = (A_varDecList)checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
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

A_stmt A_VarDecStmt(A_varDeclare varDec) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_varDecStmt;
	p->pos = varDec->pos;
	p->u.varDec = varDec;
	return p;
}

A_stmt A_CompoundStmt(A_pos pos, A_stmtList stmts) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_compoundStmt;
	p->pos = pos;
	p->u.compound = stmts;
	return p;
}

A_stmt A_IfStmt(A_pos pos, A_exp cond, A_stmt then, A_stmt elsee) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_ifStmt;
	p->pos = pos;
	p->u.iff.condition = cond;
	p->u.iff.then = then;
	p->u.iff.elsee = elsee;
	return p;
}

A_stmt A_WhileStmt(A_pos pos, A_exp cond, A_stmt body) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_whileStmt;
	p->pos = pos;
	p->u.whilee.condition = cond;
	p->u.whilee.body = body;
	return p;
}

A_stmt A_ForStmt(A_pos pos, A_stmt init, A_exp cond, A_exp step, A_stmt body) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_forStmt;
	p->pos = pos;
	p->u.forr.init = init;
	p->u.forr.condition = cond;
	p->u.forr.step = step;
	p->u.forr.body = body;
	return p;
}

A_stmt A_BreakStmt(A_pos pos) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_breakStmt;
	p->pos = pos;
	return p;
}

A_stmt A_ContinueStmt(A_pos pos) {
	A_stmt p = (A_stmt)checked_malloc(sizeof(*p));
	p->kind = A_continueStmt;
	p->pos = pos;
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
	A_expList p = (A_expList)checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}

A_exp A_VarExp(A_pos pos, A_var var) {
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_varExp;
	p->pos = pos;
	p->typ = var->typ;
	p->u.var = var;
	return p;
}

A_exp A_AssignExp(A_pos pos, A_var var, A_exp exp) {
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_assignExp;
	p->pos = pos;
	p->typ = var->typ;
	p->u.assign.var = var;
	p->u.assign.exp = exp;
	return p;
}

A_varType A_NilTyp() {
	A_varType p = (A_varType)checked_malloc(sizeof(*p));
	p->kind = A_basic;
	p->u.basic = A_voidType;
	return p;
}

A_exp A_NilExp(A_pos pos)
{
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_nilExp;
	p->pos = pos;
	p->typ = A_NilTyp();
	return p;
}

A_varType A_IntTyp() {
	A_varType p = (A_varType)checked_malloc(sizeof(*p));
	p->kind = A_basic;
	p->u.basic = A_intType;
	return p;
}

A_exp A_IntExp(A_pos pos, int i)
{
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_intExp;
	p->pos = pos;
	p->typ = A_IntTyp();
	p->u.intt = i;
	return p;
}

A_varType A_CharTyp() {
	A_varType p = (A_varType)checked_malloc(sizeof(*p));
	p->kind = A_basic;
	p->u.basic = A_charType;
	return p;
}

A_exp A_CharExp(A_pos pos, char c)
{
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_charExp;
	p->pos = pos;
	p->typ = A_CharTyp();
	p->u.charr = c;
	return p;
}

A_varType A_DoubleTyp() {
	A_varType p = (A_varType)checked_malloc(sizeof(*p));
	p->kind = A_basic;
	p->u.basic = A_doubleType;
	return p;
}

A_exp A_DoubleExp(A_pos pos, double d)
{
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_doubleExp;
	p->pos = pos;
	p->typ = A_DoubleTyp();
	p->u.doublee = d;
	return p;
}

A_varType A_StringTyp() {
	A_varType p = (A_varType)checked_malloc(sizeof(*p));
	p->kind = A_basic;
	p->u.basic = A_stringType;
	return p;
}

A_exp A_StringExp(A_pos pos, char *s)
{
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_stringExp;
	p->pos = pos;
	p->typ = A_StringTyp();
	p->u.stringg = s;
	return p;
}

A_exp A_CallExp(A_pos pos, S_symbol func, A_expList args)
{
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_callExp;
	p->pos = pos;
	p->typ = NULL;	// @TODO
	p->u.call.func = func;
	p->u.call.args = args;
	return p;
}

A_exp A_OpExp(A_pos pos, A_oper oper, A_exp left, A_exp right) {
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_opExp;
	p->pos = pos;
	p->u.op.oper = oper;
	p->u.op.left = left;
	p->u.op.right = right;
	return p;
}

// === var ===

A_varType A_VarTypeBasic(A_pos pos, enum A_BasicType_ type) {
	A_varType p = (A_varType)checked_malloc(sizeof(*p));
	p->pos = pos;
	p->kind = A_basic;
	p->u.basic = type;
	return p;
}

// A_basicType A_BasicType(enum A_BasicType_ type) {
// 	A_basicType p = (A_basicType)checked_malloc(sizeof(*p));
// 	p->kind = type;
// 	return p;
// }

A_field A_Field(A_pos pos, A_varType typ, S_symbol name) {
	A_field p = (A_field)checked_malloc(sizeof(*p));
	p->pos = pos;
	p->name = name;
	p->typ = typ;
	return p;
}

A_fieldList A_FieldList(A_field value, A_fieldList next) {
	A_fieldList p = (A_fieldList)checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}

A_arg A_Arg(A_pos pos, A_varType typ, A_var var) {
	A_arg p = (A_arg)checked_malloc(sizeof(*p));
	p->pos = pos;
	p->typ = typ;
	p->var = var;
	return p;
}

A_argList A_ArgList(A_arg value, A_argList next) {
	A_argList p = (A_argList)checked_malloc(sizeof(*p));
	p->value = value;
	p->next = next;
	return p;
}

A_var A_SimpleVar(A_pos pos, S_symbol sym) {
	A_var p = (A_var)checked_malloc(sizeof(*p));
	p->kind = A_simpleVar;
	p->pos = pos;
	p->u.simple = sym;
	return p;
}

A_var A_FieldVar(A_pos pos, A_var var, S_symbol sym) {
	A_var p = (A_var)checked_malloc(sizeof(*p));
	p->kind = A_fieldVar;
	p->pos = pos;
	p->u.field.var = var;
	p->u.field.sym = sym;
	return p;
}

A_var A_SubscriptVar(A_pos pos, A_var var, A_exp exp) {
	A_var p = (A_var)checked_malloc(sizeof(*p));
	p->kind = A_subscriptVar;
	p->pos = pos;
	p->u.subscript.var = var;
	p->u.subscript.exp = exp;
	return p;
}

A_var A_PointVar(A_pos pos, A_var var) {
	A_var p = (A_var)checked_malloc(sizeof(*p));
	p->kind = A_pointVar;
	p->pos = pos;
	p->u.point = var;
	return p;
}