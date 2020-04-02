#!/bin/sh

host='duet3.lan'

for filename in $(curl -s 'http://'"$host"'/machine/directory/0%3A%2Fsys' | jq -r .[].name | grep -v '\.bin$'); do
  echo "$filename"
  curl -s 'http://'"$host"'/machine/file/0%3A%2Fsys%2F'"$filename" > "$filename"
done
