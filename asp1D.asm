##########################################################################
# Daisey Jaramillo, CS 2318-003, Assignment 2 Part 1 Program D
############################
#Prompt the user to enter the integer scores for Exam 1, Exam 2 
#and Final Exam, read the scores, compute the weighted average score 
#(using a special formula), and display a labeled output about 
#the weighted average score.
############################ data segment ################################

			.data	#all in memory not in register
prompt1:		.asciiz "Enter a number score for Exam1: \n"
prompt2:		.asciiz "\nEnter a number score for Exam2: \n"
prompt3: 		.asciiz "\nEnter a number score for the Final Exam: \n"
weightAvg:		.asciiz "\nYour weighted average is: \n"
oneInt:			.word 205
secInt:			.word 854		
			
			
			.text
			.globl main
main:
			li $v0, 4
			la $a0, prompt1        
			syscall		# print prompt1
			
			li $v0, 5	#Get the user's number
			syscall	
	
			move $t0, $v0	#Store the Exam1 result in $t0
			
			
			li $v0, 4
			la $a0, prompt2
			syscall		#print prompt2
			
			li $v0, 5	#Get the user's number
			syscall
			
			move $t1, $v0	#Store the Exam2 result in $t1
			
			li $v0, 4
			la $a0, prompt3
			syscall		#print prompt3
			
			li $v0, 5	#Get the user's number
			syscall
			
			move $t2, $v0	#Store the FinalExam result in $t2
			
			
			
			la $t4, oneInt		# $t4 has address of oneInt
			lw $t3, 0($t4)		## $t3 has oneInt[0] (should be 205)
			
			
			
			mult $t3, $t0		# lo = $t0 * 205
			
			mflo $t4		# move lo to $t4 
			
			sra $t4, $t4, 10	# $t4 = $t4 / 2^10
			
			
			 			
			sll $t1, $t1, 8		# $t1 = $t1 * 2^8 (via bitwise shift left)
			
			la $t3, secInt		# $t3 has address of secInt
			lw $t5, 0($t3) 		# $t5 has the contents of $t3 854
			
			
			
			
			
			div $t1, $t5		# lo = $t1 / $t5
			
			mflo $t6		# move lo to $t6
			
	
			
			sra $t2, $t2, 1		# $t2 = $t2 / 2^1 (via bitwise shift right)
					
			
			add $t7, $t4, $t6	# $t4 + $t6 and is stored in $t7
			
			add $t0, $t7, $t2 	# $t7 + $t2 and is stored in $t0
			

			li $v0, 4
			la $a0, weightAvg        
			syscall		# print weightAvg
			

			li $v0, 1
			move $a0, $t0	# print the number weighted average 
			syscall


			li $v0, 10		# graceful exit
			syscall
