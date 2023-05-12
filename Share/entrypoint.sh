#!/bin/bash
apt-get update
apt-get install -y git gcc make cmake pkg-config libicu-dev sudo
cd /usr/local
git clone https://gitlab.com/YottaDB/Util/YDBAIM.git
/opt/yottadb/current/ydb_env_set
export PATH="$PATH:/opt/yottadb/current"
cd /usr/local/YDBAIM
mkdir build && cd build
cmake .. && make && sudo make install
cp /home/YDB/indexsrch.m /opt/yottadb/current
cp /home/YDB/pcodeproc.m /opt/yottadb/current
/opt/yottadb/current/ydb <<< 'ZL "/opt/yottadb/current/plugin/r/_YDBAIM.m"'
/opt/yottadb/current/ydb <<< 'ZL "/opt/yottadb/current/pcodeproc.m" D START^pcodeproc'
/opt/yottadb/current/ydb <<< 'J XREFDATA^%YDBAIM("^PCODE",1,"|","1:3",,,,2)'
echo "Initialisation complete ..."
tail -f /dev/null