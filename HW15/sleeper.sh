#!/bin/bash

cpuinfo_path=/proc/cpuinfo
osrelease_path=/etc/os-release

for i in {1..10}
do
   echo "$(date +"%H:%M:%S") $(ps -ef | wc -l)"
   sleep 1
done

cat $cpuinfo_path > cpu_info.txt

grep "^NAME=" $osrelease_path > os_name.txt

cat $osrelease_path | grep "^NAME=" | awk -F'=' '{print $2}' | tr -d '"' | awk '{print $1}' > os_name_clean.txt

for i in {50..100}
do
   touch "$i.txt"
done 
