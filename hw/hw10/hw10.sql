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


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child FROM parents, dogs WHERE name = parent ORDER BY height DESC;

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE dogs.height > sizes.min AND dogs.height <= sizes.max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child AS child1, b.child AS child2, s.size AS size
  FROM parents AS a, parents AS b, dogs AS d1, dogs AS d2, sizes AS s
  WHERE a.parent = b.parent AND a.child < b.child 
  AND a.child = d1.name AND b.child = d2.name
  AND d1.height > s.min AND d1.height <= s.max
  AND d2.height > s.min AND d2.height <= s.max;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || child1 || " and " || child2 || ", have the same size: " || size AS child
    FROM siblings;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) FROM dogs
  GROUP BY fur HAVING MAX(height) <= AVG(height)*1.3 AND MIN(height) >= 0.7*AVG(height);

