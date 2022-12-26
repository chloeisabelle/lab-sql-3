-- How many distinct (different) actors' last names are there?

select COUNT(distinct last_name)
from actor
where last_name is not null;


-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

select COUNT(distinct language_id)
from film
where language_id is not null;

-- How many movies were released with "PG-13" rating?

select count(rating)
from film
where rating= ('PG-13');

-- How many days has been the company operating (check DATEDIFF() function)?


select MIN(rental_date) as EarliestDate
from rental;

select Max(rental_date) as LatestDate
from rental;

-- ** couldn't figure out the right datediff formula, kept getting an 1582 error when trying to use days, couldn't figure out with google either'

select DATEDIFF('2022-12-12','2005-05-24') as No_of_days;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. ** I have spent hours online trying to find a solution with no luck - please can you provide me the answer? I am therefore skipping' 

alter table rental
add day_type varchar(255);

-- below is wrong but the closest attempt I have -- 
select rental_date,
case when DATEPART(dw,dttime) in (6,7) then 'Weekend' else 'Weekday' end as day_type 
from rental;


-- How many rentals were in the last month of activity? ** Again have no idea if the below is right - struggled to find class file for this and online not sure what to search for ** 

Select rental_date, Count(*) NumberOfOccurances
   From rental
   Where rental_date Between 2022-11-12 And 2022-10-12       
   Group By rental_date
   Having Count(*) > 1;
   
