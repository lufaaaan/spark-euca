#!/usr/bin/env bash

#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# These variables are automatically filled in by the spark-euca script.
export MASTERS="{{master_list}}"
export SLAVES="{{slave_list}}"
export ZOOS="{{zoo_list}}"
export HDFS_DATA_DIRS="{{hdfs_data_dirs}}"
export MAPRED_LOCAL_DIRS="{{mapred_local_dirs}}"
export MODULES="{{modules}}"
export MESOS_SETUP_VERSION="{{mesos_setup_version}}"
export SWAP_MB="{{swap}}"
export CLUSTER_NAME="{{cluster_name}}"
sed '/CLUSTER_NAME=/d' /etc/environment #delete previous value if it is a restore session
echo "CLUSTER_NAME=$CLUSTER_NAME" >> /etc/environment #Need this to startup mesos scripts on reboot
export ACTIVE_MASTER="{{active_master}}"
export ACTIVE_MASTER_PRIVATE="{{active_master_private}}"
ed '/ACTIVE_MASTER_PRIVATE=/d' /etc/environment
echo "ACTIVE_MASTER_PRIVATE=$ACTIVE_MASTER_PRIVATE" >> /etc/environment #Need this to startup mesos scripts on reboot
export MASTERS_DNS_MAPPINGS="{{masters_dns_mappings}}"
export SLAVES_DNS_MAPPINGS="{{slaves_dns_mappings}}"
export MASTERS_DNS_MAPPINGS_PUBLIC="{{masters_dns_mappings_public}}"
export SLAVES_DNS_MAPPINGS_PUBLIC="{{slaves_dns_mappings_public}}"

#Backup specific variables
export AWS_ACCESS_KEY="{{aws_access_key}}"
export AWS_SECRET_KEY="{{aws_secret_key}}"
export WALRUS_IP="{{walrus_ip}}"

#MPI on Mesos specific variables
#TODO: Its OK to be hardcoded for the emi version but for building from scratch they have to be configurable
export MESOS_SOURCE_DIR= "/root/mesos-0.20.0" #"{{mesos_source_dir}}"
export MESOS_BUILD_DIR="/root/mesos-0.20.0/build" #"{{mesos_build_dir}}"
export PYTHON_PATH="/usr/bin/python" #"{{python_path}}" - (which python)
export PYTHON_EGG_POSTFIX="py2.7-linux-x86_64" #"{{python_egg_postfix}}"
export PYTHON_EGG_PUREPY_POSTFIX="py2.7" #"{{python_egg_purepy_postfix}}"

