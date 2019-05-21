#------------------------------

# Create a fully commented programme that allows a user to input the last 
# two digits of their student registration number then divides that number by 
# 2 and outputs the nearest quotient INTEGER result to screen.

#-------------------------------

.data    

enterID: .asciiz	"Enter the last two digits of your student ID:\n"
quotient: .asciiz	"The quotient of your student ID when divided by 2 is: "

#-------------------------------

#This is the data segment

#-------------------------------

.text 

#-------------------------------

#This is the body of the code

#-------------------------------

main:

#-------------------------------

# read in user's studentID

#-------------------------------

la $a0, enterID      # Load string that asks user for their ID
li $v0, 4            # load print string service into expression evaluation register
syscall

li $v0, 5	     # load read integer service into expression evaluation register
syscall
move $t0, $v0	     # move integer to temporary register 0

#-------------------------------

# divide input by two

#-------------------------------

addi $t1, $zero 2    # add the value 2 to temporary register 1
div $t0, $t1 	     # divide user's input by value in $t1 (by 2)
mflo $s0 	     # move quotient from lo register into s0

#-------------------------------

# print result

#-------------------------------

la $a0, quotient    	# load and print "The quotient of your student ID divided by 2 is: " string
li $v0, 4               # load print string service into expression evaluation register
syscall	

li $v0, 1              # load print integer service into expression evaluation register
move $a0, $s0          # move the quotient into the a0 register
syscall 

#-------------------------------

# system call code for exit = 10

#-------------------------------

li $v0, 10 		# load terminate service into expression evaluation register
syscall
