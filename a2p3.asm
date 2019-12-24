###############################################################################
# Title: Assign02P3                   Author: Daisey Jaramillo
# Class: CS 2318-00?, Fall 2019       Submitted: October 31,2019
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################

##include <iostream>
#using namespace std;
			.data
iA1:			.space 48
iA2:			.space 48
iA3:			.space 48
#int  a1[12],
#     a2[12],
#     a3[12];

begA1Str:		.asciiz "\nbeginning a1: "
#char begA1Str[] = "\nbeginning a1: ";
proA1Str:		.asciiz "processed a1: "
#char proA1Str[] = "processed a1: ";
comA2Str:		.asciiz "          a2: "
#char comA2Str[] = "          a2: ";
comA3Str:		.asciiz "          a3: "
#char comA3Str[] = "          a3: ";
einStr:			.asciiz "\nEnter integer #"
#char einStr[]   = "\nEnter integer #";
moStr:			.asciiz "Max of "
#char moStr[]    = "Max of ";
ieStr:			.asciiz " ints entered...\n"
#char ieStr[]    = " ints entered...";
emiStr:			.asciiz "Enter more ints? (n or N = no, others = yes) "
#char emiStr[]   = "Enter more ints? (n or N = no, others = yes) ";
dacStr:			.asciiz "Do another case? (n or N = no, others = yes) "
#char dacStr[]   = "Do another case? (n or N = no, others = yes) ";
dlStr:			.asciiz "================================"
#char dlStr[]    = "================================";
byeStr:			.asciiz "bye..."
#char byeStr[]   = "bye...";
#
colSpace:		.asciiz ": "


			.text
			.globl main
main:
#int main()
#{
################################################ 
# Register usage: 
################# 
# $a1: endPtr1 
# $a2: endPtr2 
# $a3: endPtr3 
# $t0: temp holder 
# $t1: used1 
# $t2: used2 
# $t3: used3 
# $t4: hopPtr1 
# $t5: hopPtr2 or remCount (non-overlappingly) 
# $t6: hopPtr11 or hopPtr22 (non-overlappingly) 
# $t7: hopPtr3 or hopPtr222 (non-overlappingly) 
# $t8: reply or anchor (non-overlappingly) 
# $t9: temp holder 
# $v1: temp holder  
################################################
#char reply;
#int  used1,
#     used2,
#     used3,
#     remCount,
#     anchor;
#int* hopPtr1;
#int* hopPtr11;
#int* hopPtr2;
#int* hopPtr22;
#int* hopPtr222;
#int* hopPtr3;
#int* endPtr1;
#int* endPtr2;
#int* endPtr3;
#



#//           do
begDW1:#//    {
		 li $t1, 0 #0 in used1
#                used1 = 0;
		 la $t4, iA1 #$t4 holds the address of 
		 	     #iA1 which is hopPtr1
#                hopPtr1 = a1;
#//              do
begDW2:#//       {
		 li $v0, 4	#print a string
		 la $a0, einStr
		 syscall
#                   cout << einStr;
		 li $v0, 1
		 addi $a0, $t1, 1 #print out used1 but also 
		 syscall	  #add one to it
#                   cout << (used1 + 1);
		 li $v0, 4
		 la $a0, colSpace #print a colon and space
		 syscall
#                   cout << ':' << ' ';
		 li $v0, 5
		 syscall #get user input and move to
		 sw $v0, 0($t4) #hopPtr1's register
#                   cin >> *hopPtr1;
		 addi $t1, $t1, 1 #add one to used1
#                   ++used1;
		 addi $t4, $t4, 4 #add one to hopPtr1
#                   ++hopPtr1;
#//                 if (used1 == 12)
		 li $t0, 12
		 bne $t1, $t0, else1
#                   if (used1 != 12) goto else1;
begI1:#//           {
		 li $v0, 4
		 la $a0, moStr
		 syscall
#                      cout << moStr;
		 li $v0, 1 
		 li $a0, 12 
		 syscall
#                      cout << 12;
		 li $v0, 4
		 la $a0, ieStr
		 syscall
#                      cout << ieStr;
#                      cout << endl;
		 li $t8, 'n'
#                      reply = 'n';
		 j endI1
