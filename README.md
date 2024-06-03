# Hyperbolic_CORDIC
Study and Implementation of "An Efficient Scaling-Free Folded Hyperbolic CORDIC Design Using a Novel Low-Complexity Power-of-2 Taylor Series Approximation" | FPGA | ASIC | 45 nm tech

### FPGA and ASIC Implementations were done for the design and a comparative study was done based on various standard readings. 

## Input formats 
### 8-bit
![Screenshot from 2024-06-03 21-43-14](https://github.com/emillal/Hyperbolic_CORDIC/assets/38190245/7fc7c1b2-46cb-4427-94c7-90a940219eb1)
### 16-bit
![Screenshot from 2024-06-03 21-43-03](https://github.com/emillal/Hyperbolic_CORDIC/assets/38190245/0954d3dc-c279-4f25-83ce-c54b6f1d8d56)
### 21-bit
![Screenshot from 2024-06-03 21-43-51](https://github.com/emillal/Hyperbolic_CORDIC/assets/38190245/19ab380c-6447-4c02-a5e1-c621da6000cf)
The word lengths are then extended to 21 bits to accommodate for the range (-π,π). This is done to extend the proposed design range (-π/4,π/4) to (-π,π).



## Vivado Schematic
Below is the schematic for the design which is elaborated in Xilinx Vivado.<br />
![Screenshot from 2024-06-03 21-39-51](https://github.com/emillal/Hyperbolic_CORDIC/assets/38190245/ecfa7b61-4bb4-43bd-8ab8-05cc6b0e06d6)

## FPGA Implementation Floorplan

Zedboard was used to do the FPGA prototypeing for the CORDIC design.<br />
![Screenshot from 2024-06-03 21-46-18](https://github.com/emillal/Hyperbolic_CORDIC/assets/38190245/f54c9d40-8a33-4cf8-8cf9-a580f2481b60)

## ASIC Implementation

ASIC Physical Implementation of the design and comparing design was done using Cadence tools such as Genus and Innovus.<br />
GPDK 45nm technology node was used here.
![Screenshot from 2024-06-03 21-47-02](https://github.com/emillal/Hyperbolic_CORDIC/assets/38190245/769fc9ea-4514-4e10-8238-08f657c18ed3)
