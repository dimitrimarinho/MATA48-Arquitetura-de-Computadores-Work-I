.data

mensagem1: .asciiz "Informe a primeira nota:"
mensagem2: .asciiz "Informe a segunda nota:"
mensagem3: .asciiz "Informe a terceira nota:"
mensagem4: .asciiz "Media:"
mensagem5: .asciiz "\n- Aluno aprovado! Parabens!"
mensagem6: .asciiz "\n- Aluno reprovado! Estude mais!"
numero1: .float  
numero2: .float
numero3: .float
resultado : .float
divisor : .float 3.0		# dividor da média (3 números)
comparanota : .float 7.0 	# condição do desvio




.text

	# Recebendo valor 1:

  li $v0, 4 			# serviço 4 - print string
  la $a0, mensagem1		# carrega em $a0 o endereço da mensagem a ser impressa
  syscall

  li $v0, 6 			#leitura do float
  syscall
  movf.s $f1, $f0 		# guarda em $f1 o valor do float lido 
  
  	# Recebendo valor 2:
  	  
  li $v0, 4  			# serviço 4 - print string
  la $a0, mensagem2		# carrega em $a0 o endereço da mensagem a ser impressa
  syscall

  li $v0, 6 			# leitura do float
  syscall
  movf.s $f2, $f0 		# guarda em $f2 o valor do float lido
  
  	# Recebendo o valor 3
  
  li $v0, 4 			# serviço 4 - print string
  la $a0, mensagem3		# carrega em $a0 o endereço da mensagem a ser impressa
  syscall

  li $v0, 6 			# leitura do float
  syscall
  movf.s $f3, $f0 		# guarda em $f3 o valor do float lido

	# resultado = (numero1 + numero2 + numero3)/3
	
  # Realizando as somas para calcular a média
  
  add.s $f4, $f1, $f2	# $f4 = $f1 + $f2
  add.s $f4, $f4, $f3	# $f4 = ($f1 + $f2 + $f3)
  lwc1 $f5, divisor	# $f5 mapeia o divisor
  div.s $f12, $f4, $f5	# divide somatório das notas ($f4) por 3.0 ($f5)
  
  # Comando IF - THEN - ELSE
  # if (resultado >= 7.0)
  
  lwc1 $f7, comparanota	# mapeia variável nota (7.0) para $f7
  
  c.le.s 4 $f7, $f12  # if média >= 7.0, flag = 4
  bc1t 4 THEN         # if flag = 4 is TRUE pula para THEN, senão pula para ELSE
  bc1f 4 ELSE
    
# THEN :
THEN :
  li $v0, 4  			 # serviço 4 - print string
  la $a0, mensagem4 		 # carrega em $a0 o endereço da mensagem a ser impressa
  syscall
  li $v0, 2  			# imprime média (float), argumento em $f7
  syscall
  li $v0, 4 			# serviço 4 - print string
  la $a0, mensagem5		# carrega em $a0 o endereço da mensagem a ser impressa
  syscall
  j SAIDA

# ELSE :
ELSE : 
  li $v0, 4  			 # serviço 4 - print string
  la $a0, mensagem4 		 # carrega em $a0 o endereço da mensagem a ser impressa
  syscall
  li $v0, 2  			# imprime média (float), argumento em $f12
  syscall
  li $v0, 4 			# serviço 4 - print string
  la $a0, mensagem6		# carrega em $a0 o endereço da mensagem a ser impressa
  syscall
  j SAIDA

  # Finalização do programa
 # SAÍDA :
SAIDA :
  li $v0,10 			# função: terminar execução (system call for exit)
  syscall			#exit
