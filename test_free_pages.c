#include "types.h"
#include "user.h"

int
main(void)
{
    printf(1, "Free pages: %d\n", getNumFreePages());
    exit();
}

