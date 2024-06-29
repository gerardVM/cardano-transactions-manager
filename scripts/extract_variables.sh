#!/bin/bash

# Name of the script file to process (input)
input_script=${1}

# Name of the output variables.env file
output_env=${2}

# Extract all variable names that follow the pattern $variable
# Use grep to find variables, sort and remove duplicates, then format for .env
grep -oP '\$[a-zA-Z_]\w*' "$input_script" | \
sort -u | \
sed 's/\$//g' | \
awk '{print $1"="}' > "$output_env"

echo "Empty variables.env file created with variables from $input_script"
