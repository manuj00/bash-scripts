#!/bin/bash

# Prompt the user to enter the directory they want to organize

read -p "Enter the directory you want to organize: " TARGET_DIR

# Use the current directory if no directory is entered

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "The specified directory does not exist."
  exit 1
fi

# Iterate over each file in the directory
for file in "$TARGET_DIR"/*; do
  # Skip if it's a directory
  if [ -d "$file" ]; then
    continue
  fi

  # Get the file type (e.g., ASCII text, PNG image data, etc.)
  
  filetype=$(file -b --mime-type "$file" | sed 's|/.*||')

  # Create a subdirectory for the file type if it doesn't exist
  mkdir -p "$TARGET_DIR/$filetype"

  # Move the file to the corresponding subdirectory
  mv "$file" "$TARGET_DIR/$filetype/"
done

echo "Files have been organized by type."

