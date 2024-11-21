// To Run Program
// as addnum.s -o addnum.o : use assembler to create output file
// ld -o addnum addnum.o : use linker to create executable file from outpur file
// ./addnum : run executable file
// echo $? : echo exit code stored in built-in variable to output


.global _main
.align 2

_main:
    b _add
    b _terminate

_add:
    mov X0, #10  // load int 10 into register 0 
    mov X1, #11  // load int 11 into register 1
    add X2, X0, X1  // call add on register 1 and 0 and output result to register 2

_terminate:
    mov X0, X2  // move result from register 2 to register 0
    mov X16, #1  // exit syscall
    svc 0  // invoke syscall
