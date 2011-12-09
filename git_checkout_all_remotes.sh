#!/bin/bash

for x in `git branch -r | grep -E "(billing|josh)" | tr -d " "`
do
  git co -t $x
done
