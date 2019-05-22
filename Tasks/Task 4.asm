#------------------------------

# Using the “random” Syscall combined with a loop structure, write the MIPs assembly language to
# provided to calculate the sum of 8 random integers

#-------------------------------

.data    

#-------------------------------

#This is the data segment

#-------------------------------

.text 

#-------------------------------

#This is the body of the code

#-------------------------------

main:

#-------------------------------

# setup registers

#-------------------------------

li $t0 0 # iteration counter
li $t1 0 # sum of all random numbers

#-------------------------------

# generate random numbers

#-------------------------------

li $a1, 6  	      # load max bound value into a1
li $v0, 42  	      # load random integer sercice into expression evaluation register

loop:
beq  $t0, 8, printInt # if the iteration counter = 8 (number of loops) then print out sum of integers

syscall 	      # generate the random number
    
add $a0, $a0, 1       # add lowest bound to a0

add $t1, $t1, $a0     # add random int to sum of ints

addi $t0, $t0, 1      # increment loop counter by 1


j loop                # jump to top of loop

#-------------------------------

# print sum of random numbers

#-------------------------------

printInt:

move $a0, $t1         # move sum of all random ints (t1) to a0

li $v0, 1             # load print integer service into expression evaluation register
syscall

#-------------------------------

# system call code for exit = 10

#-------------------------------

li $v0, 10 	      # load terminate service into expression evaluation register
syscall