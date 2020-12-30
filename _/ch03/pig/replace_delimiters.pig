inputData = load '$inputPath' using PigStorage(',');
store inputData into '$outputPath' using PigStorage('|');