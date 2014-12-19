#!/bin/bash

pushd /root

cd storm-mesos-git/

bin/build-release.sh downloadStormRelease
STORM_RELEASE=`grep -1 -A 0 -B 0 '<version>' pom.xml | head -n 1 | awk '{print $1}' | sed -e 's/.*<version>//' | sed -e 's/<\/version>.*//'`
bin/build-release.sh apache-storm-${STORM_RELEASE}.zip
hadoop fs -put storm-mesos-${STORM_RELEASE}.tgz /
cp storm-mesos-${STORM_RELEASE}.tgz /root/
cd /root
tar xzf storm-mesos-${STORM_RELEASE}.tgz
cd /root/storm-mesos-${STORM_RELEASE}

#copy configuration template
cp /etc/storm/storm.yaml ./conf
cp /etc/storm/logback ./logback

#nohup bin/storm-mesos nimbus  > nimbus.out &
#nohup bin/storm-mesos ui  > ui.out &

#Adding soft links to automatically start services on reboot
cp /root/spark-euca/storm-on-mesos/start-nimbus.sh bin/
ln -s /root/storm-mesos-${STORM_RELEASE}/bin/start-nimbus.sh /etc/init.d/storm-nimbus-start
update-rc.d storm-nimbus-start defaults

cp /root/spark-euca/storm-on-mesos/start-storm-ui.sh bin/
ln -s /root/storm-mesos-${STORM_RELEASE}/bin/start-storm-ui.sh /etc/init.d/storm-ui-start
update-rc.d storm-ui-start defaults

popd