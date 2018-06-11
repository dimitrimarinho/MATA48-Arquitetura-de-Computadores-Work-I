.data

mensagem1 : .asciiz "Informe numero 1: "
mensagem2 : .asciiz "Informe numero 2: "
numero1 : .word
numero2 : .word
resultadosoma : .word
resultado : .asciiz "Resultado: "

.text

la $a0, mensagem1 	# carrega em $a0 o endereço da mensagem a ser impressa
li $v0, 4 		# serviço 4 - print string
syscall

li $v0, 5		# $v0, 5 lê um inteiro (número 1)
syscall

move $t0, $v0  		# armazena no registrador $t0 o valor inteiro digitado

la $a0, mensagem2 	# carrega em $a0 o endereço da mensagem a ser impressa
li $v0, 4		# serviço 4 - print string
syscall

li $v0, 5		# $v0, 5 lê um inteiro (número 2)
syscall

move $t1, $v0  		# armazena no registrador $t1 o valor inteiro digitado

# Temos os dois valores nos registradores $t0 e $t1, basta agora fazer a soma

add $t2, $t1, $t0	# armazena no registrador $t2 a soma entre $t0 e $t1

la $a0, resultado	# carrega em $a0 o endereço da mensagem a ser impressa
li $v0, 4		# serviço 4 - print string
syscall

li $v0, 1 		# $v0, 1 : print inteiro
move $a0, $t2		# movendo o resultado da soma ($t2) para exibir em $a0
syscall

# Finalização do programa
li $v0,10 		# função: terminar execução (system call for exit)
syscall 		#exit
  

 
