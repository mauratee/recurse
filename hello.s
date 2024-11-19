// hello world program
// AArch 64, ARMv9 assembly language for Apple M4 Silicon Chip
// ARMv8 A64 Quick Reference: https://courses.cs.washington.edu/courses/cse469/19wi/arm64.pdf
// Linux man page syscall(): https://man7.org/linux/man-pages/man2/syscall.2.html
// Examples of assembly code for Apple M1 Silicon Chip: https://github.com/jdshaffer/Apple-Silicon-ASM-Examples
// Apple Darwin XNU kernel syscalls.master: https://github.com/apple/darwin-xnu/blob/main/bsd/kern/syscalls.master


.global _main // main function, tells Linux where the beginning of the program is
.align 2 // align current location to specified boundary

// main function
_main:
    b _print
    b _terminate // call terminate function

_print:
    /* syscall write(int fd, const void *buf, size_t count) */
    mov X0, #1 // pass 1(stdout) into register 0
    adr X1, helloworld // pass address of helloworld string into register 1 
    mov X2, #12 // the length of hello world string
    mov X16, #4 // write to stdout
    svc 0 // callSupervisor()

_terminate:
    /* syscall exit(int status) */
    mov X0, #0 // pass 0 into parameter register 0
    mov X16, #1 // pass terminate, #1, into intra-procedure-call register
    svc 0 // callSupervisor()

helloworld:
    .ascii "hello world\n"    