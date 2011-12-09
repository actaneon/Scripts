#!/bin/bash

git branch -r | grep -vE "(billing|db_cleanup|josh|dev|master|origin\/release)" | xargs git branch -rd
