#!/bin/bash

if [ "$#" -ne 0 ]; then
  echo "Usage: newpost.sh"
  exit 1
fi

date=$(date +"%Y-%m-%d")
time=$(date +"%H-%M")
filename="$(pwd)/${date}_${time}.md"

if [ -f "$filename" ]; then
  echo "File already exists: $filename"
  exit 1
fi

read -r -p "Enter post title: " title

cat > "$filename" <<EOF
---
title: ${title}
date: ${date}
---

EOF

echo "Created new post: $filename"
lvim "$filename"
