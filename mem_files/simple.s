# simple.s

	.text
	.globl __start

__start:
	# Somesimple arithmetic
	addiu   $t0, $zero, 3      # Add 0 + 3 and store the result in t0
	addiu   $t1, $zero, 4      # Add 0 + 4 and store the result in t1
	addu    $t2, $t0, $t1   # Add t0 + t1 and store the result in t2
	sll     $t3, $t2, 2     # Shift the contents of t2 left by 2 bits# (same as multiply by 4)

	# Exit
	addiu   $v0, $zero, 10     # Prepare to exit (system call 10)
	syscall                 # Exit