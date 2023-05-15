#include <assert.h>
#include <stdio.h>
#include <iostream>
#include <string>

#include "ast.h"
#include "Walker.hpp"

using namespace std;

extern FILE *yyin;
extern int yyparse();
extern Node* root;  /** defined in @file parser.y */

int main(int argc, const char *argv[]) {
    const char *source = "test.c";
    if (argc >= 2) {
        source = argv[1];
    }

    // 打开输入文件, 并且指定 lexer 在解析的时候读取这个文件
    yyin = fopen(source, "r");
    assert(yyin != nullptr);
    
    yyparse();
    assert(root != nullptr);
    
    // @debug
    // cout << "[parse] success" << endl;
    // root->print(0);
    // cout << "[print] success" << endl;

    Walker *walker = new Walker(root);
    walker->walkTop();
    delete walker;
    
    return 0;
}