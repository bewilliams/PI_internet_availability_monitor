#!/usr/bin/env bash

~/logstash-1.4.2/bin/logstash -f logstash.conf >~/logstash.log 2>~/logstash_err.log &