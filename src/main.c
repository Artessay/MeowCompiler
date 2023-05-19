#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "semantic.h"
#include "ParseTree.h"

extern FILE *yyin;
extern int yyparse();

#define MAX_FILE_NAME 255

int main(int argc, const char *argv[]) {
    char module_name[MAX_FILE_NAME];
    char source_filename[MAX_FILE_NAME];
    char output_filename[MAX_FILE_NAME];

    // argument process
    if (argc >= 2) {
        strncpy(source_filename, argv[1], MAX_FILE_NAME);
    } else {
        strncpy(source_filename, "test.c", MAX_FILE_NAME);
    }

    char *rc = strrchr(source_filename, '.');
    if (rc == NULL) {
        puts("unrecognized file");
        return -1;
    }

    // module name
    strncpy(module_name, source_filename, (rc - source_filename));
    module_name[(rc - source_filename)] = '\0';
    
    // output name
    strcpy(output_filename, module_name);
    strcat(output_filename, ".ll");

    // parsing
    yyin = fopen(source_filename, "r");
    // assert(yyin != nullptr);
    
    puts("[front end] start parsing");
    yyparse();
    puts("[front end] end parsing");

    // puts(module_name);
    // puts(source_filename);
    // puts(output_filename);

    A_topClauseList root = A_getParseTreeRoot();
    assert(root != NULL);

    puts("[front end] start translate to IR");
    SEM_transProgram(root, module_name, output_filename);
    puts("[front end] end translate to IR");
    
    return 0;
}