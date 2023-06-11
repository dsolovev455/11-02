#!/bin/bash

for ((KeyCount=1; KeyCount < 6; KeyCount++))
do
IndexVar=$(sudo < /dev/urandom tr -dc A-Za-z0-9 | head -c14; echo);
echo -e  "set key${KeyCount} ${IndexVar}" | redis-cli
  if [[ $? -eq 0 ]]; then
  echo "$KeyCount - Successfully cashed"
  fi
echo "get key${KeyCount}" | redis-cli
  if [[ $? -eq 0 ]]; then
  echo "$KeyCount - Successfully get"
  fi
done
