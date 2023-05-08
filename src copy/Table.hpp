#ifndef _TABLE_H_
#define _TABLE_H_

#include <string>
#include <stdio.h>

template<typename T>
class Table {
    public:
        Table(std::string id, T value, Table *tail)
        : id(id), value(value), tail(tail) {
            // empty
        }

        virtual ~Table() {
            // empty
        }

        int lookup(std::string id) {
            if (this == NULL) {
                fprintf(stderr, "Table is null, Undefined Variable %s", id.c_str());
                return 0;
            }

            if (id == this->id) {
                return this->value;
            } else {
                if (this->tail == NULL) {
                    fprintf(stderr, "Undefined Variable %s", id.c_str());
                    return 0;
                } else {
                    return tail->lookup(id);
                }
            }
        }

        Table* update(Table *tablePointer, std::string id, T value) {
            return new Table(id, value, tablePointer);
        }

    private:
        std::string id;
        T value;
        Table *tail;
};

#endif