A = load '${pig_input}' using PigStorage(',') as (product_code:chararray,station_number:long,year:int,month:int,day:int,rainfall_in_mm:float,period_in_days:int,quality:chararray);
B = GROUP A BY (year,month);
C = foreach B generate flatten(group),MAX(A.rainfall_in_mm);
STORE C into '${pig_output}' using PigStorage(',');