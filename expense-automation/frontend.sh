#!/bin/bash

ID=$(id -u)
log="/tmp/frontend.log"

source common.sh

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