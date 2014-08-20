#!/bin/bash

curl -XPOST 'http://localhost:9200/_flush'
curl -XPOST 'http://localhost:9200/topics/_flush'
curl -XPOST 'http://localhost:9200/twitter/_cache/clear'
echo
