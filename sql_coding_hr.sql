# Contains coding practice sql

# find out the cities with the highest and lowest length of their names. 
# in oracle we have rownum which makes it easier like below 
SELECT *
FROM
    (SELECT CITY, LENGTH(CITY)
    FROM STATION
    ORDER BY LENGTH(CITY), CITY)
WHERE ROWNUM = 1
UNION
SELECT *
FROM
    (SELECT CITY, LENGTH(CITY)
    FROM STATION
    ORDER BY LENGTH(CITY) DESC, CITY)
WHERE ROWNUM = 1;

# the same problem - solution for mysql 
select city, length(city) from station order by length(city) asc, city limit 1; select city, length(city) from station order by length(city) desc, city limit 1;
