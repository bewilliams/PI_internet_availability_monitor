#!/usr/bin/env bash

ruby service.rb >~/monitor.log 2>~/monitor_err.log &
~/logstash-1.4.2/bin/logstash -f logstash.conf >~/logstash.log 2>~/logstash_err.log &