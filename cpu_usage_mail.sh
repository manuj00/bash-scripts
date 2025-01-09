#!/bin/bash

threshold=1
subject="CPU Alert"

while true; do

   # Get CPU usage
   cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
   cpu_usage=${cpu_usage%.*}

   body="High CPU Usage Alert: CPU usage is $cpu_usage%"

   # Check if CPU usage exceeds the threshold
   if [ "$cpu_usage" -gt "$threshold" ]; then
     echo -e "Subject: $subject\n\n$body" | ssmtp manujpublicationvs@gmail.com
   fi

   # Sleep for 5 seconds
   sleep 5

done

