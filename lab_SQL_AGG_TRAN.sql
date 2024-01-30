use sakila;
# 1.1 Determine the shortest and longest movie durations 
select max(length) as max_duration,min(length) as min_duration from film; 

#1.2. Express the average movie duration in hours and minutes
SELECT FLOOR(AVG(length)/60) AS 'duration_in_hours', ( round(AVG(length),0) - ((FLOOR(AVG(length)/60)*60)) ) AS 'duration_in_minutes' from film;

#1.3 Calculate the number of days that the company has been operating
select DATEDIFF(max(return_date),min(rental_date)) from rental; 

#2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental
select date_format((rental_date,"%b")) as "month" from rental;
SELECT *,DAYNAME(rental_date) as day, monthname(rental_date) as month from rental 
order by rental_date ASC
limit 20;

#2.3 Bonus: Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week.
select *,
CASE
when DAYNAME(rental_date) in ("Monday","Tuesday","Wednesday","Thursday","Friday") then "Weekday"
else "weekend"
end as DAY_TYPE
from rental;

#3.retrieve the film titles and their rental duration. 
select title, 
case 
when rental_duration is null then "not availabe"
else rental_duration
end as rental_duration
from film;

#4 Bonus
select * from customer;
select *,concat(first_name,last_name,left(email,3)) as "pers_reco" from customer
order by last_name asc;

#Challenge 2
# 1.1 The total number of films that have been released.
select count(*) as total_film_release from film
order by release_year; 

#1.2 The number of films for each rating
select  distinct rating ,count(film_id) as num_Films  from film
group by rating;

#1.3 The number of films for each rating, sorting
select  distinct rating ,count(film_id) as num_Films  from film
group by rating
order by num_Films desc;

#2.1 The mean film duration for each rating,
select rating, round(avg(length),2) as avg_duration from film
group by rating
order by avg_duration desc;

#2.2 Identify which ratings have a mean duration of over two hours
select rating, avg(length) from film
group by rating
having avg(length) >120 ;

#determine which last names are not repeated in the table actor
select last_name, count(last_name) as C from actor
group by last_name
having C = 1;












