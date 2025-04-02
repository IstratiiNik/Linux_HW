#!/bin/bash

#Сreating 100 files with random names
#for i in {1..100}; do touch "$RANDOM"; done

# Change directory to the source folder where files are located
cd /opt/131224-wdm/NikIst/HW20/dir1

# Loop through all files in the current directory
for file in *; do
  # Check if the file name consists only of digits
  if [[ $file =~ ^[0-9]+$ ]]; then
    num=$file

    # Check if the number is even
    if ((num % 2 == 0)); then
      # Move the file to the target directory if the number is even
      mv "$file" /opt/131224-wdm/NikIst/HW20/dir2/
    fi
  fi
done