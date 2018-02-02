.data
welcome: .asciiz "\t\t\t\t\tWelcome to Tiny Calculator \n \t\t\t\t\t\t1 - Addition \n \t\t\t\t\t\t2 - Subtraction \n \t\t\t\t\t\t3 - Multiplication \n \t\t\t\t\t\t4 - Division \n \t\t\t\t\t\t0 - Exit "
choose: .asciiz "\tChoose an option: "
enterNumber1: .asciiz "\tPlease enter first number: "
enterNumber2: .asciiz "\tPlease enter second number: "
newline: .asciiz "\n"
sum: .asciiz "\tThe addition of "
comma: .asciiz " , "
is: .asciiz " is = "
difference: .asciiz "\tThe subtraction of "
product: .asciiz "\tThe multiplication of "
quotient: .asciiz "\tThe quotient of "
remainder: .asciiz "\tAnd the remainder is: "
error: .asciiz "\tInvalid number, exiting... "
finishing: .asciiz "\t\t\t\t\tThank You For Using Tiny Calculator. \n"

.text
.globl main
main:

loop:

	#printing newline
	li $v0,4
	la $a0,newline
	syscall

	#printing welcome
	li $v0,4
	la $a0,welcome
	syscall

	#printing newline
	li $v0,4
	la $a0,newline
	syscall
	
	#printing option to choose
	li $v0,4
	la $a0,choose
	syscall
	
	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to s0
	move $s0, $v0

	#branches
	beq $s0,0,exit
	beq $s0, 1, addition
	beq $s0, 2, subtraction
	beq $s0, 3, multiplication
	beq $s0, 4, division
	j errorExit

addition:

	#printing Enter Number
	li $v0,4
	la $a0,enterNumber1
	syscall

	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to temp0
	move $t0, $v0


	#printing Enter Number
	li $v0,4
	la $a0,enterNumber2
	syscall

	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to temp1
	move $t1, $v0

	#printing Sum String
	li $v0,4
	la $a0,sum
	syscall

	#print user number1
	li $v0,1
	move $a0,$t0
	syscall

	#printing comma
	li $v0,4
	la $a0,comma
	syscall

	#print user number2
	li $v0,1
	move $a0,$t1
	syscall


	#printing is
	li $v0,4
	la $a0,is
	syscall

	#perform Addition
	add $t2,$t0,$t1

	#print user sum of numbers
	li $v0,1
	move $a0,$t2
	syscall

	#printing newline
	li $v0,4
	la $a0,newline
	syscall

	j loop

subtraction:


	#printing Enter Number
	li $v0,4
	la $a0,enterNumber1
	syscall

	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to temp0
	move $t0, $v0


	#printing Enter Number
	li $v0,4
	la $a0,enterNumber2
	syscall

	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to temp1
	move $t1, $v0
	

	#printing Difference String
	li $v0,4
	la $a0,difference
	syscall

	#print user number1
	li $v0,1
	move $a0,$t0
	syscall

	#printing comma
	li $v0,4
	la $a0,comma
	syscall

	#print user number2
	li $v0,1
	move $a0,$t1
	syscall


	#printing is
	li $v0,4
	la $a0,is
	syscall

	#perform subtraction and print
	neg $t3,$t1
	add $t2,$t0,$t3
	li $v0,1
	move $a0,$t2
	syscall

	#printing newline
	li $v0,4
	la $a0,newline
	syscall

	j loop

multiplication:


	#printing Enter Number
	li $v0,4
	la $a0,enterNumber1
	syscall

	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to temp0
	move $t0, $v0


	#printing Enter Number
	li $v0,4
	la $a0,enterNumber2
	syscall

	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to temp1
	move $t1, $v0


	#printing Product String
	li $v0,4
	la $a0,product
	syscall

	#print user number1
	li $v0,1
	move $a0,$t0
	syscall

	#printing comma
	li $v0,4
	la $a0,comma
	syscall

	#print user number2
	li $v0,1
	move $a0,$t1
	syscall


	#printing is
	li $v0,4
	la $a0,is
	syscall

	#perform multiplication and print
	mul $t2,$t0,$t1
	li $v0,1
	move $a0,$t2
	syscall

	#printing newline
	li $v0,4
	la $a0,newline
	syscall

	j loop

division:


	#printing Enter Number
	li $v0,4
	la $a0,enterNumber1
	syscall

	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to temp0
	move $t0, $v0


	#printing Enter Number
	li $v0,4
	la $a0,enterNumber2
	syscall

	#get int from user
	li $v0,5
	syscall

	#move number from user out of v0 to temp1
	move $t1, $v0

	#printing Quotient String
	li $v0,4
	la $a0,quotient
	syscall

	#print user number1
	li $v0,1
	move $a0,$t0
	syscall

	#printing comma
	li $v0,4
	la $a0,comma
	syscall

	#print user number2
	li $v0,1
	move $a0,$t1
	syscall

	#printing is
	li $v0,4
	la $a0,is
	syscall

	#perform division and print
	div $t0,$t1
	mflo $t6
	mfhi $t7

	#printing lo
	li $v0,1
	move $a0,$t6
	syscall

	#printing newline
	li $v0,4
	la $a0,newline
	syscall

	#printing Remainder String
	li $v0,4
	la $a0,remainder
	syscall

	#printing hi
	li $v0,1
	move $a0,$t7
	syscall

	#printing newline
	li $v0,4
	la $a0,newline
	syscall

	j loop

exit:
	#finishing
	li $v0,4
	la $a0,finishing
	syscall
	
	#exit sequence
	li $v0, 10
	syscall
	
errorExit:
	#printing error message
	li $v0,4
	la $a0,error
	syscall

	#exit sequence
	li $v0, 10
	syscall
