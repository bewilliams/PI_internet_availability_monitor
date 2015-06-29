#!/usr/bin/env bash

#this script should be run as a normal user

sudo apt-get install build-essential
curl -L https://get.rvm.io | bash -s stable
rvm install 2.2.0
source ~/.rvm/scripts/rvm