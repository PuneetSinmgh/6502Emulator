# CS 595 Virtual Machines : 6502v Emulator
## Jake, Malip, Puneet

## Approach
Instead of the conventional approach, Decode and Dispatch, this project is required to implement the interpreter with the direct threaded interpretation to avoid overhead which is caused by control flows, such as the while-loop, switch statement.

## Main missions to be achived together
1. each instruction handler
2. threaded interpretator
3. decode function
   - How should we know which bit stands for which flag?
     - Is there any resource?
   - The instruction sets have specific instr length. Depending on its length, program counter varies.