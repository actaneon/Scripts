#!/bin/bash

for X in `git branch -r | grep billing | cut -d " " -f3`
do 
  Y=`echo $X | cut -d "/" -f2-`
  git co $Y
  git reset $X --hard
done
