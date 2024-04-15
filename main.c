#include <stdio.h>
#include "include/hash_table.h"

int main()
{
    ht_hash_table *ht = new_ht();

    ht_insert(ht, "hello", "world");
    printf("%s\n", ht_search(ht, "hello"));
    ht_insert(ht, "hello", "worlds");
    printf("%s\n", ht_search(ht, "hello"));
}