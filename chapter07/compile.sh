#!/bin/bash

as -gstabs -o inttest.o inttest.s
ld -o inttest inttest.o
./inttest
