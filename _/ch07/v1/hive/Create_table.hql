CREATE TABLE ch07_v1_max_rainfall_trend (RAINFALL FLOAT)
PARTITIONED BY (YEARMONTH INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/hue/learn_oozie/ch07/v1/max_rainfall_trend/output';