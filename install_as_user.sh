#!/usr/bin/env bash

#everything done from users home dir
cd ~

#install logstash
wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz
tar -xvf logstash-1.4.2.tar.gz

# Build and install the latest jffi
# see https://github.com/jruby/jruby/issues/1561#issuecomment-67953147
git clone https://github.com/jnr/jffi.git
cd ~/jffi/
ant jar
cd ~/logstash-1.4.2/vendor/jar
mkdir -p jni/arm-Linux/
cp ~/jffi/build/jni/libjffi-1.2.so ~/logstash-1.4.2/vendor/jar/jni/arm-Linux
zip -g jruby-complete-1.7.11.jar jni/arm-Linux/libjffi-1.2.so