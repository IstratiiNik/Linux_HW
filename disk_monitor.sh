#!/bin/bash

DIRECTORIES="/home /opt/131224-wdm/NikIst"

echo "Top Ten Disk Space Usage"

 for DIR in $DIRECTORIES
   do
    echo "The $DIR Directory:"
    du -S $DIR 2>/dev/null | sort -rn
   done
