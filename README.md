# monitor
zabbix监控redis集群
监控方式：
1.自动发现redis集群端口
2.将发现的端口传递给redis_statu.sh进行监控
3.获取redis的最大内存，内存使用情况，计算内存使用率，客户端连接数，集群状态（master/slave），是否为集群节点，是否开始AOF RDB模式

如何使用这个模板
1. 将zbx_redis_montior.xml导入zabbix模板
2. 将redis_discovery.sh 和redis_status.sh放到zabbix-agent执行目录下
3. 在zabbix_agent.conf中添加如下信息：
UserParameter=redis_scan,/etc/zabbix/scripts/redis_discovery.sh
UserParameter=redis_info[*],/etc/zabbix/scripts/redis_status.sh $1 $2
重启agent即可。
