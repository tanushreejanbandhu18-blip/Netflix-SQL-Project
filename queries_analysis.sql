

-- 1. percentage of Ratings according to the type of the viewers 
SELECT 
CASE 
    WHEN rating IN ('TV-MA', 'R') THEN 'Adult'
    WHEN rating IN ('TV-14', 'PG-13') THEN 'Teen'
    ELSE 'Kids'
END AS audience,
COUNT(*) AS total
FROM netflix_titles
GROUP BY audience;

--  2. Cumulative Growth Insight.
SELECT release_year,
COUNT(*) AS yearly_total,
SUM(COUNT(*)) OVER (ORDER BY release_year) AS cumulative_total
FROM netflix_titles
GROUP BY release_year;

-- 3. Count total number of records.
SELECT COUNT(*) AS total_records
FROM netflix_titles;

-- 4. Count Movies vs TV Shows.
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

-- 5. Top 10 countries producing content.
SELECT country, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- 6. Most common ratings.
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC;

-- 7.Rank countries by content.
WITH country_count AS (
    SELECT country, COUNT(*) AS total
    FROM netflix_titles
    WHERE country IS NOT NULL
    GROUP BY country
)
SELECT country, total,
RANK() OVER (ORDER BY total DESC) AS rank_num
FROM country_count;

-- 8. Year-wise growth with previous year comparison .
SELECT release_year,
COUNT(*) AS total,
LAG(COUNT(*)) OVER (ORDER BY release_year) AS prev_year
FROM netflix_titles
GROUP BY release_year;

-- 9.Categorize content into Old, Mid, Recent(CASE)
SELECT title, release_year,
CASE 
    WHEN release_year < 2000 THEN 'Old'
    WHEN release_year BETWEEN 2000 AND 2015 THEN 'Mid'
    ELSE 'Recent'
END AS category
FROM netflix_titles;

-- 10. Cumulative content growth over years(Window Function).
SELECT release_year,
COUNT(*) AS yearly_total,
SUM(COUNT(*)) OVER (ORDER BY release_year) AS cumulative_total
FROM netflix_titles
GROUP BY release_year;

--  UNION QUERIES

-- 11. Movies vs TV Shows (UNION).
(SELECT 'Movies' AS category, COUNT(*) AS total
 FROM netflix_titles
 WHERE type = 'Movie')
UNION
(SELECT 'TV Shows' AS category, COUNT(*) AS total
 FROM netflix_titles
 WHERE type = 'TV Show');

-- 12. Content before vs after 2015.
(SELECT 'Before 2015' AS period, COUNT(*) AS total
 FROM netflix_titles
 WHERE release_year < 2015)
UNION
(SELECT 'After 2015' AS period, COUNT(*) AS total
 FROM netflix_titles
 WHERE release_year >= 2015);

-- 13. Top 5 countries + Top 5 directors
(SELECT country AS name, COUNT(*) AS total, 'Country' AS type
 FROM netflix_titles
 WHERE country IS NOT NULL
 GROUP BY country
 ORDER BY total DESC
 LIMIT 5)
UNION
(SELECT director AS name, COUNT(*) AS total, 'Director' AS type
 FROM netflix_titles
 WHERE director IS NOT NULL
 GROUP BY director
 ORDER BY total DESC
 LIMIT 5);


-- 14. Self JOIN: Titles released in same year
SELECT a.title AS title1, b.title AS title2, a.release_year
FROM netflix_titles a
JOIN netflix_titles b
ON a.release_year = b.release_year
AND a.title <> b.title
LIMIT 10;

-- 15. LEFT JOIN: Titles from same country
SELECT a.title, b.title AS related_title, a.country
FROM netflix_titles a
LEFT JOIN netflix_titles b
ON a.country = b.country
AND a.title <> b.title
WHERE a.country IS NOT NULL
LIMIT 10;

-- 16. RIGHT JOIN: Matching content by country
SELECT a.title, b.title AS match_title, b.country
FROM netflix_titles a
RIGHT JOIN netflix_titles b
ON a.country = b.country
LIMIT 10;

-- (REAL ANALYST QUERIES)

-- 17. Find duplicate titles
SELECT title, COUNT(*) AS count
FROM netflix_titles
GROUP BY title
HAVING COUNT(*) > 1;

-- 18. Percentage of Movies vs TV Shows
SELECT type,
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_titles) AS percentage
FROM netflix_titles
GROUP BY type;

-- 19 Extract duration (numeric part)
SELECT title, duration
FROM netflix_titles
WHERE duration LIKE '%min%';

-- 20. Longest movies
SELECT title, duration
FROM netflix_titles
WHERE duration LIKE '%min%'
ORDER BY duration DESC
LIMIT 10;

-- 21. Contribution % by Country.
WITH country_count AS (
    SELECT country, COUNT(*) AS total
    FROM netflix_titles
    WHERE country IS NOT NULL
    GROUP BY country
),
total_count AS (
    SELECT COUNT(*) AS overall FROM netflix_titles
)
SELECT c.country,
c.total,
ROUND(c.total * 100.0 / t.overall, 2) AS percentage
FROM country_count c, total_count t
ORDER BY percentage DESC;

