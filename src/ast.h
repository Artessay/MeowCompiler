#ifndef AST_H
#define AST_H
#include <iostream>
#include <string>
#include <vector>
#include <memory>
using namespace std;

enum node_type{
	Program_,
	Define_,
	TYPE_VOID_,
	TYPE_INT_,
	TYPE_CHAR_,
	TYPE_STRING_,
	TYPE_DOUBLE_,
	Declarator_,
	INT_,
	Params_,
	Param_,
	Func_Prototype_,
	Func_Declaration_,
	Block_Items_,
	Selection_Stmt_,
	For_Stmt_,
	While_Stmt_,
	Return_Stmt_,
	DOUBLE_,
	CHAR_,
	STRING_,
	ADDAS_,
	SUBAS_,
	MULAS_,
	DIVAS_,
	MODAS_,
	SHLAS_,
	SHRAS_,
	BANDAS_,
	BORAS_,
	BXORAS_,
	LUOP_,
	RUOP_,
	NOT_,
	DADD_,
	DSUB_,
	Array_Exp_,
	Var_Exp_,
	Call_Exp_,
	Arg_,
	ADD_,
	SUB_,
	MUL_,
	DIV_,
	LE_,
	LT_,
	GT_,
	GE_,
	EQ_,
	NEQ_,
	ASSIGN_,
	BREAK_,
	MOD_,
	If_Stmt_,
	IfElse_Stmt_,
	IfElseif_Stmt_,
	ElseIf_,
	IfElseifElse_Stmt_,
	TYPE_CHANGE_,
	CONTINUE_,
	Expression_OR_,
	Expression_AND_
};

struct value{
	int ivalue;
	double dvalue;
	char chvalue;
	string strvalue;
};

class Node{
public:
	node_type Type;
	struct value Value;
	vector<Node*> children;
	int pointer = 0;//set 1 if pointer
	int isvoid = 0;//set 1 if void
	int isconst = 0;//set 1 if const

	Node(){}
	Node(node_type type)
    {
		Type = type;
    }
	Node(int value, node_type type)
	{
		Value.ivalue = value;
		Type = type;
	}
	Node(double value, node_type type)
	{
		Value.dvalue = value;
		Type = type;
	}
	Node(char value, node_type type)
	{
		Value.chvalue = value;
		Type = type;
	}
	Node(string value, node_type type)
	{
		Value.strvalue = value;
		Type = type;
	}
	void setType(node_type type)
	{
		Type = type;
	}
	void setValue(int value)
	{
		Value.ivalue = value;
	}
	void setValue(double value)
	{
		Value.dvalue = value;
	}
	void setValue(char value)
	{
		Value.chvalue = value;
	}
	void setValue(string value)
	{
		Value.strvalue = value;
	}
	void setPointer(void)
	{
		pointer = 1;
	}
	void setVoid(void)
	{
		isvoid = 1;
	}
	void setConst(void)
	{
		isconst = 1;
	}
};


#endif