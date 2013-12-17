#!/bin/bash

for X in `cat ~/foo | grep '^>/spec.*' | sed 's/:$//' | sort | uniq | grep -v api`; do spec $X; done
