
# Import all records example
oozie sqoop -oozie http://localhost:11000/oozie -command import --connect jdbc:mysql://localhost:3306/rainfall --username root --password "" --query "SELECT * FROM rainfall.rainfall_data WHERE (year=\$YEAR AND month=\$MONTH) AND \$CONDITIONS" --target-dir '/user/hue/learn_oozie/ch07/sqoop_commandline/rainfall/output_freeform' -m 1 -config job.properties