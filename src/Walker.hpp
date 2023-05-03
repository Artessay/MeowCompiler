#ifndef _WALKER_H_
#define _WALKER_H_

#include <iostream>
#include <string>
#include <vector>
#include <memory>
#include <map>
#include <stack>
#include <set>
#include <algorithm>
#include <assert.h>
#include "ast.h"
#include "Table.hpp"

using namespace std;

class Walker {
    public:
        Walker(Node *root) {
            astTree = root;
        }

        virtual ~Walker() {
            // nothing to do
        }

        void walkTop();
        void walk(Node* root);
    private:
        Node *astTree;
};

#endif