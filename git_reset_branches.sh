#!/usr/bin/env bash

for X in live master release
do
git update-ref refs/heads/$X refs/remotes/origin/$X
done
