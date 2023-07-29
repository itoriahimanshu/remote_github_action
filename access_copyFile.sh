#!/bin/bash


read -p "Enter the filename to search: " filename

search_result=$(find / -type f -iname "$filename" 2>/dev/null)

if [ -z "$search_result" ]; then
  echo "File '$filename' not found in the device."
else

  first_location=$(echo "$search_result" | head -n 1)

  echo "File '$filename' found at the following location:"
  echo "$first_location"
 
  dir_path=$(dirname "$first_location")
  read -p "Enter the new filename to copy the contents to: " new_filename
  cp "$first_location" "$dir_path/$new_filename"
  echo "Contents copied to '$dir_path/$new_filename'."

  cat "$dir_path/$new_filename"
fi
