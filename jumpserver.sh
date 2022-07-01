#!/usr/bin/bash
# jumpserver
# author: hackwu
# 2022/7/1
trap "" HUP INT 		#信号匹配，匹配到打断信号，啥也不做
set -u 
web1=192.168.10.10
web2=192.168.10.11
web3=192.168.10.12

# 循环执行->
# 	1、打印菜单
#	2、用户输入
# 	3、选项判断->执行远程连接
#
while : 
do
	cat <<-EOF
+----------------------------+
|	1. web1  连接到web1  |
|	2. web2	 连接到web2  |
|	3. web3  连接到web3  |
|	4. quite 退出        |
+----------------------------+	
	EOF

	read -p "Please input a number: " num

	case $num in
	1) echo "ssh hack@web1" ;;	#连接到web1
	2) echo "ssh hack@web2" ;;
	3) echo "ssh hack@web3" ;;
	4) exit ;;
	*) echo "error!!!" ;;
	esac 
done


		
