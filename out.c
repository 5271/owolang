#include <stdio.h> 

int main(){

   int a = 0;
   int i[1000] = {0};
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   i[a] = i[a] + 1;
   int b0 = i[a]; 
   while (b0) { 

   a = a + 1;
   i[a] = i[a] + 1;
   printf("%i\n", i[a]);
   a = a - 1;
   
   b0 = b0 - 1; 
   } 

}