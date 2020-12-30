A = load '${pig_input}' using PigStorage(',') as (product_code:chararray,station_number:long,year:int,month:int,day:int,rainfall:float,period_in_days:int,quality:chararray);
B = GROUP A BY (year,month);
C = foreach B generate MAX(A.rainfall) as rainfall;
STORE C INTO '${pig_output_db}.${pig_output_table}' using org.apache.hive.hcatalog.pig.HCatStorer('yearmonth=${yearmonth}');