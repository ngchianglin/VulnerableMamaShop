#!/bin/bash

while sleep 60; do
  ps -ef |grep apache2 |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps -ef |grep mysql |grep -q -v grep
  PROCESS_2_STATUS=$?
  ps -ef | grep php-fpm | grep -v grep -q
  PROCESS_3_STATUS=$?
  
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 -o $PROCESS_3_STATUS -ne 0 ]; then
    echo "Error a required process has exited."
    exit 1
  fi
done
