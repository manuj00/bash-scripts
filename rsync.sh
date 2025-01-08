#!/bin/bash



#check to see if rsync command is installed on the system or not.//
 
 if ! command -v rsync > /dev/null 2>&1
 then
    echo "this script requires rysnc to be installed"
    echo "Please use your distribution's package manager to install the command"
    exit 1
 fi 
 
 #storing the current date and time in a variable
 
 current_date=$(date +%Y-%m-%d)
 rsync_option=" -avb --backup-dir=$2/current_date --delete" 
 $(which rsync) $rsync_option $1 $2/current >> backup_$current_date.log
