/** This script is to find number of students who scored less than 5**/

-- Load studentDataset.txt
studentDataset = LOAD 'studentDataset.txt' USING PigStorage(',') AS (name:chararray, colUndertaken:chararray, dob:chararray, stream:chararray, grade:float, state:chararray, city:chararray );

-- We need to find students who scored less than 5
filteredData = FILTER studentDataset by grade < 5;

-- Grouping data , all rows
grpData = GROUP filteredData ALL;


--To find count of tuples in the bag
result = FOREACH grpData generate COUNT(filteredData);

--dump result on console
dump result;

