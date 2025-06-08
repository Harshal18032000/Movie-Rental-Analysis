use sakila;


## Task-1
## Full Name of Actors in Database
select concat(first_name,' ',last_name) as 'full_name' from actor;

## Task-2
select count(distinct first_name) from actor;
select first_name,count(*) from actor group by first_name;
select first_name,count(distinct first_name) from actor group by first_name;

## Task-3
select last_name,count(*) from actor group by last_name;
select last_name,count(distinct last_name) from actor group by last_name;

## Task-4
select * from film;
select * from film where rating = 'R';
select * from film where rating != 'R';
## Movie which are suitable for audience below 13 years of age
select * from film where rating = 'PG-13';

## Task-5
select * from film;
# 5.1)
select * from film where replacement_cost <= 11;
# 5.2)
select * from film where  replacement_cost >=11 and replacement_cost <=20;
# 5.3)
select film_id, title, replacement_cost from film order by replacement_cost desc;

## Task-6
select * from film;
select * from film_actor;
select * from actor;
## joined film & film_actor table 
select  count(*), title, film.film_id from film inner join film_actor on film.film_id = film_actor.film_id group by film_id order by 1 desc limit 3;

## Task-7
select film_id,title from film where title like 'K%';
select film_id,title from film where title like 'Q%';

## Task-8
create view movie_title as
select film.film_id, title, concat(first_name,' ',last_name) as 'full_name'  from film inner join film_actor on film.film_id = film_actor.film_id  inner join actor on actor.actor_id = film_actor.actor_id;

select * from movie_title;
select * from movie_title where title= 'Agent Truman';

## Task-9
select film_id, title, rating from film where rating='PG';

## Task-10
## 10.1)
select * from film;
select rating, max(rental_rate), min(rental_rate), avg(rental_rate) from film group by rating order by 4 desc;
## 10.2)
select film_id, title, rental_rate from film order by 3 desc;

## Task-11
## 11)
select * from category;

select  category.name category_name,round((avg(replacement_cost)-avg(rental_rate)),2) difference_between_replacement_and_rental
from (film_category inner join category on film_category.category_id=category.category_id
inner join film on film_category.film_id=film.film_id) 
group by category_name having  difference_between_replacement_and_rental >15;

## Task-12
select * from film_category;
select * from category;


select name Category_name from category where category_id in 
(select category_id from film_category group by category_id having count(film_id)>70);

