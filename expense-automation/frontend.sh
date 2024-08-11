#!/bin/bash

ID=$(id -u)
log="/tmp/frontend.log"

if [ "$ID" -ne 0 ] ; then
    echo -e "\e[31m Script is expected to be executed as root user or with sudo bash $0\e[0m"
fi

stat() {
    if [ $1 -eq 0 ] ; then
        echo -e "\e[32m - Success\e[0m"
    else
        echo -e "\e[31m - Failure\e[0m"   
    fi
}

color() {
    echo -e "\e[35m$*\e[0m"
}

if [ -f proxy.conf ] ; then
    color Proxy File Presense
    stat $?
else
    echo -e "\e[31m Proxy file not present, ensure you to suppy\e[0m"
    exit 1
fi

color Installing NGINX
dnf install nginx -y &>> $log
stat $?

color Copying Proxy
cp proxy.conf /etc/nginx/default.d/expense.conf &>> $log
stat $?

color Enabling NGNIX
systemctl enable nginx &>> $log
stat $?

color Cleanup
rm -rf /usr/share/nginx/html/* &>> $log
stat $?

color Downloading Frontend
curl -o /tmp/frontend.zip https://expense-web-app.s3.amazonaws.com/frontend.zip &>> $log
cd /usr/share/nginx/html &>> $log
stat $?

color Extracting Frontend
unzip /tmp/frontend.zip &>> $log
stat $?

color Starting Frontend
systemctl restart nginx &>> $log
stat $?

echo "**frontend installation completed**"