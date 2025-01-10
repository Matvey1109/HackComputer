# Hack Computer

<img src="https://static.wixstatic.com/media/44046b_387f62dae530480dac9b1fa8f731bebf~mv2.png" alt="Image Description">

Hack is a 16-bit computer designed for the [nand2tetris](https://www.nand2tetris.org/) course, which is meant to be simple but Turing complete.

[More about Hack computer](https://en.wikipedia.org/wiki/Hack_computer)

# Hardware
This section is aimed at creating the bare-bones of the computer. First, we create simple logic gates, and then use them to further create more complex hardware. The logic is written in a special Hardware Description Language (HDL) specified [here](https://docs.wixstatic.com/ugd/44046b_2cc5aac034ae49f4bf1650a3d31df32c.pdf).

## Logic Gates
All logic gates are created from the primitive NAND gate. Here is a list of gates that have been implemented:
 - **Basic**: Nand, Not, And, Or, Xor, Mux, DMux
 - **Multi-Bit:** Not16, And16, Or16, Mux16
 - **Multi-Way:** Or8Way, Mux4Way16, Mux8Way16, DMux4Way, DMux8Way

## Arithmetic
ALU can compute eighteen functions using a minimal hardware design. It uses 6 control bits, where each bit corresponds to a specific elementary operation.

| control-bit | description                      |
| ----------- | ---------------------------------|
| **zx**          | zero the x input?                |
| **nx**          | negate the x input?              |
| **zy**          | zero the y input?                |
| **ny**          | negate the y input?              |
| **f**           | compute x+y (if == 1) or x&y (if == 0) |
| **no**          | negate the output?               |

The following functions can be calculated using the control bits as follows:

| #   | zx  | nx  | zy  | ny  | f   | no  | f(x,y) |
| --- | --- | --- | --- | --- | --- | --- | ------ |
| **1**   | 1   | 0   | 1   | 0   | 1   | 0   | 0      |
| **2**   | 1   | 1   | 1   | 1   | 1   | 1   | 1      |
| **3**   | 1   | 1   | 1   | 0   | 1   | 0   | -1     |
| **4**   | 0   | 0   | 1   | 1   | 0   | 0   | x      |
| **5**   | 1   | 1   | 0   | 0   | 0   | 0   | y      |
| **6**   | 0   | 0   | 1   | 1   | 0   | 1   | !x     |
| **7**   | 1   | 1   | 0   | 0   | 0   | 1   | !y     |
| **8**   | 0   | 0   | 1   | 1   | 1   | 1   | -x     |
| **9**   | 1   | 1   | 0   | 0   | 1   | 1   | -y     |
| **10**  | 0   | 1   | 1   | 1   | 1   | 1   | x+1    |
| **11**  | 1   | 1   | 0   | 1   | 1   | 1   | y+1    |
| **12**  | 0   | 0   | 1   | 1   | 1   | 0   | x-1    |
| **13**  | 1   | 1   | 0   | 0   | 1   | 0   | y-1    |
| **14**  | 0   | 0   | 0   | 0   | 1   | 0   | x+y    |
| **15**  | 0   | 1   | 0   | 0   | 1   | 1   | x-y    |
| **16**  | 0   | 0   | 0   | 1   | 1   | 1   | y-x    |
| **17**  | 0   | 0   | 0   | 0   | 0   | 0   | x&y    |
| **18**  | 0   | 1   | 0   | 1   | 0   | 1   | x\|y   |

ALU also outputs two status bits.

| status-bit | description             |
| ---------- | ----------------------- |
| **zr**         | is the output zero?     |
| **ng**         | is the output negative? |

The following chips are implemented in this section:
 - HalfAdder, FullAdder, Add16, Inc16, ALU
