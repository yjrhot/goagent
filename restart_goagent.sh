#!/bin/bash
cd /Users/zhaoyinggang/nettedfish_projects/goagent_from_github/local
#每次开机会重启goagent代理。同时把所有的access日志清空。避免磁盘空间紧张。
echo `date` "goagent start!" >../goagent_access.log
for pid in `ps aux|grep "/usr/bin/python proxy.py"|grep -v grep|awk '{print $2}'`
do
    echo "${pid} be killed"
    sudo kill -9 ${pid}
done >>../goagent_access.log
/usr/bin/python proxy.py >>../goagent_access.log 2>&1
