#!/bin/bash
#
# Bash script to rename files in the current directory with iterative numbers (starting from a number provided by the user)
# Usage: ./rename.sh
# 
# Author: Aqwa Hameed 
# Date: November 27, 2024
# License: MIT 

# Define color variables
RED="\033[0;31m"       
BLUE="\033[0;34m"      
GREEN="\033[0;32m"     
NC="\x1b[39;49;00m"    

# Prompt user to enter starting filename number
getStartingNum(){
    while true; do
        read -r -p "Enter the starting number to rename files with: " count
        if [[ $count =~ ^[0-9]+$ ]]; then
            break
        else 
            echo -e "${RED}\nNon-numeric inputs are not allowed! Please enter a numeric value.\n${NC}"
        fi
    done
}

# Rename files starting from the starting number provided by the user 
renameFile(){
    for file in *; do
        if [[ "$file" != "rename.sh" ]] && [[ ! -d "$file" ]]; then
            file_extension=${file##*.}
            
            mv "$file" "${count}.${file_extension}"
            echo -e "${BLUE}${file}${NC} renamed as ${GREEN}${count}.${file_extension}${NC}"
            
            count=$((count + 1))
        fi
    done
}

getStartingNum && renameFile