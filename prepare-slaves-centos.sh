#!/bin/bash

#echo 'exclude=pam*' >> /etc/yum.conf;yum update
#exclude=pam; yum update
setenforce 0; #yum --assumeyes update
yum --assumeyes install wget
#yum -y install git
#yum --assumeyes install java-1.7.0-openjdk
#mv /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.99.x86_64/jre /usr/lib/jvm/java-1.7.0/
wget http://www.scala-lang.org/files/archive/scala-2.10.3.tgz
tar xvf scala-2.10.3.tgz
mv scala-2.10.3 scala
rm scala-2.10.3.tgz
