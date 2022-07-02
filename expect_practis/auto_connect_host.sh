#!/usr/bin/bash
# author: hackwu
# 2022/7/2
# 这是一个通过ssh协议，自动连接远程主机的脚本

set -u
host=192.168.23.48
password=1
/usr/bin/expect <<-EOF
set timeout 20		
#超时时间
spawn ssh root@$host "echo 连接成功;hostname; date"
expect {
	"yes/no"  { send "yes\r";exp_continue }
	"password" { send "$password\r" }
}
expect eof
EOF
