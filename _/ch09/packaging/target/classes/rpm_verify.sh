#!/usr/bin/env bash

env=$OOZIE_CODE_ENV
version=1.0.0
global_prefix=tmp/$env
local_download_base=/$global_prefix/download/oozie
local_install_base=/$global_prefix/install/oozie
hdfs_install_base=/$global_prefix/applications/oozie/code


echo "Verifying the version on Client"

hdfs_installed_version=`hadoop fs -cat $hdfs_install_base/latest/VERSION.txt`

if [ $hdfs_installed_version != $version ]; then
	echo "HDFS installed version $hdfs_installed_version does not match with the expected version $version"
	exit 1
else
	echo "HDFS installed version $version is confirmed"
fi

echo "Verifying the version on HDFS"

client_installed_version=`cat $local_install_base/client/latest/VERSION.txt`

if [ $client_installed_version != $version ]; then
	echo "Client installed version $client_installed_version does not match with the expected version $version"
	exit 1
else
	echo "Client installed version $version is confirmed"
fi

