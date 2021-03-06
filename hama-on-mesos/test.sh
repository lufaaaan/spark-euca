#!/bin/bash

pushd /root

cd hama/
echo "Executing: ./bin/hama jar hama-examples-0.7.0-SNAPSHOT.jar gen fastgen 100 10 randomgraph 2"

./bin/hama jar hama-examples-0.7.0-SNAPSHOT.jar gen fastgen 100 10 randomgraph 2

echo "HDFS should list /pageranksresult..."
hadoop fs -ls /user/root

echo "Executing: ./bin/hama jar hama-examples-0.7.0-SNAPSHOT.jar pagerank randomgraph pagerankresult 4"
./bin/hama jar hama-examples-0.7.0-SNAPSHOT.jar pagerank randomgraph pagerankresult 4

echo "HDFS should list /randomgraph directories..."
hadoop fs -ls /user/root

popd /root