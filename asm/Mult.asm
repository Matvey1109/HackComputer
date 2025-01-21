// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.
// R2 = { R1 + ... + R1 } R0 times

// R2 = 0
@R2
M=0

// temp = R0 (temp is a random register taken from RAM)
@R0
D=M
@temp
M=D

// LOOP
(LOOP)

    // IF temp==0 JUMP END
    @temp
    D=M
    @END
    D;JEQ

    // R2 += R1
    @R1
    D=M
    @R2
    M=D+M

    // temp--
    @temp
    M=M-1
    D=M

    // ELSE IF temp>0 JUMP LOOP
    @LOOP
    D;JGT

// END PROGRAM
(END)
    @END
    D;JMP
