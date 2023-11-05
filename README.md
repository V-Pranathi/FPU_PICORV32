# FPU_PICORV32
## Table Of Contents
- [Square root of a floating point number](#square-root-of-a-floating-point-number)
  - [Post Synthesis Funtional Simulations](#post-synthesis-funtional-simulations) 
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


### References  
- https://digitalsystemdesign.in/fast-computation-square-root-and-its-reciprocal/
  
