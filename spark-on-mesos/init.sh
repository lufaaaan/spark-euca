#!/bin/bash
#TODO: Install s3cmd if not included in modules because it is a dependecy for this script to work
pushd /root

mkdir /executor_tars
s3cmd -c /etc/s3cmd/s3cfg get --recursive --disable-multipart s3://mesos-repo/executors/spark-1.1.0-bin-2.3.0.tgz /executor_tars/
#wget -P /executor_tars http://php.cs.ucsb.edu/spark-related-packages/executor_tars/spark-1.1.0-bin-2.3.0.tgz

chown -R hdfs:hadoop /executor_tars

echo "Putting spark-1.1.0-bin-2.3.0.tgz to HDFS..."
#/executor_tars directory already exists on the emi
hadoop fs -put /executor_tars/spark-1.1.0-bin-2.3.0.tgz /
hadoop fs -ls /

#delete to save some space if necessary
rm /executor_tars/spark-1.1.0-bin-2.3.0.tgz

popd