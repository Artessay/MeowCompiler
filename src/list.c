#include "list.h"
#include "utility.h"

#include <stdlib.h>

// Create a new node
Node *create_node(int data) {
    Node *node = checked_malloc(sizeof(Node));
    node->data = data;
    node->next = NULL;
    return node;
}

// Free a node
void free_node(Node *node) {
    free(node);
}

// Create a new list
List create_list() {
    List list = checked_malloc(sizeof(List));
    list->head = NULL;
    list->tail = NULL;
    list->size = 0;
    return list;
}

// Free a list
void free_list(List list) {
    Node *node = list->head;
    while (node != NULL) {
        Node *next = node->next;
        free_node(node);
        node = next;
    }
    free(list);
}

// Add a new node to the end of the list
List append(List list, int data) {
    Node *node = create_node(data);
    if (list->head == NULL) {
        list->head = node;
    } else {
        list->tail->next = node;
    }
    list->tail = node;
    list->size++;
    return list;
}

// Add a new node to the beginning of the list
List prepend(List list, int data) {
    Node *node = create_node(data);
    node->next = list->head;
    list->head = node;
    if (list->tail == NULL) {
        list->tail = node;
    }
    list->size++;
    return list;
}

// Insert a new node at the given index
void insert(List list, int data, int index) {
    if (index == 0) {
        prepend(list, data);
    } else if (index == list->size) {
        append(list, data);
    } else {
        Node *node = create_node(data);
        Node *prev = list->head;
        for (int i = 0; i < index - 1; i++) {
            prev = prev->next;
        }
        node->next = prev->next;
        prev->next = node;
        list->size++;
    }
}

// Remove the node at the given index
void remove_node(List list, int index) {
    if (index == 0) {
        Node *node = list->head;
        list->head = node->next;
        free_node(node);
    } else {
        Node *prev = list->head;
        for (int i = 0; i < index - 1; i++) {
            prev = prev->next;
        }
        Node *node = prev->next;
        prev->next = node->next;
        free_node(node);
    }
    list->size--;
}
