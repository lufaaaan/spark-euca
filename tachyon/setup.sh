#!/bin/bash

/root/spark-euca/copy-dir /root/spark-euca/tachyon/tachyon-0.5.0

/root/spark-euca/tachyon/tachyon-0.5.0/bin/tachyon format

sleep 1

/root/spark-euca/tachyon/tachyon-0.5.0/bin/tachyon-start.sh all Mount
