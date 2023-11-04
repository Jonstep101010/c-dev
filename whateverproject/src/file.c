#include <stdio.h>

char    *tobetested(){
    return ("whatever he said\n");
}

#ifndef TEST
int main(){
    tobetested();
    printf("whatever he said\n");
    int n = 0;
    n+=1;
    printf("%d\n", n);
    // (void)n;
    return (0);
}
#endif
