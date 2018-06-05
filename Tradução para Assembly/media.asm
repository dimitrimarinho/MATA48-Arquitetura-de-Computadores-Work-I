.data

n1: .float
n2: .float
n3: .float
resultado: .float
divisor: .float 3.0 # divisor para media
valor: .float 7.0 # comparar no IF ELSE
msg1: .asciiz “Informe a primeira nota: “
msg2: .asciiz “Informe a segunda nota:”
msg3: .asciiz “Informe a terceira nota:”
msg4: .asciiz “Media: ”
msg5: .asciiz “- Aluno aprovado! Parabens! \n”
msg6: .asciiz “- Aluno reprovado! Estude mais!\n”

.text
    li $v0, 4          #serviço print string
    la $a0, msg1   #string a ser impressa em $a0
    syscall

    li $v0, 6    # serviço read float, retorno em $f0
    syscal
# la $f1, n1    # $f1 mapeia variável n1
    movf.s $f1, $f0

    li $v0, 4     # serviço print string
    la $a0, msg2     # string a ser impressa em $a0
    syscall

    li $v0, 6    # read float, retorno em $f0
    syscall
    # la $f2, n2    # mapeia variável n2 para $f2
    movf.s $f2, $f0

    li $v0, 6    # read float, retorno em $f0    
    syscall
    # la $f3, n3    # mapeamento variável n3 para $f3
    movf.s    $f3, $f0
    

# resultado = media(n1,n2,n3);

add.s $f4, $f1, $f2    # $f1  - n1; $f2 - n2
add.s $f5, $f4, $f3    # $f3 - n3

lwc1    $f7, divisor    # $f7 mapeia o divisor
div.s $f12, $f5, $f7    # $f5 - somatório das notas 

li $v0, 2     # print float, argumento em $f12
syscall 

    # PENDENTE
    # implementar o comando IF - THEN - ELSE

    lwc1 $f6, valor     # mapeia variável valor para $f6
    bge $f12, $f6, THEN     # if (resultado >= 7.0)


    # IMPORTANTE - programa deve pular o bloco THEN
j SAIDA    

    THEN:
        li $v0, 4    # serviço print string
        la $a0, msg4    # imprime “Media”
        syscall
li $v0, 2    # print float, argumento em $f12
syscall
li $v0, 4 # serviço print string
la $a0, msg5    # imprime “Aluno aprovado” 
syscall 

SAIDA:
    li $v0, 10    # serviço para encerrar o programa
    syscall

