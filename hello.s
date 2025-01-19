# Hello World in Assembly using printf

.global main

.text

main:
    enter $0, $0              # Set up stack frame

    mov $message, %rdi        # Load the address of the message string
    mov $0, %al               # Clear %al (required for printf)
    call printf               # Call printf to print "Hello, World!"

    # Perform the calculation (2 * a + b * c) >> 4
    mov a, %rax               # Load a into rax
    add %rax, %rax            # Multiply a by 2 (rax = 2 * a)

    mov b, %rbx               # Load b into rbx
    mov c, %rcx               # Load c into rcx
    imul %rcx, %rbx           # Multiply b * c (rbx = b * c)

    add %rbx, %rax            # Add (2 * a) + (b * c)

    shr $4, %rax              # Right shift by 4 (>> 4)

    # Print the result of (2 * a + b * c) >> 4
    mov $long_format, %rdi    # Load the format string
    mov %rax, %rsi            # Move the result into rsi
    mov $0, %al               # Clear %al for printf
    call printf               # Call printf to print the result

    # Call labs(d)
    mov d, %rdi               # Load the value of d into %rdi (input to labs)
    call labs                 # Call the labs function

    # Print the result of labs(d)
    mov $long_format, %rdi    # Load the format string
    mov %rax, %rsi            # Move the result (returned by labs) into rsi
    mov $0, %al               # Clear %al for printf
    call printf               # Call printf to print the result

# Perform the calculation labs((d * e) << 3)
    mov d, %rax               # Load the value of d into rax
    imul e, %rax              # Multiply d by e (rax = d * e)
    shl $3, %rax              # Left shift by 3 (rax = (d * e) << 3)
    mov %rax, %rdi
    call labs

 # Print the result of labs(d)
    mov $long_format, %rdi    # Load the format string
    mov %rax, %rsi            # Move the result (returned by labs) into rsi
    mov $0, %al               # Clear %al for printf
    call printf               # Call printf to print the result


    leave                     # Clean up the stack frame
    ret                       # Return from main

.data
message:
    .asciz "Hello, World!\n"

long_format:
    .asciz "%ld\n"

a: .quad 0x3908               # a = 0x3908
b: .quad 0x721                # b = 0x721
c: .quad 16                   # c = 16
d: .quad -32                  # d = -32
e: .quad 64                   # e = 64


