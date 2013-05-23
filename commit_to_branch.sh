#!/usr/bin/env bash

OLD_BRANCH=`git branch  | grep "*" | cut -d' ' -f2-`
NEW_BRANCH=$1
FROM=$2

git checkout $2
git checkout -b $NEW_BRANCH
git commit -m $NEW_BRANCH
git checkout $OLD_BRANCH
