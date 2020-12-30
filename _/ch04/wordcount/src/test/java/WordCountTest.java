package life.jugnu.learnoozie.ch04;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mrunit.mapreduce.MapDriver;
import org.apache.hadoop.mrunit.mapreduce.MapReduceDriver;
import org.apache.hadoop.mrunit.mapreduce.ReduceDriver;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WordCountTest {
    MapReduceDriver<LongWritable, Text, Text, LongWritable, Text, LongWritable> mapReduceDriver;
    MapDriver<LongWritable, Text, Text, LongWritable> mapDriver;
    ReduceDriver<Text, LongWritable, Text, LongWritable> reduceDriver;

    @Before
    public void setUp() {
        WordCountMapper mapper = new WordCountMapper();
        WordCountReducer reducer = new WordCountReducer();
        mapDriver = new MapDriver<LongWritable, Text, Text, LongWritable>();
        mapDriver.setMapper(mapper);
        reduceDriver = new ReduceDriver<Text, LongWritable, Text, LongWritable>();
        reduceDriver.setReducer(reducer);
        mapReduceDriver = new MapReduceDriver<LongWritable, Text, Text, LongWritable, Text, LongWritable>();
        mapReduceDriver.setMapper(mapper);
        mapReduceDriver.setReducer(reducer);
    }

    @Test
    public void testMapper() throws IOException {
        mapDriver.withInput(new LongWritable(1), new Text("Hello Learn Oozie Oozie"));
        mapDriver.withOutput(new Text("Hello"), new LongWritable(1));
        mapDriver.withOutput(new Text("Learn"), new LongWritable(1));
        mapDriver.withOutput(new Text("Oozie"), new LongWritable(1));
        mapDriver.withOutput(new Text("Oozie"), new LongWritable(1));
        mapDriver.runTest();
    }

    @Test
    public void testReducer() throws IOException {
        List<LongWritable> values = new ArrayList<LongWritable>();
        values.add(new LongWritable(1));
        values.add(new LongWritable(1));
        reduceDriver.withInput(new Text("Oozie"), values);
        reduceDriver.withOutput(new Text("Oozie"), new LongWritable(2));
        reduceDriver.runTest();
    }

    @Test
    public void testMapReduce() throws IOException {
        mapReduceDriver.withInput(new LongWritable(1), new Text("Hello Oozie Oozie"));
        mapReduceDriver.addOutput(new Text("Hello"), new LongWritable(1));
        mapReduceDriver.addOutput(new Text("Oozie"), new LongWritable(2));
        mapReduceDriver.runTest();
    }
}