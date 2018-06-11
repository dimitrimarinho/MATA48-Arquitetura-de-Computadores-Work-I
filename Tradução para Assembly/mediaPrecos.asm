.data
vetor: .word 0:9 
tam: .word 10
soma : .word
divisor : .float 10.0 
precomedio : .float 

.text



	li $t0, 0
	lw $t1, tam
	la $t2, vetor

loop1:
	beq $t0, $t1, end1
	
	li $v0, 5
	syscall
	
	sw $v0, 0($t2)
	
	addi $t2, $t2, 4	
	addi $t0, $t0, 1
	j loop1

	
	
end1:
	li $t0, 0			#seta i=0
	la $t2, vetor			#setando o primeiro endereco do vetor
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

  li $v0,10 			# função: terminar execução (system call for exit)
  syscall			#exit 
