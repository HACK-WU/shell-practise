#!/usr/bin/bash
# encoding:utf-8
# system manager 系统管理工具
# author: hackwu
# 2022/7/1

set -u
function menu(){
	cat <<-EOF
	++++++++++++++++++++++++++++++++
	|	===================    |
	|	  系统管理工具	       |
	|       -------------------    |
	|	f、disk partition      |
	|       d、filesystem mount    |
	|       m、memory              |
	|       u、system load         |
	|       q、exit		       |
	+++++++++++++++++++++++++++++++
	EOF
}

while true
do
	menu
	read -p "Please input[h for help]: " action
	clear
	case $action in
		f) fdisk -l		
	;;
		d) df -Th	
	;;
		m) free -h	
	;;
		u) uptime		
	;;
		q)  exit	
	;;
		*)  echo "error!!!" 
	;;
	esac
done

