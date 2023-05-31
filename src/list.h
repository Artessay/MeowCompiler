#ifndef _LIST_H_
#define _LIST_H_

// Linked List Node
typedef struct node {
    int data;
    struct node *next;
} Node;

// Linked List
typedef struct list *List;
struct list {
    Node *head;
    Node *tail;
    int size;
};

// Create a new node
Node *create_node(int data);

// Free a node
void free_node(Node *node);

// Create a new list
List create_list();

// Free a list
void free_list(List list);

// // Add a new node to the end of the list
// List append(List list, int data);

// Add a new node to the beginning of the list
List prepend(List list, int data);

// // Insert a new node at the given index
// void insert(List list, int data, int index);

// // Remove the node at the given index
// void remove_node(List list, int index);

#endif