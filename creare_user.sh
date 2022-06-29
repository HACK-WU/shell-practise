#!/usr/bin/bash

#用于创建一个用户，默认密码为123
#管理员从键盘输入需要创建的用户名，回车即可

set -u
#如果变量不存在，引用将会放错报错：
read -p "请输入需要创建的用户名: " username	#从键盘输入用户名
defalut_passwd="123"				#默认密码
if ! id $username &>/dev/null ;then		#判断用户是否已经存在
	useradd $username	#创建用户
	echo $defalut_passwd| passwd $username --stdin	#创建密码为123
	echo "创建成功,默认密码为:$defalut_passwd"		#不存在，创建有用户
else
	echo "用户已经存在"	#存在报错

fi
