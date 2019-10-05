#!/bin/bash

# Check all the projects .rb files
# for X in `find ./app | grep  -E '.rb$'`; do ./script/findDeadRubyCode.sh $X; done

if [ "$1" != "" ]; then
  for X in `cat $1 | grep "def " | cut -d " " -f4 | cut -d "(" -f1 | sed -E "s/(self.|=|\!|\?)//g" | sort`; do
    Y=`grep -rn $X app/ | wc -l`;
    if [ $Y -eq 1 ]; then
      echo "$Y : $1 - $X";
    fi
  done
else
  echo "Usage: $0 <filename with method definitions to search for>"
fi
