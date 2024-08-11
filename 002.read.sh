#!/bin/bash

echo "This script will take input from the $(whoami)"

read -p "Enter the value of A:"
read -p "Enter the value of B:"

echo "Sum of the A + B = $((A+B))"
