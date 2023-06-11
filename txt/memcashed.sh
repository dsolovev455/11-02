#!/bin/bash

for ((KeyCount=1; KeyCount < 6; KeyCount++))
do
IndexVar=$(sudo < /dev/urandom tr -dc A-Za-z0-9 | head -c14; echo);
echo -e  "set key${KeyCount} 0 5 14\r\n${IndexVar}\r" | nc -q 0 127.0.0.1 11211
  if [[ $? -eq 0 ]]; then
  echo "$KeyCount - Successfully cashed"
  fi
echo -e  "get key${KeyCount}\n" | nc -q 0 127.0.0.1 11211
  if [[ $? -eq 0 ]]; then
  echo "$KeyCount - Successfully get"
  fi
done
echo -e  "stats cachedump 1 10\n quit\n" | curl -v telnet://127.0.0.1:11211
date
sleep 20
echo -e  "stats cachedump 1 10\n quit\n" | curl -v telnet://127.0.0.1:11211

for ((KeyCount=1; KeyCount < 6; KeyCount++))
do
  echo -e  "get key${KeyCount}\n quit\n" | curl -v telnet://127.0.0.1:11211
done
date

