#!/bin/bash

echo "This script will take input from the $(whoami)"

read -p "Enter the value of A:" A
read -p "Enter the value of B:" B

echo "Value of A is $A"
echo "Value of B is $B"

echo "Sum of the A + B = $((A+B))"

Action=$1

stat() {
    echo "Today date is $(date)"
    echo "load average on the system is $(uptime)"
    echo "run level of the system is $(runlevel)"
}

stat

runlevel


if [ "$?" = "0" ] ; then
    echo -e "\e[32m Command ran successfully with exit code $?\e[0m"
elif [ "$1" = "127" ] ; then
    echo -e "\e[35m Command not executed successfully with exit code $?\e[0m"
else 
    echo -e "no command executed"
fi





