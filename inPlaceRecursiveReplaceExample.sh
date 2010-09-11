#!/bin/bash

find . -print0 | xargs -0 sudo ruby -p -i -e 'gsub("foo", "bar")'
