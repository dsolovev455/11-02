#!/bin/bash

echo -e  "set key5 5" | redis-cli
if [[ $? -eq 0 ]]; then
  echo "$KeyCount - Successfully cashed"
echo "get key5" | redis-cli
fi
echo "INCRBY key5 '5'" | redis-cli
if [[ $? -eq 0 ]]; then
  echo "$KeyCount - Successfully get"
fi
echo "get key5" | redis-cli

