# Download and make Oozie distribution
cd ~/
mkdir {oozie_build,oozie_install,hadoop_install}
cd oozie_build
wget http://apache.mirror.digitalpacific.com.au/oozie/4.2.0/oozie-4.2.0.tar.gz
tar -xvf oozie-4.2.0.tar.gz
cd oozie-4.2.0
bin/mkdistro.sh -DskipTests -P hadoop-2