SELECT *
FROM film; --film_id, language_id

SELECT *
FROM film_category; -- film_category.film_id, film_category.category_id

SELECT *
FROM category; -- category.category_id, category.name

SELECT *
FROM language; --language.language_id, language.name



-- Catalogue
SELECT 	
	film.film_id, 
	film.title, 
	film.release_year, 
	film.rental_duration, 
	film.rental_rate,
	film.length,
	film.replacement_cost,
	film.rating,
	category.category_id, 
	category.name AS category,
	language.language_id, 
	language.name AS language
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id
ORDER BY film.film_id;



-- Distinct films
SELECT
	DISTINCT film.film_id,
	COUNT (DISTINCT film.film_id) AS number_of_films
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id
GROUP BY film.film_id
ORDER BY film.film_id;



-- Distinct languages
SELECT 	
	DISTINCT language.name AS languages,
	COUNT (DISTINCT film.film_id) AS number_of_films
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id
GROUP BY languages
ORDER BY languages;



-- Distinct release Year
SELECT 	
	DISTINCT film.release_year,
	COUNT (DISTINCT film.film_id) AS number_of_films
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id
GROUP BY film.release_year
ORDER BY film.release_year;



-- Distinct categories
SELECT 	
	DISTINCT category.name AS categories,
	COUNT (DISTINCT film.film_id) AS number_of_films
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id
GROUP BY categories
ORDER BY categories;



-- Distinct ratings
SELECT 	
	DISTINCT film.rating AS ratings,
	COUNT (DISTINCT film.film_id) AS number_of_films
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id
GROUP BY ratings
ORDER BY ratings;



-- Count of distinct values in catalogue
SELECT
	COUNT (DISTINCT film.film_id) AS number_of_films,
	COUNT (DISTINCT language.name) AS number_of_languages,
	COUNT (DISTINCT film.release_year) AS number_of_release_years,
	COUNT (DISTINCT category.name) AS number_of_categories,
	COUNT (DISTINCT film.rating) AS number_of_ratings 
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id;