#!/bin/bash

#git branch -r | grep -vE "origin\/(widget|josh|dev|master|integration|release)" | xargs git branch -rd
git branch -r | grep -vE "origin\/(josh|feature|gooddata|platform|services|master|integration|release)" | xargs git branch -rd
