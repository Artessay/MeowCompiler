#ifndef _WALKER_H_
#define _WALKER_H_

#include <iostream>
#include <string>
#include <vector>
#include <memory>
#include <map>
#include <stack>
#include <set>
#include <algorithm>
#include <assert.h>
#include "ast.h"
#include "Table.hpp"

using namespace std;

class Walker {
    public:
        Walker(Node *root) {
            astTree = root;
        }

        virtual ~Walker() {
            // nothing to do
        }

        void walk(Node* root) {
            if (root->Type == Program_) {
                cout << "Program_" << endl;
            } else if (root->Type == Define_) {
                cout << "Define_" << endl;
            } else if (root->Type == TYPE_VOID_) {
                cout << "TYPE_VOID_" << endl;
            } else if (root->Type == TYPE_INT_) {
                cout << "TYPE_INT_" << endl;
            } else if (root->Type == TYPE_CHAR_) {
                cout << "TYPE_CHAR_" << endl;
            } else if (root->Type == TYPE_STRING_) {
                cout << "TYPE_STRING_" << endl;
            } else if (root->Type == TYPE_DOUBLE_) {
                cout << "TYPE_DOUBLE_" << endl;
            } else if (root->Type == Declarator_) {
                cout << "Declarator_" << endl;
            } else if (root->Type == INT_) {
                cout << "INT_" << endl;
            } else if (root->Type == Params_) {
                cout << "Params_" << endl;
            } else if (root->Type == Param_) {
                cout << "Param_" << endl;
            } else if (root->Type == Var_Declaration_) {
                cout << "Var_Declaration_" << endl;
            } else if (root->Type == Func_Prototype_) {
                cout << "Func_Prototype_" << endl;
            } else if (root->Type == Func_Declaration_) {
                cout << "Func_Declaration_" << endl;
            } else if (root->Type == Block_Items_) {
                cout << "Block_Items_" << endl;
            } else if (root->Type == Block_) {
                cout << "Block_" << endl;
            } else if (root->Type == Selection_Stmt_) {
                cout << "Selection_Stmt_" << endl;
            } else if (root->Type == For_Stmt_) {
                cout << "For_Stmt_" << endl;
            } else if (root->Type == While_Stmt_) {
                cout << "While_Stmt_" << endl;
            } else if (root->Type == Return_Stmt_) {
                cout << "Return_Stmt_" << endl;
            } else if (root->Type == DOUBLE_) {
                cout << "DOUBLE_" << endl;
            } else if (root->Type == CHAR_) {
                cout << "CHAR_" << endl;
            } else if (root->Type == STRING_) {
                cout << "STRING_" << endl;
            } else if (root->Type == ADDAS_) {
                cout << "ADDAS_" << endl;
            }
        }

        void walkTop() {
            for (auto node : astTree->children) {
                switch(astTree->Type) {
                    // preprocessing 预处理
                    case Define_:
                        //@TODO
                        break;
                    
                    // declaration
                    case Var_Declaration_:
                        walkVarDeclaration(node);
                }
            }
            
        }
    
    protected:
        void walkVarDeclaration(Node* root) {
            ;
        }
    private:
        Node *astTree;
};

#endif