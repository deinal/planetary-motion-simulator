# Planetary motion simulator
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Fortran](https://img.shields.io/badge/Fortran-90-blue.svg)](https://shields.io/)
[![Space](https://img.shields.io/badge/Planets&Stuff-yes-green.svg)](https://shields.io/)

Simulating the solar system :stars:

## Run
In src:
```
gfortran -c verlet.f90 main.f90 && gfortran verlet.o main.o
./a.out
```
