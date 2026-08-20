DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix(
        show_id VARCHAR(10),
		type VARCHAR(10),
		title VARCHAR(150),
		director VARCHAR(250) NOT NULL,	
		casts VARCHAR(1000),
		country VARCHAR(200),
		date_added	VARCHAR(100),
		release_year INT,	
		rating VARCHAR(20),
		duration VARCHAR(20),
		listed_in VARCHAR(200),
		description	TEXT
);

SELECT * FROM netflix;


--How many have total content:-

SELECT COUNT(*) FROM netflix;


--How many different types of movie there have:-

SELECT DISTINCT type FROM netflix;


--  Count the number of Movies vs TV Shows:-

SELECT  type, COUNT(*) FROM netflix
GROUP BY type;


-- Find the most common rating for movies and TV shows:-

SELECT  type , MAX( rating)   FROM netflix
GROUP BY type;

-- List all movies released in a specific year (e.g., 2020)

SELECT  title, release_year FROM netflix
WHERE release_year = '2020';


--Find the top 5 countries with the most content on Netflix:-

SELECT  show_id, title, country FROM netflix
WHERE country IS NOT NULL
GROUP BY  show_id ,country, title 
ORDER BY country DESC
LIMIT 5;


-- Identify the longest movie:-

SELECT  MAX(duration) FROM netflix
WHERE type = 'Movie';


-- Find content added in the last 5 years:-

SELECT * FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY')
      >= CURRENT_DATE - INTERVAL '5 years';


-- Find all the movies/TV shows by director 'Rajiv Chilaka'!:-

SELECT type, title , director FROM netflix
WHERE director = 'Rajiv Chilaka';


-- List all TV shows with more than 5 seasons

SELECT *
FROM netflix
WHERE 
	TYPE = 'TV Show'
	AND
	SPLIT_PART(duration, ' ', 1)::INT > 5


-- Count the number of content items in each genre:-

SELECT 
     COUNT(show_id),  
     UNNEST (STRING_TO_ARRAY (listed_in , ',')) AS genre 
FROM netflix
GROUP BY 2


-- List all movies that are documentaries:-

SELECT type, title, listed_in FROM netflix
WHERE listed_in LIKE 'Documentaries';


-- Find all content without a director:-

SELECT * FROM netflix
WHERE director IS NULL;


-- Find how many movies actor 'Salman Khan' appeared in last 10 years!:-

SELECT * FROM netflix
WHERE 
	casts LIKE '%Salman Khan%'
	AND 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;


--  Find the top 10 actors who have appeared in the highest number of movies produced in India:-

SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
