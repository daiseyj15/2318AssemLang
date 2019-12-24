##########################################################################
# Daisey Jaramillo, CS 2318-003, Assignment 2 Part 1 Program C
############################
# make an array of numbers, display the numbers then move the numbers 
# around then display the numbers again in their new order
############################ data segment ################################

			.data	#all in memory not in register
intArr:			.word 2, 3, 1, 8	# global int array of size 4 initialized
			 			#   to 2, 3, 1 & 8 (from 1st to 4th)
output1:		.asciiz "Orginal array order: (from 1st to 4th element) \n"
output2:		.asciiz "\nChanged array: (from 4th to 1st element) \n"
			
			.text
			.globl main
main:
			li $v0, 4
			la $a0, output1        
			syscall			# print output1
			
			la $t0, intArr		# $t0 has address of intArr
			li $v0, 1		# prep to-print-int system service
			
			lw $a0, 0($t0)		# $a0 has intArr[0] 
				  		
			move $t1, $a0		#$t1 has '2'
			syscall			# should print '2'
			
			lw $a0, 4($t0)		#$a0 has intArr[1] 
			move $t2, $a0		#$t2 has '3'
			syscall
			
			lw $a0, 8($t0)		#$a0 has intArr[2]
			move $t3, $a0		#$t3 has '1'
			syscall
			
			lw $a0, 12($t0)		#$a0 has intArr[3]
			move $t4, $a0		#$t4 has '8'
			syscall
			
			sw $t1, 12($t0)		#putting the first element in the 4th place
			sw $t4, 0($t0)		#putting 4th element in the 1st place
			sw $t2, 8($t0)		#putting 2nd element in the 3rd place
			sw $t3, 4($t0)		#putting 3rd element in the 2nd place
			
			li $v0, 4
			la $a0, output2        
			syscall			# print output2

			li $v0, 1
			lw $a0, 12($t0)		# reload content of intArr[3] in memory into $a0
			syscall			# should print 2
			lw $a0, 8($t0)		# reload content of intArr[2] in memory into $a0
			syscall			# should print 3
			lw $a0, 4($t0)		# reload content of intArr[1] in memory into $a0
			syscall			# should print 1
			lw $a0, 0($t0)		# reload content of intArr[0] in memory into $a0
			syscall			# should print 8




			li $v0, 10		# graceful exit
			syscall