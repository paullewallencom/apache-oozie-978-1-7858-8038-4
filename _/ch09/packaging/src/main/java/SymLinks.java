import org.apache.hadoop.fs.*;
import org.apache.hadoop.conf.*;

class Symlinks {
    // https://gist.github.com/QwertyManiac/6030201
    public static void main(String args[]) throws Exception {
        FileContext fc = FileContext.getFileContext();
        //fc.createSymlink(new Path("/tmp/source"), new Path("/tmp/destination-link"), false);
        fc.createSymlink(new Path(args[0]), new Path(args[1]), true);
    }
}