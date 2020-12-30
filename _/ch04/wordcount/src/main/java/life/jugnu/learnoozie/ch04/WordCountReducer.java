package life.jugnu.learnoozie.ch04;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class WordCountReducer extends Reducer<Text, LongWritable, Text, LongWritable> {
    private LongWritable total = new LongWritable();

    @Override
    protected void reduce(Text token, Iterable<LongWritable> counts, Context context)
            throws IOException, InterruptedException {
        long n = 0;
        for (LongWritable count : counts)
            n += count.get();
        total.set(n);
        context.write(token, total);
    }
}