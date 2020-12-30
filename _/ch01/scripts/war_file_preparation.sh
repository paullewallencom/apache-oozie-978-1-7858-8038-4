# Prepare to make Oozie war file
cd ~/oozie_install
cp ~/oozie_build/oozie-4.2.0/distro/target/oozie-4.2.0-distro.tar.gz ~/oozie_install
tar -xvf oozie-4.2.0-distro.tar.gz
cd oozie-4.2.0
# Removing hsqldb jar as they cause class conflict
rm lib/hsqldb-1.8.0.10.jar

# Collect all external jar files
mkdir libext
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.36.tar.gz --no-check-certificate
tar -xvf mysql-connector-java-5.1.36.tar.gz
cp mysql-connector-java-5.1.36/*.jar libext/

cd libext
wget http://dev.sencha.com/deploy/ext-2.2.zip .
# Collect hadoop related jars
shopt -s globstar
/bin/cp -rf ~/hadoop_install/hadoop-2.4.0/share/**/*.jar ~/oozie_install/oozie-4.2.0/libext
# Removing source jars to reduce size
rm -rf *sources*
#rm -rf *jasper*