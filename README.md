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

Example of multiplexing / demultiplexing in communications networks
![mux_dmux](screenshots/mux_dmux.png)

## Arithmetic
ALU (Arithmetic Logic Unit) can compute eighteen functions using a minimal hardware design. It uses 6 control bits, where each bit corresponds to a specific elementary operation.

The following functions can be calculated using the control bits as follows:

![alu](screenshots/alu.png)

ALU also outputs two status bits.

![alu_output](screenshots/alu_output.png)

The following chips are implemented in this section:
 - HalfAdder, FullAdder, Add16, Inc16, ALU

## Memory
Storage is implemented using data flip-flops (DFF) and sequential logic. DFF implements out[t] = in[t-1]. The registers are 16 bits wide and consist of DFFs. These registers then combined to create random access memory (RAM). It allows data to be read/written from/to any address in constant time, regardless of physical location.

Finally, the program counter is also implemented using a 16-bit register, which has the following functions: reset to zero, load a specific value, and increment the current value.

List of implemented chips:
- Bit, Register
- RAM8, RAM64, RAM512, RAM4K, RAM16K
- PC
