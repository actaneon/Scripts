#!/bin/bash

rsync -arcv jking@jking.local:~/box/ ~/box/
rsync -arcv ~/box/ jking@jking.local:~/box/
