#!/usr/bin/env bash -u

[ -z "$OOZIE_CODE_ENV" ] && echo "Need to have some environment variable set ( example export OOZIE_CODE_ENV=dev" && exit 1;

env=$OOZIE_CODE_ENV
version=@project.version@
global_prefix=tmp/$env
local_download_base=/$global_prefix/download/oozie
local_install_base=/$global_prefix/install/oozie
hdfs_install_base=/$global_prefix/applications/oozie/code

# Create directories
rm -rf $local_download_base
mkdir -p $local_download_base
mkdir -p $local_install_base/
sudo -u oozie hadoop fs -mkdir -p $hdfs_install_base
#sudo -u oozie hadoop fs -chown -R oozie:oozie $hdfs_install_base

# Download latest releases

cd $local_download_base
rm -rf $local_download_base/ch09-$version*

# If you have build server pushing artifacts to artifactory or nexus
#wget http://localartifactory.com/ch09-$version-client.zip
#wget http://localartifactory.com/ch09-$version-hdfs.zip
cp /media/sf_jagatsingh/GitBook/Library/jagatsingh/oozie/learn_oozie/ch09/packaging/target/*.zip .

unzip ch09-$version-client.zip -d $local_install_base
# Update Symlink for local
ln -sf $local_install_base/client/client-$version $local_install_base/client/latest
unzip ch09-$version-hdfs.zip
unzip ch09-$version-deploy.zip
chown -R oozie:oozie $local_download_base
chown -R oozie:oozie $local_install_base

# Move latest release to HDFS

# Update Symlink for HDFS , Right now Symlinks are disabled in Apache Hadoop , In MapR hadoop you can create symlinks
# See http://doc.mapr.com/display/MapR/hadoop+mfs
# See https://issues.apache.org/jira/browse/HADOOP-10052
# FileSystem.createSymlink(final Path target, final Path link, final boolean createParent)
# java -cp `hadoop classpath`;$local_download_base/deploy/ch09-$version.jar Symlinks $hdfs_install_base/hdfs-$version $hdfs_install_base/latest

# So for now we can use move command


sudo -u oozie hadoop fs -copyFromLocal $local_download_base/hdfs/hdfs-$version $hdfs_install_base
previousinstall=`hadoop fs -test -d $hdfs_install_base/latest`
if [ $previousinstall -eq 0  ]; then
	echo "Moving previous code"
	sudo -u oozie hadoop fs -mv $hdfs_install_base/latest $hdfs_install_base/old_`date +%Y-%M-%d-%H-%m-%S`
else
	echo "Installing Oozie code for first time"
fi

sudo -u oozie hadoop fs -mv $hdfs_install_base/hdfs-$version $hdfs_install_base/latest
