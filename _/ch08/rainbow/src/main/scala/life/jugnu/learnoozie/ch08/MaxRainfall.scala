package life.jugnu.learnoozie.ch08

import org.apache.spark.{SparkContext, SparkConf}

case class RainFall(productCode:String, stationNumber:Int, year:Int, month:Int ,day:Int, rainfall:Float, period:String, quality:String)

object MaxRainfall {
  def main(args: Array[String]) {
    val conf = new SparkConf()
      .setAppName("Max Rainfall Calculator Ch08")

    val input = args(0)
    val outputPath =args(1)

    val sc = new SparkContext(conf)
    val sqlContext = new org.apache.spark.sql.SQLContext(sc)
    import sqlContext.implicits._

    val inputData = sc.textFile(input)
      .map(_.split(","))
      .map( p => RainFall(p(0),p(1).trim.toInt,p(2).trim.toInt,p(3).trim.toInt,p(4).trim.toInt,p(5).trim.toFloat,p(6),p(7)))
      .toDF

    inputData.registerTempTable("rainfalldata")

    val output = sqlContext.sql("select year,month,max(rainfall) from rainfalldata group By year,month")
    // Repartition (1) to produce 1 single output file , do not do if output is huge
    output.repartition(1).save(outputPath, "com.databricks.spark.csv")

  }
}