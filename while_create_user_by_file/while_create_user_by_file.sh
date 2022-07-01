#!/usr/bin/bash
# encoding:utf-8
# 通过user.txt文件，使用while循环创建用户
# author: hackwu
# 2022/7/1

set -u
num=0
while read line
do
	if [ ${#line} -eq 0 ];then
		contine			#直接跳到下一步循环
	fi
	username=$(echo $line|awk '{print $1}')
	password=$(echo $line|awk '{print $2}')
	id $username &>/dev/null	#判断用户是否存在
	if [ ! $? -eq 0 ];then
		useradd $username	#创建用户
		echo $password | passwd $username --stdin &>/dev/null	#设置密码
		((num++))
	fi

done < user.txt			#输入重定向
echo "创建完成，总共创建了$num 位用户"
