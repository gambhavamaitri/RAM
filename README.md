A hardware design implemented in Verilog that combines a 256-entry 32-bit RAM with an integrated ALU (Arithmetic Logic Unit). 
The ALU operates directly on memory-mapped registers, making computation as simple as writing operands and an opcode into RAM — the result appears automatically in a protected output register.if we try to write something in output address it give us to error
Unlike traditional designs where the ALU and memory are separate, here the RAM itself is the interface — no separate instruction bus needed.