#                   goto endI1;
#//                 }
else1:#//           else
#//                 {
		 li $v0, 4
		 la $a0, emiStr
		 syscall
#                      cout << emiStr;
		 li $v0, 12
		 syscall
		 move $t8, $v0  
#                      cin >> reply;
endI1:#//           }
#//              }
DWTest2:
#//              while (reply != 'n' && reply != 'N');
#////            if (reply != 'n' && reply != 'N')goto begDW2;
		 li $t0, 'n'
		 beq $t8, $t0, xitDW2
#                if (reply == 'n') goto xitDW2;
		 li $t0, 'N'
		 bne $t8, $t0, begDW2
#                if (reply != 'N')goto begDW2;
xitDW2:
#
		 li $v0, 4
		 la $a0, begA1Str
		 syscall
#                cout << begA1Str;
		 la $t4, iA1
#                hopPtr1 = a1;
		 la $t9, iA1
		 sll $v1, $t1, 2 
		 add $a1, $v1, $t9
#                endPtr1 = a1 + used1;
#//              while (hopPtr1 < endPtr1)
		 j WTest1
#                goto WTest1;
begW1:#//        {
#//                 if (hopPtr1 == endPtr1 - 1)
		 addi $t0, $a1, -4 
		 bne $t4, $t0, else2
#                   if (hopPtr1 != endPtr1 - 1) goto else2;
begI2:#//           {
		 li $v0, 1
		 lw $a0, 0($t4)
		 syscall
		 li $v0, 11
		 li $a0, '\n'
	 	 syscall
#                      cout << *hopPtr1 << endl;
		 j endI2
#                   goto endI2;
#//                 }
else2:#//           else
#//                 {
		 li $v0, 1
		 lw $a0, 0($t4)
		 syscall 
		 li $v0, 11
		 li $a0, ' '
		 syscall
#                      cout << *hopPtr1 << ' ';
endI2:#//           }
		 addi $t4, $t4, 4 #add one to hopPtr1
#                   ++hopPtr1;
#//              }
WTest1:
		 blt $t4, $a1, begW1
#                if (hopPtr1 < endPtr1) goto begW1;
#
#//              for (hopPtr1 = a1, hopPtr2 = a2, used2 = 0; // multiple initializations
#//                   hopPtr1 < endPtr1;                     // loop test
#//                   ++hopPtr1, ++hopPtr2, ++used2)         // multiple updates
		 la $t4, iA1
#                hopPtr1 = a1;
		 la $t5, iA2
#                hopPtr2 = a2;
		 li $t2, 0
#                used2 = 0; // multiple initializations
		 j FTest1
#                goto FTest1;
begF1:#//        {
		 lw $t9, 0($t4)
		 sw $t9, 0($t5) 
#                   *hopPtr2 = *hopPtr1;
		 addi $t4, $t4, 4
#                ++hopPtr1;
		 addi $t5, $t5, 4
#                ++hopPtr2;
		 addi $t2, $t2, 1
#                ++used2;         // multiple updates
#//              }
FTest1:
		 blt $t4, $a1, begF1
#                if (hopPtr1 < endPtr1) goto begF1;         // loop test
#
		la $t5, iA2
#                hopPtr2 = a2;
		sll $v1, $t2, 2
		la $t0, iA2 
		add $a2, $t0, $v1
#                endPtr2 = a2 + used2;
#//              while (hopPtr2 < endPtr2)
		j WTest2
#                goto WTest2;
begW2:#//        {
		lw $t8, 0($t5)
#                   anchor = *hopPtr2;
#//                 for (hopPtr22 = hopPtr2 + 1; hopPtr22 < endPtr2; ++hopPtr22)
		addi $t6, $t5, 4 
#                   hopPtr22 = hopPtr2 + 1; 
		j FTest2
#                   goto FTest2;
begF2:#//           {
#//                    if (*hopPtr22 == anchor)
		lw $t0, 0($t6)
		bne $t0, $t8, endI3
#                      if (*hopPtr22 != anchor) goto endI3;
befI3:#//              {
#//                       for (hopPtr222 = hopPtr22 + 1; hopPtr222 < endPtr2; ++hopPtr222)
		addi $t7, $t6, 4
