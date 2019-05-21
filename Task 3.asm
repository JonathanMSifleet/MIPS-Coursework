#------------------------------

# Create a fully commented programme that allows a user to input the last 
# two digits of their student registration number then divides that number by 
# 2 and outputs the nearest quotient INTEGER result to screen.

#-------------------------------

.data    

enterID: .asciiz	"Enter the last 5 digits of your student ID:\n"
result: .asciiz		"The result of your student ID divided by 3.3 is: "

divisor: .float 3.3     # stores the value 3.3 as a float

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

move $t0, $v0	     # move integer in v0 to temporary register 0

sw $t0, -100($fp)    # store value in frame pointer with an offset of -100 bytes in t0 as a word
lwc1 $f0, -100($fp)  # move word stored in frame pointer with an offset of -100 bytes in float register 0
cvt.s.w $f0, $f0     # convert the word to single precision float

#------------------------------

# divide input by 3.3

#-------------------------------

l.s $f1, divisor      # load value 3.3 into float register 0

div.s $f2 $f0, $f1    # divide user's input (f0) by value in $f1 (3.3), store in f2

#-------------------------------

# round value

#-------------------------------

round.w.s $f2, $f2    # round value in f2, store result in f2
mfc1 $t0, $f2	      # move value in f2 into t0

#-------------------------------

# print result

#-------------------------------

la $a0, result        # load and print "The result of your student ID divided by 3.3 is: " string
li $v0, 4             # load print string service into expression evaluation register
syscall	

li $v0, 1             # load print integer service into expression evaluation register
move $a0, $t0         # move the value in t0 to a0, required to print integer
syscall


#-------------------------------

# system call code for exit = 10

#-------------------------------

li $v0, 10 	      # load terminate service into expression evaluation register
syscall
