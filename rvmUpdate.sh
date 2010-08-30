#!/bin/bash

rvm update --head && rvm reload && rvm install 1.9.2 && rvm 1.9.2 --default
rvm gemset copy 1.9.2-rc2 1.9.2-p0
