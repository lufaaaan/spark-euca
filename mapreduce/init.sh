#!/bin/bash

pushd /root > /dev/null
case "$HADOOP_MAJOR_VERSION" in
  1)
    echo "Nothing to initialize for MapReduce in Hadoop 1"
    ;;
  2) 
    echo "Nothing to initialize for MapReduce in Hadoop 2"
    ;;
  yarn)
    echo "Nothing to initialize for MapReduce in Hadoop 2 YARN"
    ;;

  *)
     echo "ERROR: Unknown Hadoop version"
     return -1
esac
/root/spark-euca/copy-dir /root/mapreduce
popd
