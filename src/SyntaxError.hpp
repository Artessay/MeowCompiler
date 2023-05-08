#ifndef _SYNTAX_ERROR_H_
#define _SYNTAX_ERROR_H_

/**
 * @brief [src_span] is a region in some source file.
 * Used to report error messages
*/
struct src_span {
    int start;
    int end;
};

#endif