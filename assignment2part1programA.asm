# Daisey Jaramillo, CS 2318-003, Assignment 2 Part 1 Program A

			.data
prompt:			.asciiz "Enter a number: "
message:		.asciiz "Your number is: " 
message2:		.asciiz "\nEnter a 15 charater text: "
userInput:		.space 16 
message3:		.asciiz "\nYour entered: "
message4:		.asciiz "\nEnter a charater: "
message5:		.asciiz "\nYour Charater was: "

			.text
			.globl main
main:
		#Prompt the user to enter a number
			li $v0, 4
			la $a0, prompt
			syscall	
		#Get the user's number
			li $v0, 5
			syscall	
		#Store the result in $t0
			move $t0, $v0	
		#Display the message
			li $v0, 4
			la $a0, message
			syscall	
		#Print the number
			li $v0, 1
			move $a0, $t0
			syscall
		#Displays message2
			li $v0, 4
			la $a0, message2
			syscall
		#get user input
			li $v0, 8
			la $a0, userInput
			li $a1, 16
			syscall
		#Display message3
			li $v0, 4
			la $a0, message3
			syscall
		#Displays input
			li $v0, 4
			la $a0, userInput
			syscall
		#Display message4
			li $v0, 4
			la $a0, message4
			syscall
		#get user input
			li $v0, 12
			syscall
		#store the result in $t1
			move $t1, $v0
		#Display message5
			li $v0, 4
			la $a0, message5
			syscall
		#Print the character
			li $v0, 11
			move $a0, $t1
			syscall
		
			
			li $v0, 10
			syscall
			
