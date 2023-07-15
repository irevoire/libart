#include <stdio.h>
#include "art.h"

int main() {
    art_tree t;
    art_tree_init(&t);

    const unsigned char key[] = "Hello";
    art_insert(&t, (const unsigned char *)&key, sizeof(key) - 1, (void *)42);
    printf("* Inserted the first element\n");

    const unsigned char key2[] = "Hello22";
    art_insert(&t, (const unsigned char *)&key2, sizeof(key2) - 1, (void *)42);
    printf("* Inserted the second element\n");

  
    art_tree_destroy(&t);
  
}
