#!/bin/bash

echo "This script will take input from the $(whoami)"

read -p "Enter the value of A:" $A
read -p "Enter the value of B:" $B

echo "Sum of the A + B = $((A+B))"
