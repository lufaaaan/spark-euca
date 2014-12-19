#!/bin/bash

pushd /root
tar -xzf kafka_2.9.2-0.8.1.1.tgz
cd kafka_2.9.2-0.8.1.1
#bin/kafka-server-start.sh config/server.properties

#add command to init.d
ln -s /root/kafka_2.9.2-0.8.1.1/bin/kafka-server-start.sh kafka-start
mv kafka-start /etc/init.d
update-rc.d kafka-start defaults

popd

