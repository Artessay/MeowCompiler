#include <assert.h>
#include <stdio.h>
#include <iostream>
#include <string>

#include "ast.h"

using namespace std;

extern FILE *yyin;
extern int yyparse();
extern Node* root;  /** defined in @file parser.y */

int main(int argc, const char *argv[]) {
    // 打开输入文件, 并且指定 lexer 在解析的时候读取这个文件
    yyin = fopen("test.c", "r");
    assert(yyin != nullptr);
    
    yyparse();
    assert(root != nullptr);
    
    cout << "[parse] success" << endl;

    root->print(0);
    
    cout << "[print] success" << endl;
    
    return 0;
}