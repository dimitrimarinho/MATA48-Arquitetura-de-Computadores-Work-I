#include <stdio.h>

// Funcao soma
// Entrada: 2 parametros (x,y)
// Saida: x+y
int soma(int x, int y) {
   return (x+y);
}

// Funcao soma
int main() {
   int num1, num2, resultado;

   printf("Informe numero 1: ");
   scanf("%d", &num1);
   printf("Informe numero 2: ");
   scanf("%d", &num2);
   resultado = soma(num1,num2);
   printf("Resultado: %d\n", resultado);
   return 0;
}
