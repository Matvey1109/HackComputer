// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed,
// the screen should be cleared.

(INFINITE_LOOP)
    @SCREEN    // Address of the first screen memory location (16384)
    D=A

    // R1 - to store the current address
    @R1
    M=D

    @24576     // Address just past the last screen memory location (24575 + 1)
    D=A

    // R2 - to store the end address
    @R2
    M=D

    @KBD       // KBD = 24576 (keyboard memory location)
    D=M        // D = key pressed (ASCII code or 0 if no key is pressed)

    @BLACK     // If D > 0, jump to BLACK
    D;JGT

    @WHITE     // If D == 0, jump to WHITE
    D;JEQ

(BLACK)
    @R1
    A=M
    M=-1       // Set the screen word to -1 (blacken all pixels)

    // R1 += 1
    @R1
    M=M+1

    @R1
    D=M
    @R2
    D=D-M
    @INFINITE_LOOP
    D;JEQ      // If R1 == R2, return to infinite loop

    @BLACK // Otherwise, continue blackening
    0;JMP

(WHITE)
    @R1
    A=M
    M=0        // Set the screen word to 0 (clear all pixels)

    // R1 += 1
    @R1
    M=M+1

    @R1 
    D=M
    @R2
    D=D-M
    @INFINITE_LOOP
    D;JEQ      // If R1 == R2, return to infinite loop

    @WHITE // Otherwise, continue clearing
    0;JMP

(END)
    @END       // End of the program
    0;JMP
