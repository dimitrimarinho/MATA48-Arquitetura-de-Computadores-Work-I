#include <stdio.h>

// Funcao media
// Entrada: 3 parametros (x,y,z)
// Saida: media aritmetica das notas
float media(float x, float y, float z) {
  return ((x+y+z)/3);
}
// Funcao principal
int main() {
  float n1, n2, n3, resultado;

  printf("Informe a primeira nota: ");
  scanf("%f", &n1);
  printf("Informe a segunda nota: ");
  scanf("%f", &n2);
  printf("Informe a terceira nota: ");
  scanf("%f", &n3);

  resultado = media(n1,n2,n3);

  if(resultado >= 7.0) {
    printf("Media: %.2f - Aluno aprovado! Parabens!\n", resultado);
  }
  else {
    printf("Media: %.2f - Aluno reprovado! Estude mais!\n", resultado);
  }
  return 0;
}
