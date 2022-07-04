#!/usr/bin/bash
# author: hackwu
# 2022/7/3
# 用于批量推送公钥的脚本

set -u
host=192.168.23		#网段
password=1
>ip.txt
rpm -q expect &>/dev/null || yum install -y  expect #检测expect是否安装，没有就安装

[ -f ~/.ssh/id_rsa ] || ssh-keygen -P "" -f ~/.ssh/id_rsa #检测是否存在密钥对，没有就创建秘钥对 

for item in {1..254}
do
	{
	ip=$host.$item
	if ping -c1 -W1 $ip &>/dev/null ;then
	/usr/bin/expect <<-EOF
	spawn ssh-copy-id $ip
	expect {
		"yes/no"  { send "yes\r";exp_continue }
		"password" { send "$password\r" }
	}
	expect eof
	EOF
	echo $ip >> ip.txt
	fi
	}&
done
wait
for item in $( cat ip.txt )
do
	echo "有效ip $item"
done
echo "finished"

