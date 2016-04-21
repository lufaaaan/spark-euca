#!/bin/bash

/root/spark-euca/copy-dir /root/spark-euca/tachyon

/root/spark-euca/tachyon/bin/tachyon format

sleep 1

/root/spark-euca/tachyon/bin/tachyon-start.sh all Mount
