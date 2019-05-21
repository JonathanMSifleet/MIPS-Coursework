#------------------------------

# allows a user to input their name (one string) and their student registration number (an integer
# number) and then output both to screen.

#-------------------------------

.data    

enterName:  .asciiz 	"Enter your name (max 20 characters):\n"
enterID: .asciiz	"Enter your student ID:\n"
buffer: .space 20 	# creates a buffer in memory
outputName: .asciiz 	"\nYour name is: "   
outputID: .asciiz	"\nYour student ID is: "

#-------------------------------

#This is the data segment

#-------------------------------

.text 

#-------------------------------

#This is the body of the code

#-------------------------------

main:
 
 #-------------------------------

 # read in user's name

 #-------------------------------

la $a0, enterName      # Load and print string asking for string
li $v0, 4              # load print string service into expression evaluation register
syscall

li $v0, 8	       # load read string service into expression evaluation register

la $a0, buffer 	       # create buffer in parameter register
la $a1, buffer	       # set maximum size for string to 20

move $t0, $a0          # save string to $t0
syscall

#-------------------------------

# read in user's studentID

#-------------------------------

la $a0, enterID      # Load string that asks user for their ID integer
li $v0, 4            # load print string service into expression evaluation register
syscall

li $v0, 5	     # load read integer service into expression evaluation register
syscall
move $t1, $v0	     # move integer

 #-------------------------------

 # print out user's name

 #-------------------------------

la $a0, outputName    	# load and print "Your name is" string
li $v0, 4               # load print string service into expression evaluation register
syscall			# print string

la $a0, buffer          # reload byte space to primary address
move $a0, $t0           # move contents of t0 to a0
li $v0, 4               # load print string service into expression evaluation register
syscall			# print string

 #-------------------------------

 # print out user's student ID

 #-------------------------------

la $a0, outputID    	# load and print "Your name is" string
li $v0, 4               # load print string service into expression evaluation register
syscall	


li $v0, 1              # load print integer service into expression evaluation register
move $a0, $t1          # integer to print
syscall 

 #-------------------------------

 # system call code for exit = 10

 #-------------------------------

li $v0, 10 		# load terminate service into expression eva;uation register

syscall
