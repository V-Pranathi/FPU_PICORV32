# FPU_PICORV32
## Table Of Contents
- [Square root of a floating point number](#square-root-of-a-floating-point-number)
  - [Post Synthesis Funtional Simulations](#post-synthesis-funtional-simulations)
- [Matrix Multiplication of a floating point number](#matrix-multiplication-of-floating-point-number)
- [References](#references)
### Square root of a floating point number

* An iterative approach using Newton_raphson Method is proposed to find the square root of a floating point.
* We will be finding the square root of 1/N and multipling it with N at the end to get the square root of N.
* This will be giving us an algorithm which does not need a floating point division thereby optimising the implementation of finding square root of floating point numbers using Newton Rapson's Method.
* The below equations gives us more detailed explanation of the methodology used for implementing the square root of the number:
    
![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/140998470/f2162eba-ac3e-44b7-84a8-18d7abfd3861)  

**Resource Utilization**  

| Design   |  LUTs   | Regs   |  MUXs |  DSPs  |  BUFGCTRL  |  Frequency  |  ADP * 10^4  | 
| -------- | ------- | ------ | ----- | ------ | ---------- | ----------- | ------------ |
| Square root  | 2766 | 132   | 14    | 16     |     1      |  7.013      |  426.92      |  

#### Post Synthesis Funtional Simulations  
![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/140998470/ec78c9f9-bb65-46fd-9eb8-601c4cdcee5c)  
|Hexa number | Decimal number |
|------------|----------------|
| 32'h436de58e| 237.8967   |

## Matrix Multiplication of a Floating Point Number
## Parameterised matrix multiplication using systolic arrays  

The chip design for a Systolic Array which can multiply two parametrised for N*M Matrices of IEEE 754 single precision floating points. This model consists of Processing Elements(PE) and few delay blocks.


## Introduction

Matrix Multiplication can particularly be done by many algorithms. Here, matrix multiplication for 3x3 matrices is specially discussed using the Systolic array which is a hardware structure used for operating matrix multiplication fastly as well as effeciently. The Processing elements in a Systolic Array are programmed to have a same operation. 

Below is the block diagram of the Systolic Array used in this model with appropriate indexing used in the code. Every block of the Systolic Array is connected to a same clock.

<p align="center">
  <img  src="https://github.com/Ayyappa1911/iiitb_sysarray/blob/main/Images/sysArray.png">
</p>

Systolic Array has mainly two different types of Components triggered by the same clock. They are:

### Processing Element (PE)

 A Processing Element is a part of an hardware structure called systolic arrays alternatively called as cells. Processing Elements perform a common operation which are generally simple, but for different kinds of input. These cells will have memory banks for holding the data after each computation in the Processing Element.
 
 The Processing Element in this particular systolic array has three inputs c, b, and c which has outputs a’ = a, b’ = b, and c’ = c + a * b. The operation c + a * b can be considered as the common operation programmed in these processing elements. The outputs a’, and b’ are the outcome of the property of the PE acting as a hardware Register holding data for a clock cycle. These operations are briefly described in the below block diagram.
 
 <p align="center">
  <img  src="https://github.com/Ayyappa1911/iiitb_sysarray/blob/main/Images/PE_int.png">
</p>

### Delay Block

A Delay block is just a group of flipflops for holding data for a clock cycle which is triggered to all the Delay blocks and Processing Elements at a time. These are used to make the Systolic Array symmetrical. In this case the Systolic Array is 5x5 structured. The inputs to the delay block are a, and b.
The outputs of the delay block are a’ = a, and b’ = b. The schematic of delay block is given below. 

 <p align="center">
  <img  src="https://github.com/Ayyappa1911/iiitb_sysarray/blob/main/Images/delay_block.png">
</p>

## Systolic Array 

The systolic array used for matrix multiplication of 3x3 matrices of integer data types have inputs A3x3, and B3x3.

The whole process process takes 8 clock cycles of duration, In which each row of the Matrix A is passed to a00 , a10, and a20 and the first column of Matrix B is passed to b00 , b01, and b02. The second row of the Matrix A is passed to a10 , a20, and a30, and the second column of the Matrix B is passed to b01 , b02 , and b03 respectively. Similarly, The third of row of the Matrix A is passed to a20 , a30 , and a40, and the third column of the Matrix B is passed to b02 , b03 and b04 respectively in the first consecutive clock cycles.Other values remains as zero.

The output of the Matrices Multiplication namely D is collected at c35, c45, c55, c35 , and c45 of the systolic array. D00, D01, D02, D10, and D20 are collected at c55, c45, c35, c54, and c53 indices of the systolic array at 6th clock cycle of the process.Similarly, The indices D12, D11, D21 of the output matrix are collected at the indices c45, c55, and c54 of the systolic array at 7th clock cycle of the process. Lastly, the index D22 of the Matrix D is collected at the index c55 of the systolic array at 8th clock cycle of the process.

 <p align="center">
  <img  src="https://github.com/Ayyappa1911/iiitb_sysarray/blob/main/Images/Input_systolic.png">
</p>  

### References  
- https://digitalsystemdesign.in/fast-computation-square-root-and-its-reciprocal/
  
