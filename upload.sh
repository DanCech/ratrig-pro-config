#!/bin/sh

host='duet3.lan'

for filename in "$@"; do
  echo "$filename"
  curl -s -T "$filename" 'http://'"$host"'/machine/file/0%3A%2Fsys%2F'"$filename"
done