#                         hopPtr222 = hopPtr22 + 1;
		j FTest3
#                         goto FTest3;
begF3:#//                 {
		lw $t9, 0($t7)
		sw $t9, -4($t7)
#                            *(hopPtr222 - 1) = *hopPtr222;
		addi $t7, $t7, 4
#                         ++hopPtr222;
#//                       }
FTest3:
		blt $t7, $a2, begF3
#                         if (hopPtr222 < endPtr2) goto begF3;
#
		addi $t2, $t2, -1
#                         --used2;
		addi $a2, $a2, -4
#                         --endPtr2;
		addi $t6, $t6, -4
#                         --hopPtr22;
endI3:#//              }
		addi $t6, $t6, 4
#                   ++hopPtr22;
#//                 }
FTest2:
		blt $t6, $a2, begF2
#                   if (hopPtr22 < endPtr2) goto begF2;
#
		addi $t5, $t5, 4
#                   ++hopPtr2;
#//              }
WTest2:
		blt $t5, $a2, begW2
#                if (hopPtr2 < endPtr2) goto begW2;
#
		li $t3, 0
#                used3 = 0;
		la $t7, iA3
#                hopPtr3 = a3;
		la $t4, iA1
#                hopPtr1 = a1;
#//              while (hopPtr1 < endPtr1)
		j WTest3
#                goto WTest3;
begW3:#//        {
		lw $t0, 0($t4)
		sw $t0, 0($t7)
#                   *hopPtr3 = *hopPtr1;
		addi $t3, $t3, 1
#                   ++used3;
		addi $t7, $t7, 4
#                   ++hopPtr3;
		lw $t8, 0($t4)
#                   anchor = *hopPtr1;
		li $t5, 0
#                   remCount = 0;
#//                 for (hopPtr11 = hopPtr1 + 1; hopPtr11 < endPtr1; ++hopPtr11)
		addi $t6, $t4, 4
#                   hopPtr11 = hopPtr1 + 1;
		j FTest4
#                   goto FTest4;
begF4:#//           {
#//                    if (*hopPtr11 == anchor)
		lw $t9, 0($t6)
		bne $t9, $t8, else4
#                      if (*hopPtr11 != anchor) goto else4;
begI4:#//              {
		addi $t5, $t5, 4
#                         ++remCount;
		j endI4
#                      goto endI4;
#//                    }
else4:#//              else
#//                    {
		lw $t0, 0($t6)
		sll $t9, $t5, 2
		sub $t9, $t6, $t9 
		sw $t0, 0($t6)
#                         *(hopPtr11 - remCount) = *hopPtr11;
endI4:#//              }
		addi $t6, $t6, 4
#                   ++hopPtr11;
#//                 }
FTest4:
		blt $t6, $a1, begF4
#                   if (hopPtr11 < endPtr1) goto begF4;
#
		sub $t1, $t1, $t5
#                   used1 -= remCount;
		sub $a1, $a1, $t5
#                   endPtr1 -= remCount;
		addi $t4, $t4, 4
#                   ++hopPtr1;
#//              }
WTest3:
		blt $t4, $a1, begW3
#                if (hopPtr1 < endPtr1) goto begW3;
#
		li $v0, 4
		la $a0, proA1Str
		syscall
#                cout << proA1Str;
#//              for (hopPtr1 = a1; hopPtr1 < endPtr1; ++hopPtr1)
		la $t4, iA1
#                hopPtr1 = a1;
		j FTest5
#                goto FTest5;
begF5:#//         {
#//                 if (hopPtr1 == endPtr1 - 1)
		addi $t0, $a1, -4
		bne $t4, $t0, else5
#                   if (hopPtr1 != endPtr1 - 1) goto else5;
begI5:#//           {
		li $v0, 1
		lw $a0, 0($t4)
		syscall 
		li $v0, 11
		li $a0, '\n'
	 	syscall
#                      cout << *hopPtr1 << endl;
		j endI5
#                   goto endI5;
#//                 }
else5:#//           else
#//                 {
		li $v0, 1
		lw $a0, 0($t4)
		syscall
		li $v0, 11
		li $a0, ' '
		syscall
#                      cout << *hopPtr1 << ' ';
endI5:#//           }
		addi $t4, $t4, 4
