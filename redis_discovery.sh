#!/bin/bash
#
#Description: discovery redis_cluster port
#by rexzhu
#20180906
#
redis_ip=`ip a |grep inet |grep -v inet6 |grep -v 127.0.0|awk '{print $2}'|awk -F "/" '{print $1}'`
redis_port=`ps -ef |grep redis |awk -F "$redis_ip:" '{print $2}'|awk '{print $1}'|grep [0-9]`
arr=($redis_port)
num=${#arr[@]}

printf '{\n'
printf '\t"data":[\n'
for ((i=0;i<="$num";i++))
do
        if [[ "$i" -lt "$num-1" ]];then
                printf '\t {\n'
                printf "\t\t\t\"{#PORT}\":\"${arr[$i]}\"},\n"
        elif [[ "$i" -eq "$num-1" ]];then
                printf '\t {\n'
                printf "\t\t\t\"{#PORT}\":\"${arr[$i]}\"}\n"
        fi
done
        printf '\t ]\n'
        printf '}\n'