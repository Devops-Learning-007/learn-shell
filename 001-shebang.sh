#!/bin/bash

echo Welcome to Bash Scripting

echo Line1
echo Line2
echo Line3

echo -e "Line4\nLine5"

echo -e "Devops\tAWS\tBatch\t58"

echo -e "\e[35m this shows Magenta color \e[0m"

echo -e "\e[32mthis shows green color\e[0m"

echo -e "\e[46;35mPrinting text with background color\e[0m"

a=10
b=1.5

echo -e "Value of a is \e[46;33m$a\e[0m"
echo -e "Value of b is \e[46;33m$b\e[0m"

DATE=$(date +%F)

echo "Today date is $DATE"

User=$1
Department=$2

echo "Script Executed by $1 belongs to department $2"

echo "Script Executed by $(whoami) belongs to department $2"

echo "Name of the script is $0"

echo "Print the arguments in the code $#"


