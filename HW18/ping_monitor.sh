#!/bin/bash

read -p "Please input Adress for ping:" adress
limit_ping_time=10
max_failures=3
failures=0

while true;
  do
    result_ping=$(ping -c 1 "$adress" | grep 'icmp_seq')
    time_ping=$(echo "$result_ping" | awk -F'=' '{print $4}' | awk '{print $1}' | awk -F '.' '{print $1}')

     if [ -n "$time_ping" ] && [ "$time_ping" -gt "$limit_ping_time" ]; then
      echo "Ping $adress is over the limit $limit_ping_time ms: $time_ping ms"
     fi

     if [ -z "$time_ping" ]; then
      echo "Ping $adress is not complete"
       ((failures++))
     else
      echo "Ping $adress is complete: $time_ping ms"
      failures=0
     fi

     if [ "$failures" -ge "$max_failures" ]; then
      echo "The maximum number of unsuccessful attempts has been exceeded!"
      failures=0
     fi
   sleep 1
done

