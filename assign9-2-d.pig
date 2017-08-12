/** This script is to find students from oregon and pursuing BE**/

-- Load studentDataset.txt
studentDataset = LOAD 'studentDataset.txt' USING PigStorage(',') AS (name:chararray, colUndertaken:chararray, dob:chararray, streamName:chararray, grade:float, state:chararray, city:chararray );

-- We need to find students who from oregon and pursuing BE
filteredData = FILTER studentDataset by streamName == 'BE' AND state == 'oregon';

--We need only names of students
result = FOREACH filteredData generate name;

--dump result into a file
STORE result INTO 'assign9-2-d-Output';

