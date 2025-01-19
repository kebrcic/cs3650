# Hello World in Assembly using printf

.global main

.text

main:
    enter $0, $0

    mov $message, %rdi
    mov $0, %al
    call printf

    leave
    ret

.data
message:
    .asciz "Hello, World!\n"
