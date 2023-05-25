#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "config.h"
#include "assemble.h"
#include "semantic.h"
#include "ParseTree.h"
#include "preprocess.h"

extern FILE *yyin;
extern int yyparse();

int main(int argc, const char *argv[]) {
    char module_name[MAX_FILE_LENGTH];
    char source_filename[MAX_FILE_LENGTH];
    char pp_filename[MAX_FILE_LENGTH];
    char ir_filename[MAX_FILE_LENGTH];
    char asm_filename[MAX_FILE_LENGTH];

    // argument process
    if (argc >= 2) {
        strncpy(source_filename, argv[1], MAX_FILE_LENGTH);
    } else {
        puts("[error] no input files");
        return -1;
    }

    char *rc = strrchr(source_filename, '.');
    if (rc == NULL) {
        puts("[error] unrecognized file");
        return -1;
    }

    // module name
    strncpy(module_name, source_filename, (rc - source_filename));
    module_name[(rc - source_filename)] = '\0';

    // file name
    strncpy(pp_filename, module_name, MAX_FILE_LENGTH);
    strcat(pp_filename, ".i");

    strncpy(ir_filename, module_name, MAX_FILE_LENGTH);
    strcat(ir_filename, ".ll");

    strncpy(asm_filename, module_name, MAX_FILE_LENGTH);
    strcat(asm_filename, ".o");

    // preprocessing
    puts("[preprocess] start preprocessing");
    PP_preprocess(source_filename, pp_filename);
    puts("[preprocess] end preprocessing\n");

    // parsing
    yyin = fopen(pp_filename, "r");
    assert(yyin != NULL);
    
    puts("[front] start parsing");
    yyparse();
    puts("[front] end parsing\n");

    A_topClauseList root = A_getParseTreeRoot();
    assert(root != NULL);

    puts("[front] start translate to IR");
    LLVMModuleRef module = SEM_transProgram(root, module_name);
    puts("[front] end translate to IR\n");

    puts("[backend] start translate IR to Assembly code" );
    AS_emits(module, ir_filename, asm_filename);
    puts("[backend] end translate IR to Assembly code\n" );
    
    return 0;
}