#                ++hopPtr1;
#//              }
FTest5:
		blt $t4, $a1, begF5
#                if (hopPtr1 < endPtr1) goto begF5;
#
		li $v0, 4
		la $a0, comA2Str
		syscall
#                cout << comA2Str;
#//              for (hopPtr2 = a2; hopPtr2 < endPtr2; ++hopPtr2)
		la $t5, iA2
#                hopPtr2 = a2;
		j FTest6
#                goto FTest6;
begF6:#//        {
#//                 if (hopPtr2 == endPtr2 - 1)

		addi $t0, $a2, -4
		bne $t5, $t0, else6 
#                   if (hopPtr2 != endPtr2 - 1) goto else6;
begI6:#//           {
		li $v0, 1
		lw $a0, 0($t5)
		syscall
		li $v0, 11
		li $a0, '\n'
		syscall
#                      cout << *hopPtr2 << endl;
		j endI6
#                   goto endI6;
#//                 }
else6:#//           else
#//                 {
		li $v0, 1
		lw $a0, 0($t5)
		syscall
		li $v0, 11
		li $a0, ' '
		syscall
#                      cout << *hopPtr2 << ' ';
endI6:#//           }
		addi $t5, $t5, 4
#                ++hopPtr2;
#//              }
FTest6:
		blt $t5, $a2, begF6
#                if (hopPtr2 < endPtr2) goto begF6;
		li $v0, 4
		la $a0, comA3Str
		syscall
#                cout << comA3Str;
		la $t7, iA3
#                hopPtr3 = a3;
		sll $v1, $t3, 2
		la $t9, iA3 ###################
		add $a3, $t9, $v1
#                endPtr3 = a3 + used3;
#//              while (hopPtr3 < endPtr3)
		j WTest4
#                goto WTest4;
begW4:#//        {
#//                 if (hopPtr3 == endPtr3 - 1)
		addi $t0, $a3, -4
		bne $t7, $t0, else7 
#                   if (hopPtr3 != endPtr3 - 1) goto else7;
begI7:#//           {
		li $v0, 1
		lw $a0, 0($t7)
		syscall
		li $v0, 11
		li $a0, '\n'
		syscall
#                      cout << *hopPtr3 << endl;
		j endI7
#                   goto endI7;
#//                 }
else7:#//           else
#//                 {
		li $v0, 1
		lw $a0, 0($t7)
		syscall
		li $v0, 11
		li $a0, ' '
		syscall
#                      cout << *hopPtr3 << ' ';
endI7:#//           }
		addi $t7, $t7, 4
#                   ++hopPtr3;
#//              }
WTest4:
		blt $t7, $a3, begW4
#                if (hopPtr3 < endPtr3) goto begW4;
#
		 li $v0, 11
		 li $a0, '\n'
	 	 syscall
#                cout << endl;
		li $v0, 4
		la $a0, dacStr
		syscall
#                cout << dacStr;
		li $v0, 12
		syscall
		move $t8, $v0
#                cin >> reply;
		li $v0, 11
		li $a0, '\n'
	 	syscall
#                cout << endl;
#//           }
DWTest1:
#//           while (reply != 'n' && reply != 'N');
#////         if (reply != 'n' && reply != 'N') goto begDW1;
		
	       	li $t0, 'n'
	        beq $t8, $t0, xitDW1
#             if (reply == 'n') goto xitDW1;
		li $t0, 'N'
		bne $t8, $t0, begDW1
#             if (reply != 'N') goto begDW1;
xitDW1:
#
		li $v0, 4
		la $a0, dlStr
		syscall
#             cout << dlStr;
		 li $v0, 11
		 li $a0, '\n'
	 	 syscall
#             cout << '\n';
		li $v0, 4
		la $a0, byeStr
		syscall
#             cout << byeStr;
		 li $v0, 11
		 li $a0, '\n'
	 	 syscall
#             cout << '\n';
		li $v0, 4
		la $a0, dlStr
		syscall
#             cout << dlStr;
	       li $v0, 11
	       li $a0, '\n'
	       syscall
#             cout << '\n';
#		
		li $v0, 10
		syscall
#             return 0;
#}
