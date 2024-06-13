#! /bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then
echo "Please run this script as root"
else
apt-get install git-all
fi