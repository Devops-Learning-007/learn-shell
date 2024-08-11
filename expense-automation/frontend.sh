#!/bin/bash

ID=$(id -u)

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

color Installing NGINX
dnf install nginx -y &>>/tmp/frontend.log
stat $?

color Copying Proxy
cp proxy.conf /etc/nginx/default.d/expense.conf &>>/tmp/frontend.log
stat $?

color Enabling NGNIX
systemctl enable nginx &>>/tmp/frontend.log
stat $?

color Cleanup
rm -rf /usr/share/nginx/html/* &>>/tmp/frontend.log
stat $?

color Downloading Frontend
curl -o /tmp/frontend.zip https://expense-web-app.s3.amazonaws.com/frontend.zip &>>/tmp/frontend.log
cd /usr/share/nginx/html &>>/tmp/frontend.log
stat $?

color Extracting Frontend
unzip /tmp/frontend.zip &>>/tmp/frontend.log
stat $?

color Starting Frontend
systemctl restart nginx &>>/tmp/frontend.log
stat $?

echo "**frontend installation completed**"