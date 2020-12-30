mkdir -p /opt/learn_oozie/hue
chmod 777 /opt/learn_oozie/hue
chown hue:hue /opt/learn_oozie/hue
sudo su hue
cd /opt/learn_oozie/hue
wget https://dl.dropboxusercontent.com/u/730827/hue/releases/3.8.1/hue-3.8.1.tgz
tar -xvf hue-3.8.1.tgz
cd hue-3.8.1
yum install ant asciidoc cyrus-sasl-devel cyrus-sasl-gssapi gcc gcc-c++ krb5-devel libtidy  libxml2-devel libxslt-devel make mysql mysql-devel openldap-devel python-devel sqlite-devel openssl-devel gmp-devel
make appsd hue-3.8.1
