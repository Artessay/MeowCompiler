#ifndef _ERROR_MESSAGE_H_
#define _ERROR_MESSAGE_H_

extern int EM_tokPos;

void EM_setTokenPos(int pos);

void EM_reset(char *file);

void EM_newline();

void EM_error(int pos, char *message, ...);

#endif