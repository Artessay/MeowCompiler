#ifndef _PARSE_TREE_H_
#define _PARSE_TREE_H_

#include <string>
#include <vector>

#include "SyntaxError.hpp"

typedef std::string variable;
typedef std::string functionName;
typedef std::string typeName;


struct function_argument {
    std::string name;
    std::string type;
    src_span span;
};

class A_type {
    public:
        // virtual ~A_type() {}

    private:
        enum type_shape {
            TYPE_VOID,
            TYPE_INT,
            TYPE_CHAR,
            TYPE_STRING,
            TYPE_DOUBLE,
            TYPE_ARRAY,
            TYPE_FUNCTION,
            TYPE_STRUCT,
            TYPE_UNION,
            TYPE_ENUM,
            TYPE_TYPEDEF,
            TYPE_UNKNOWN
        } shape;

        src_span span;

        union {
            struct {
                A_type* type;
                int size;
            } array;

            struct {
                std::vector<function_argument> arguments;
                A_type* return_type;
            } function;

            struct {
                std::string name;
                std::vector<function_argument> arguments;
            } struct_;

            struct {
                std::string name;
                std::vector<function_argument> arguments;
            } union_;

            struct {
                std::string name;
                std::vector<function_argument> arguments;
            } enum_;

            struct {
                std::string name;
                A_type* type;
            } typedef_;
        } data;
};

class A_expression {

};

class A_top_clause {
    public:
        virtual ~A_top_clause() {}

    private:
        ;
        src_span span;
};


#endif