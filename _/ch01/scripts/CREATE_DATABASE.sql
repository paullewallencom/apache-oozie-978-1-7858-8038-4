CREATE USER 'oozie'@'%' IDENTIFIED BY 'hadoop';
CREATE DATABASE oozie;
GRANT ALL PRIVILEGES ON oozie.* TO 'oozie'@'%' WITH GRANT OPTION;