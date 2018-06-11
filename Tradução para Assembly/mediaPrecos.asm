.data
vetor: .word 0:9 
tam: .word 10
soma : .word
divisor : .float 10.0 
precomedio : .float
mensagem1 : .asciiz "Informe o preco do produto "
mensagem2 : .asciiz ": \n"
mensagem3 : .asciiz "Preco medio dos produtos: \n" 

.text



	li $t0, 0		# Setando i = 0
	lw $t1, tam		# Carregando em $t1 o tamanho do vetor
	la $t2, vetor		# Carregando em $t2 o endereço do vetor
	li $a0, 0		# Zerando $a0 para print integer da mensagem 1 com o contador do produto

loop1:
	beq $t0, $t1, setando_vetor
	
	li $v0, 4  			 # serviço 4 - print string
  	la $a0, mensagem1 		 # carrega em $a0 o endereço da mensagem a ser impressa
 	syscall
  
	addi $a0, $t0, 1		# incrementando i
	li $v0, 1			# impressao inteiro i
	syscall
	
	li $v0, 4  			 # serviço 4 - print string
  	la $a0, mensagem2 		 # carrega em $a0 o endereço da mensagem a ser impressa
 	syscall
 		
	li $v0, 5			# lendo valor do produto
	syscall
		
 	sw $v0, 0($t2)
	
	addi $t2, $t2, 4	
	addi $t0, $t0, 1
	j loop1

	
	
setando_vetor:
	li $t0, 0			# Setando i=0
	la $t2, vetor			# Setando o primeiro endereco do vetor
	li $s0, 0			# Setando a soma como 0 (inicial) 

somando:
	
	lw $t6, 0($t2)			# Carregando valor do vetor da memoria em $t6
	
	add $s0, $s0, $t6	 	# Realizando a soma. Posiçao do vetor ($t6) +  soma($s0)
	
	addi $t2, $t2, 4		# Incrementando a posiçao do vetor (4 bits - tam do . word) 
	addi $t0, $t0, 1
	
	beq $t0, $t1, saida		# Comparando se chegou ao final do vetor
	j somando
	
	#mfc1 move para um $fx
	#cvt.s.w converter para float
	#carregar o divisor
	#div.s dividir
	
saida:

  mfc1 $s0, $f1			# Jogando o valor (.word) da soma no espaço float
  cvt.s.w $f1, $f1		# Convertendo o .word da soma em .float
  mfc1 $t1, $f5
  cvt.s.w $f5, $f5
  # lwc1 $f5, divisor		# $f5 mapeia o divisor
  div.s $f12, $f1, $f5		# divide somatório das notas ($f4) por 10.0 ($f5)
  
  li $v0, 4  			 # serviço 4 - print string
  la $a0, mensagem3 		 # carrega em $a0 o endereço da mensagem a ser impressa
  syscall
  
  li $v0, 2  			# imprime média (float), argumento em $f12
  syscall

  li $v0,10 			# função: terminar execução (system call for exit)
  syscall			#exit 
