/** This script is to find students from alaska**/

-- Load studentDataset.txt
studentDataset = LOAD 'studentDataset.txt' USING PigStorage(',') AS (name:chararray, colUndertaken:chararray, dob:chararray, stream:chararray, grade:float, state:chararray, city:chararray );

-- We need only those records where state is alaska 
filteredData = FILTER studentDataset by state == 'alaska';

--We need only names of students
result = FOREACH filteredData generate name;

--dump result into a file
STORE result INTO 'assign9-2-b-Output';


