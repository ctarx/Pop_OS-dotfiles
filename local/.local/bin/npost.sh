#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 0 ]; then
  echo "Usage: newpost.sh"
  exit 1
fi

# Get the current date and time
date=$(date +"%Y-%m-%d")
time=$(date +"%H-%M")
filename="$(pwd)/${date}_${time}.md"

# Check if the file already exists
if [ -f "$filename" ]; then
  echo "File already exists: $filename"
  exit 1
fi

# Get the post title from the user
read -r -p "Enter post title: " title

# Check if the title is provided
if [ -z "$title" ]; then
    echo "Error: Post title cannot be empty."
    exit 1
fi

# Create the file with the Markdown header
cat > "$filename" <<EOF
---
title: ${title}
date: ${date}
---
EOF

# Display infromation about the newly created post
echo "Created new post: $filename"

# Open the file in the chosen editor (using $EDITOR)
$EDITOR "$filename"
