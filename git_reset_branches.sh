#!/usr/bin/env bash

for X in `git branch | grep -E "(master|release|live)" | cut -b3-`; do
  git update-ref refs/heads/$X refs/remotes/origin/$X
done
