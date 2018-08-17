#!/bin/bash

# Displays a list of executable programs with a brief description
# To save to a file call - bash listbin.sh> bashlist.txt 2> & 1
# Выводит список исполняемых программ с кратким описанием
# Для сохранения в файл вызывать - bash listbin.sh > bashlist.txt 2>&1

cd /bin;
pwd;
echo "";
find * -exec whatis '{}' \;
echo "";

cd /sbin;
pwd;
echo "";
find * -exec whatis '{}' \;
echo "";

cd /usr/bin;
pwd;
echo "";
find * -exec whatis '{}' \;
echo "";

cd /usr/sbin;
pwd;
echo "";
find * -exec whatis '{}' \;
echo "";


