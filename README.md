# verilog_simple_codes
This repository contains Verilog codes implementing some simple funtionalities and basic concepts.

# Contents
> - Modules
> - Usage
> - Contributing

# Modules
1. Adder/Subtractor --> **addr_subtractr.v** implements a hardware that adds or subtracts depending on a Selector bit.
2. Count one --> con_one module in **count_one.v** implements a for loop to count the number of 1s in a incoming data stream of 15 bit.
3. Clock frequency divison --> div_three module in **div_three_clk.v** divides the clock frequency by a factor of thee and divided_two module in **divided_two.v** divides the incoming clock frequency by two.
4. Moore machine --> abb_count module in **moore_mach.v** implements Moore Machine concept to recognise a string of "abb". The file also contains a small introduction to Moore Machine.
  All the module has their corresponding testbenches except the Adder/Subtractor module.
5. Mul22x15 --> Signed multiplication of 22 bit number with 15 bit number using 8 bit multiplier and adders
6. Complex Multiplier --> Multiplication of two complex numbers once using three multipliers and another time using four multipliers
7. Mul_bBRAM --> Multiplication using BRAM
8. RAM --> A simple RAM of that can hold 1024 words where each word length is 18 bit, so a 2.25kB RAM 

# Usage
1. Clone the repo using: https://github.com/dip-0011/verilog_simple_codes.git
2. Simulate the designs using a Verilog simulation tool of your choice.
3. Modify the testbenches or input values to test different scenarios.

# Contributing 
Contributions are welcome! If you find any issues or improvements, please feel free to open an issue or submit a pull request.
