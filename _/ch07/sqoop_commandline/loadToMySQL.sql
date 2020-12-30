create database rainfall;
use rainfall;

CREATE TABLE rainfall_data
(
product_code varchar(255),
station_number varchar(255),
year int,
month int,
day int ,
rainfall float,
period_in_days int,
quality float
);

-- Change the path below for the data file <BOOK_CODE_HOME>

LOAD DATA LOCAL INFILE '<BOOK_CODE_HOME>/learn_oozie/ch05/input/rainfall/2015/01/Rainfall-2015-01.txt'
INTO TABLE rainfall_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '<BOOK_CODE_HOME>/learn_oozie/ch05/input/rainfall/2015/02/Rainfall-2015-02.txt'
INTO TABLE rainfall_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '<BOOK_CODE_HOME>/learn_oozie/ch05/input/rainfall/2015/03/Rainfall-2015-03.txt'
INTO TABLE rainfall_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '<BOOK_CODE_HOME>/learn_oozie/ch05/input/rainfall/2015/04/Rainfall-2015-04.txt'
INTO TABLE rainfall_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '<BOOK_CODE_HOME>/learn_oozie/ch05/input/rainfall/2015/05/Rainfall-2015-05.txt'
INTO TABLE rainfall_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '<BOOK_CODE_HOME>/learn_oozie/ch05/input/rainfall/2015/06/Rainfall-2015-06.txt'
INTO TABLE rainfall_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

-- Verify data load
 
Select * from rainfall_data;
