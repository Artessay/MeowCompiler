#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "config.h"

typedef struct {
    char name[MAX_MACRO_NAME_LENGTH];
    char value[MAX_LINE_LENGTH];
} Macro;

static Macro macros[MAX_LINE_LENGTH];
static int num_macros = 0;

void readMacrosFromFile(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening macro file.\n");
        exit(1);
    }

    char line[MAX_LINE_LENGTH];
    while (fgets(line, sizeof(line), file)) {
        // check whether it is macro line
        if (line[0] == '#') {
            // check whether it is macro definition line
            if (line[1] == 'd' && line[2] == 'e' && line[3] == 'f' && line[4] == 'i' && line[5] == 'n' && line[6] == 'e') {
                // analyze macro definition and store it in global macro array
                char* name_start = strchr(line, ' ') + 1;
                char* name_end = strchr(name_start, ' ');
                char* value_start = name_end + 1;
                char* value_end = strchr(value_start, '\n');

                Macro macro;
                strncpy(macro.name, name_start, name_end - name_start);
                macro.name[name_end - name_start] = '\0';
                strncpy(macro.value, value_start, value_end - value_start);
                macro.value[value_end - value_start] = '\0';

                macros[num_macros++] = macro;
            }
        } 
    }

    fclose(file);
}

void expandMacro(char* line) {
    for (int i = 0; i < num_macros; i++) {
        char* occurrence = strstr(line, macros[i].name);
        while (occurrence != NULL) {
            // Find the position of the macro in the source code and replace it
            char expanded[MAX_LINE_LENGTH];
            strncpy(expanded, line, occurrence - line);
            expanded[occurrence - line] = '\0';
            strcat(expanded, macros[i].value);
            strcat(expanded, occurrence + strlen(macros[i].name));

            strcpy(line, expanded);

            // Find the next occurrence of the macro
            occurrence = strstr(line, macros[i].name);
        }
    }
}

void PP_preprocess(const char* input_filename, const char* output_filename) {
    FILE* input_file = fopen(input_filename, "r");
    if (input_file == NULL) {
        printf("Error opening input file.\n");
        exit(1);
    }

    readMacrosFromFile(input_filename);

    FILE* output_file = fopen(output_filename, "w");
    if (output_file == NULL) {
        printf("Error creating output file.\n");
        exit(1);
    }

    char line[MAX_LINE_LENGTH];
    while (fgets(line, sizeof(line), input_file)) {
        // check whether it is macro line
        if (line[0] == '#') {
            continue;
        }

        // expand macros in each line
        expandMacro(line);

        // write the expanded code to the output file
        fputs(line, output_file);
    }

    fclose(input_file);
    fclose(output_file);

    printf("[preprocess] Preprocessing completed successfully.\n");
}

int main() {
    char *input_filename = "test.c";
    char *output_filename = "test.i";

    // 预处理源代码
    preprocess(input_filename, output_filename);

    return 0;
}
