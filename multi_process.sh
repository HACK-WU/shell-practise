#!/usr/bin/bash
# author: hackwu
# 2022/7/2
# 多进程并发执行ping探测主机,利用管道文件，对并发数量进行控制，
#	这里指定了进程的并发数量始终保持在5个以内。
set -u
 mkfifo fifofile	#创建一个管道文件
 exec 8<>./fifofile	#为这个管道文件绑定一个文件描述符
 rm -f fifofile		#删除这个管道文件
 multi_num=5			#指定并发数量
 for item in $(seq $multi_num)
 do
    echo >&8
 done

for item in {1..254}
do
	read -u 8		#读取管道文件的内容，如果没有数据，就会一直读
	{
	ip=192.168.23.$item
	ping -c1 -W1 $ip &>/dev/null
	if [ $? -eq 0 ];then
		echo "$ip is up"
	else
		echo "$ip is down"
	fi
	  echo >&8
	}&
	
done
wait
exec 8<&-		#释放文件描述符
echo "finished"
