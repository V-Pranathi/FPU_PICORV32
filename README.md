# RISC-ers_FPU_PICORV32
## Table Of Contents
- [Square root of a floating point number](#square-root-of-a-floating-point-number)
  - [Post Synthesis Functional Simulations](#post-synthesis-funtional-simulations)
- [Matrix Multiplication of a floating point number](#matrix-multiplication-of-a-floating-point-number)
- [References](#references)
### Square root of a floating point number

* An iterative approach using the Newton_raphson Method is proposed to find the square root of a floating point.
* We will be finding the square root of 1/N and multiplying it with N at the end to get the square root of N.
* This will give us an algorithm that does not need a floating point division thereby optimizing the implementation of finding the square root of floating point numbers using Newton Rapson's Method.
* The below equations give us a more detailed explanation of the methodology used for implementing the square root of the number:
    
![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/140998763/d325341a-caa2-49a4-9d03-aa801e976d9b)

**Resource Utilization**  

![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/140998763/c7531892-7fb3-402f-b73c-bf5d1f69882c)

| Design   |  LUTs   | Regs   |  MUXs |  DSPs  |  BUFGCTRL  |  Frequency  |  ADP * 10^4  | 
| -------- | ------- | ------ | ----- | ------ | ---------- | ----------- | ------------ |
| Square root  | 2766 | 132   | 14    | 16     |     1      |  7.013      |  426.92      |  

**Timing Report**

The clock constraints are being set to 100MHz.

![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/140998763/d2e7b82f-77e1-4220-9110-09ca6caf0633)


#### Post Synthesis Functional Simulations  
![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/140998470/ec78c9f9-bb65-46fd-9eb8-601c4cdcee5c)  
|Hexa number | Decimal number |
|------------|----------------|
| 32'h436de58e| 237.8967   |

#### Post Synthesis Schematic 
![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/140998763/fa1eccaa-c2da-4fcf-8861-8e9b23dc60b4)

## Matrix Multiplication of a Floating Point Number
## Parameterised matrix multiplication using systolic arrays  

The chip design for a Systolic Array can multiply two parametrized N*M Matrices of IEEE 754 single precision floating points. This model consists of Processing Elements(PE) and few delay blocks.


## Introduction

Matrix Multiplication can particularly be done by many algorithms. Here, matrix multiplication for 3x3 matrices is specially discussed using the Systolic array which is a hardware structure used for operating matrix multiplication fastly as well as effeciently. The Processing elements in a Systolic Array are programmed to have the same operation. 

Below is the block diagram of the Systolic Array used in this model with appropriate indexing used in the code. Every block of the Systolic Array is connected to a same clock.

<p align="center">
  <img  src="https://github.com/Ayyappa1911/iiitb_sysarray/blob/main/Images/sysArray.png">
</p>

A Systolic Array has mainly two different types of Components triggered by the same clock. They are:

### Processing Element (PE)

 A Processing Element is a part of a hardware structure called systolic arrays alternatively called as cells. Processing Elements perform a common operation which are generally simple, but for different kinds of input. These cells will have memory banks for holding the data after each computation in the Processing Element.
 
 The Processing Element in this particular systolic array has three inputs c, b, and c which has outputs a’ = a, b’ = b, and c’ = c + a * b. The operation c + a * b can be considered as the common operation programmed in these processing elements. The outputs a’, and b’ are the outcome of the property of the PE acting as a hardware Register holding data for a clock cycle. These operations are briefly described in the below block diagram.
 
 <p align="center">
  <img  src="https://github.com/Ayyappa1911/iiitb_sysarray/blob/main/Images/PE_int.png">
</p>

### Delay Block

A Delay block is just a group of flipflops for holding data for a clock cycle triggered by all the Delay blocks and Processing Elements at a time. These are used to make the Systolic Array symmetrical. In this case the Systolic Array is 5x5 structured. The inputs to the delay block are a and b.
The outputs of the delay block are a’ = a and b’ = b. The schematic of the delay block is given below. 

 <p align="center">
  <img  src="https://github.com/Ayyappa1911/iiitb_sysarray/blob/main/Images/delay_block.png">
</p>

## Systolic Array 

The systolic array used for matrix multiplication of 3x3 matrices of integer data types has inputs A3x3, and B3x3.

The whole process process takes 8 clock cycles of duration, In which each row of the Matrix A is passed to a00 , a10, and a20 and the first column of Matrix B is passed to b00 , b01, and b02. The second row of the Matrix A is passed to a10 , a20, and a30, and the second column of the Matrix B is passed to b01 , b02 , and b03 respectively. Similarly, The third of row of the Matrix A is passed to a20 , a30 , and a40, and the third column of the Matrix B is passed to b02 , b03 and b04 respectively in the first consecutive clock cycles.Other values remains as zero.

The output of the Matrices Multiplication namely D is collected at c35, c45, c55, c35 , and c45 of the systolic array. D00, D01, D02, D10, and D20 are collected at c55, c45, c35, c54, and c53 indices of the systolic array at 6th clock cycle of the process.Similarly, The indices D12, D11, D21 of the output matrix are collected at the indices c45, c55, and c54 of the systolic array at 7th clock cycle of the process. Lastly, the index D22 of the Matrix D is collected at the index c55 of the systolic array at 8th clock cycle of the process.

 <p align="center">
  <img  src="https://github.com/Ayyappa1911/iiitb_sysarray/blob/main/Images/Input_systolic.png">
</p>  

#### Elaborated Design in Vivado

 <p align="center">
  <img  src="https://github.com/V-Pranathi/FPU_PICORV32/blob/main/images/elaborated_1.png">
</p>  

 <p align="center">
  <img  src="https://github.com/V-Pranathi/FPU_PICORV32/blob/main/images/elaborated_2.png">
</p>  

**Resource Utilization**  

| Design   |  LUTs   | Regs   |  MUXs |  DSPs  |  BUFGCTRL  |  Frequency  |  ADP * 10^4  | 
| -------- | ------- | ------ | ----- | ------ | ---------- | ----------- | ------------ |
| Square root  | 2766 | 132   | 14    | 16     |     1      |  7.013      |  426.92      |  


**Timing and utilization summary**

![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/77966806/22d77194-9951-4a0b-a4b0-ca99eb20f092)

![image](https://github.com/V-Pranathi/FPU_PICORV32/assets/77966806/e87bba3f-fc4d-405b-822b-fa6de3c9d3f2)


Synthesis results are generated for A(4x4) and B(4x4) matrix

Matrix A
| 1.5      |  0.25   | 3.75   |  0.125|
| -------- | ------- | ------ | ----- |
| 2.0      | 1.0     |  2.5   |  0.25 | 
| 1.75     | 0.4     | 2.25   | 0.1   | 
| 0.2      | 0.15    | 0.3    | 2.0   | 

Matrix B

| 0.25     |  0.2    | 1.5    |  0.15 |
| -------- | ------- | ------ | ----- |
| 0.1      | 0.5     |  0.1   |  0.2  | 
| 0.3      | 0.75    | 0.15   | 0.1   | 
| 0.2      | 0.1     | 0.3    | 0.75  | 

output Matrix  
| 1.55     |  3.25   | 2.875  |  0.7475 |
| -------- | ------- | ------ | -----   |
| 1.4      | 2.8     |  3.55  |  0.9375 | 
| 1.17525  | 2.2475  | 3.0325 | 0.6425  | 
| 0.555    | 0.54    | 0.96   | 1.59    | 

Expected Output in IEEE-754 Single Precision Format

| 3fc66666 |  40500000   | 40380000  |  3f3e6666 |
| -------- | ------- | ------ | ----- |
| 3fb33333 | 40333333 |  406333333  |  3f700000  | 
| 3f96147b | 400fd70a | 4042147b   | 3f247ae1    | 
| 3f0e147b | 3f0a3d71 | 3f75c28f   | 3fcb851f  | 

Observed Output in IEEE-754 Single Precision Format

| 3fc66668 |  40500000   | 40380000  |  3f3e6668 |
| -------- | ------- | ------ | ----- |
| 3fb33334 | 40333334 |  406333332  |  3f700002  | 
| 3f96147c | 400fd70c | 4042147c   | 3f247ae2    | 
| 3f0e147c | 3f0a3d72 | 3f75c290   | 3fcb851e  | 

### Post-Synthesis Functional simulation waveforms

 <p align="center">
  <img  src="https://github.com/V-Pranathi/FPU_PICORV32/blob/main/images/sys_img_1.png">
</p>  

 <p align="center">
  <img  src="https://github.com/V-Pranathi/FPU_PICORV32/blob/main/images/sys_img_2.png">
</p>  

 <p align="center">
  <img  src="https://github.com/V-Pranathi/FPU_PICORV32/blob/main/images/sys_img_3.png">
</p>  

 <p align="center">
  <img  src="https://github.com/V-Pranathi/FPU_PICORV32/blob/main/images/sys_img_4.png">
</p>  

### References  
- https://digitalsystemdesign.in/fast-computation-square-root-and-its-reciprocal/

## Contributors

Ayyappa

Pranathi

Niharika

Rachana

  
