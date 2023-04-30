#include <assert.h>
#include <stdio.h>
#include <iostream>
#include <string>

#include "ast.h"

using namespace std;

extern FILE *yyin;
extern int yyparse();
extern Node* root;  /** defined in @file parser.y */

