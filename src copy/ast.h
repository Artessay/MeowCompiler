#ifndef AST_H
#define AST_H
#include <iostream>
#include <string>
#include <vector>
#include <memory>
using namespace std;

// 定义节点类型
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
	Var_Declaration_,
	Func_Prototype_,
	Func_Declaration_,
	Block_Items_,
	Block_,
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

// 定义值类型
struct value{
	int ivalue;
	double dvalue;
	char chvalue;
	string strvalue;
};

// AST节点
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

	void print(int depth)
	{
		for (int i = 0; i < depth; ++i) {
			putchar(' ');
			putchar(' ');
		}
		
		cout << pprintNodeType(Type) << endl;

		for (auto p : children) {
			p->print(depth+1);
		}
	}

private:
	string pprintNodeType(enum node_type type_) {
		switch(type_) {
			case Program_:
				return ("Program");
				break;
			case Define_:
				return ("Define");
				break;
			case TYPE_VOID_:
				return ("void");
				break;
			case TYPE_INT_:
				return ("int");
				break;
			case TYPE_CHAR_:
				return ("char");
				break;
			case TYPE_STRING_:
				return ("string");
				break;
			case TYPE_DOUBLE_:
				return ("double");
				break;
			case Declarator_:
				return ("Declarator");
				break;
			case INT_:
				return ("INT_");
				break;
			case Params_:
				return ("params");
				break;
			case Param_:
				return ("param");
				break;
			case Var_Declaration_:
				return ("variable declaration");
				break;
			case Func_Prototype_:
				return ("function prototype");
				break;
			case Func_Declaration_:
				return ("function declaration");
				break;
			case Block_:
				return ("block");
				break;
			case Block_Items_:
				return ("block items");
				break;
			case Selection_Stmt_:
				return ("selection");
				break;
			case For_Stmt_:
				return ("for");
				break;
			case While_Stmt_:
				return ("while");
				break;
			case Return_Stmt_:
				return ("return");
				break;
			case DOUBLE_:
				return ("DOUBLE_");
				break;
			case CHAR_:
				return ("CHAR_");
				break;
			case STRING_:
				return ("STRING_");
				break;
			case ADDAS_:
				return ("+=");
				break;
			case SUBAS_:
				return ("-=");
				break;
			case MULAS_:
				return ("*=");
				break;
			case DIVAS_:
				return ("/=");
				break;
			case MODAS_:
				return ("%=");
				break;
			case SHLAS_:
				return ("<<=");
				break;
			case SHRAS_:
				return (">>=");
				break;
			case BANDAS_:
				return ("&=");
				break;
			case BORAS_:
				return ("|=");
				break;
			case BXORAS_:
				return ("^=");
				break;
			case LUOP_:
				return ("left unary op");
				break;
			case RUOP_:
				return ("right unary op");
				break;
			case NOT_:
				return ("!");
				break;
			case DADD_:
				return ("++");
				break;
			case DSUB_:
				return ("--");
				break;
			case Array_Exp_:
				return ("array exp");
				break;
			case Var_Exp_:
				return ("var exp");
				break;
			case Call_Exp_:
				return ("call exp");
				break;
			case Arg_:
				return ("arg");
				break;
			case ADD_:
				return ("+");
				break;
			case SUB_:
				return ("-");
				break;
			case MUL_:
				return ("*");
				break;
			case DIV_:
				return ("/");
				break;
			case LE_:
				return ("<=");
				break;
			case LT_:
				return ("<");
				break;
			case GT_:
				return (">");
				break;
			case GE_:
				return (">=");
				break;
			case EQ_:
				return ("==");
				break;
			case NEQ_:
				return ("!=");
				break;
			case ASSIGN_:
				return ("=");
				break;
			case BREAK_:
				return ("break");
				break;
			case MOD_:
				return ("%");
				break;
			case If_Stmt_:
				return ("if");
				break;
			case IfElse_Stmt_:
				return ("if else");
				break;
			case IfElseif_Stmt_:
				return ("if elseif");
				break;
			case ElseIf_:
				return ("elseif");
				break;
			case IfElseifElse_Stmt_:
				return ("if elseif else");
				break;
			case TYPE_CHANGE_:
				return ("type change");
				break;
			case CONTINUE_:
				return ("continue");
				break;
			case Expression_OR_:
				return ("or");
				break;
			case Expression_AND_:
				return ("and");
				break;
			default:
				return "[Error] Unrecognized Type";
		}
	}
};


#endif