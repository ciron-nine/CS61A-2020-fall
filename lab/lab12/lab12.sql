.read data.sql


CREATE TABLE bluedog AS
  SELECT color,pet from students
  WHERE pet="dog" and color="blue"; 

CREATE TABLE bluedog_songs AS
  SELECT  color,pet,song from students
  WHERE pet="dog" and color="blue"; 


CREATE TABLE smallest_int AS
  SELECT time,smallest FROM students
  WHERE smallest>2
  ORDER BY smallest
  LIMIT 20
  ; 


CREATE TABLE matchmaker AS
  SELECT a.pet,b.song,a.color,b.color FROM students AS a,students AS b
  WHERE a.pet=b.pet and b.song=a.song and a.time != b.time;


CREATE TABLE sevens AS
  SELECT seven FROM students,numbers
  WHERE students.time=numbers.time and students.number=7 and numbers."7"='True';

