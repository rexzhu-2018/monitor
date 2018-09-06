#!/bin/bash
#
#Description: get redis_cluster info
#by rexzhu
#20180906
#

IP=`ip a |grep inet |grep -v inet6 |grep -v 127.0.0|awk '{print $2}'|awk -F "/" '{print $1}'`
PORT=$1
USE_MEM=`redis-cli -h $IP -p $PORT info |grep "used_memory:"|awk -F ":" '{print $NF}'|tr -d "\r"`
MAX_MEM=`redis-cli -h $IP -p $PORT info |grep "maxmemory:"|awk -F ":" '{print $NF}'|tr -d "\r"`
RDB_STATUS=`redis-cli -h $IP -p $PORT info |grep "loading:"|awk -F ":" '{print $NF}'|tr -d "\r"`
AOF_STATUS=`redis-cli -h $IP -p $PORT info |grep "aof_enabled:"|awk -F ":" '{print $NF}'|tr -d "\r"`
ROLE=`redis-cli -h $IP -p $PORT info |grep "role:"|awk -F ":" '{print $NF}'|tr -d "\r"`
CLUSTER_STATUS=`redis-cli -h $IP -p $PORT info |grep "cluster_enabled:"|awk -F ":" '{print $NF}'|tr -d "\r"`
CLIENT=`redis-cli -h $IP -p $PORT info |grep "connected_clients:"|awk -F ":" '{print $NF}'|tr -d "\r"`
USE_MEM_PERCENT=`awk 'BEGIN{printf "%.2f\n",'$USE_MEM'/'$MAX_MEM'*100}'`

case $2 in
USE_MEM|use_mem)
echo $USE_MEM
;;
MAX_MEM|max_mem)
echo $MAX_MEM
;;
RDB_STATUS|rdb_status)
echo $RDB_STATUS
;;
AOF_STATUS|aof_status)
echo $AOF_STATUS
;;
ROLE|role)
echo $ROLE
;;
CLUSTER_STATUS|cluster_status)
echo $CLUSTER_STATUS
;;
CLIENT|client)
echo $CLIENT
;;
USE_MEM_PERCENT|use_mem_percent)
echo $USE_MEM_PERCENT
;;
*)
echo "Usage: $0 USE_MEM|MAX_MEM|RDB_STATUS|AOF_STATUS|ROLE|CLUSTER_STATUS|CLIENT|USE_MEM_PERCENT"
esac