/** This script is to find number of government colleges in alabama**/

-- Load studentDataset.txt
studentDataset = LOAD 'studentDataset.txt' USING PigStorage(',') AS (name:chararray, colUndertaken:chararray, dob:chararray, stream:chararray, grade:float, state:chararray, city:chararray );

-- We need to find government colleges in alabama 
filteredData = FILTER studentDataset by colUndertaken == 'goverenment' AND state == 'alabama' ;

--To froup all tuples in the bag
grpData = GROUP filteredData ALL;

--To find count of tuples in the bag
result = FOREACH grpData generate COUNT(filteredData);

--dump result on console
dump result;

