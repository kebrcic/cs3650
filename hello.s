# Hello World in Assembly using printf

.global main

.text

main:
    enter $0, $0

    mov $message, %rdi
    mov $0, %al
    call printf

# Perform the calculation (2 * a + b * c) >> 4
    mov a, %rax             # Load a into rax
    add %rax, %rax          # Multiply a by 2 (rax = 2 * a)

    mov b, %rbx             # Load b into rbx
    mov c, %rcx             # Load c into rcx
    imul %rcx, %rbx         # Multiply b * c (rbx = b * c)

    add %rbx, %rax          # Add (2 * a) + (b * c)

    shr $4, %rax            # Right shift by 4 (>> 4)

    # Print the result using printf("%ld\n")
    mov $long_format, %rdi  # Load the format string
    mov %rax, %rsi          # Move the result into rsi
    mov $0, %al             # Clear %al for printf
    call printf

    leave
    ret

.data
message:
    .asciz "Hello, World!\n"

a: .quad 0x3908
b: .quad 0x721
c: .quad 16

long_format:
    .asciz "%ld\n"
