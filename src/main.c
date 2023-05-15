#include <assert.h>
#include <stdio.h>


extern FILE *yyin;
extern int yyparse();

int main(int argc, const char *argv[]) {
    yyin = fopen("test.c", "r");
    // assert(yyin != nullptr);
    
    yyparse();
    // assert(root != nullptr);
    
    
    
    return 0;
}