#!/bin/bash


#Actual scripts located at /etc/storm
service storm-nimbus-start
service storm-ui-start

tail /mnt/storm-logs/nimbus.out