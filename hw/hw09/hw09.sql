CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name AS name ,size AS size FROM dogs,sizes
  WHERE dogs.height<=sizes.max and dogs.height>sizes.min;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.name FROM dogs AS a, dogs AS b,parents
  WHERE  a.name=parents.child and b.name=parents.parent
  ORDER BY b.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.name AS name_a,b.name AS name_b,b_size.size AS size_t FROM dogs AS a,dogs AS b,size_of_dogs AS a_size,parents AS a_parents,parents AS b_parents, size_of_dogs AS b_size
  WHERE  a.name=a_parents.child and b.name=b_parents.child and a.name <b.name and a_parents.parent=b_parents.parent and a_size.name=a.name and b_size.name=b.name and a_size.size=b_size.size
  ;
-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, "||name_a||" plus "||name_b||" have the same size: "||size_t FROM siblings;

