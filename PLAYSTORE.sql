--Retrieved rows where any of the specified columns is NULL
SELECT *
FROM dbo.googleplaystore
WHERE App IS NULL
    OR Category IS NULL
    OR Rating IS NULL
    OR Reviews IS NULL
    OR Installs IS NULL
    OR Type IS NULL
    OR Price IS NULL
    OR Content_Rating IS NULL
    OR Genres IS NULL
    OR Last_Updated IS NULL
    OR Current_Ver IS NULL
    OR Android_Ver IS NULL;

--Deleted rows where any of the specified columns is NULL
DELETE FROM dbo.googleplaystore
WHERE App IS NULL
    OR Category IS NULL
    OR Rating IS NULL
    OR Reviews IS NULL
    OR Installs IS NULL
    OR Type IS NULL
    OR Price IS NULL
    OR Content_Rating IS NULL
    OR Genres IS NULL
    OR Last_Updated IS NULL
    OR Current_Ver IS NULL
    OR Android_Ver IS NULL;

--Counted total distinct apps and categories
SELECT 
    COUNT(DISTINCT App) AS total_apps,
    COUNT(DISTINCT Category) AS total_categories
FROM dbo.googleplaystore;

--Retrieved top 5 categories with the most apps
SELECT TOP 5
    Category,
    COUNT(APP) AS TOTAL_APP
FROM dbo.googleplaystore
GROUP BY Category
ORDER BY TOTAL_APP DESC;

--Retrieved top 10 free apps with highest ratings
SELECT TOP 10
    App,
    Category,
    Rating,
    Reviews
FROM dbo.googleplaystore
WHERE TYPE = 'Free' AND Rating <> 'NaN'
ORDER BY Rating DESC;

--Retrieved top 10 categories with the most reviews
SELECT TOP 10
    Category,
    App,
    Reviews
FROM dbo.googleplaystore
ORDER BY Reviews DESC;

--Retrieved top 5 categories with highest average rating
SELECT TOP 5
    Category,
    AVG(TRY_CAST(Rating as FLOAT)) AS avg_rating
FROM dbo.googleplaystore
GROUP BY Category
ORDER BY avg_rating DESC;

--Retrieved top 10 categories with highest total installs
SELECT TOP 10
    Category,
    SUM(CAST(REPLACE(SUBSTRING(Installs, 1, PATINDEX('%[^0-9]%', Installs + ' ') - 1), ',', '') AS INT)) 
    AS total_installs
FROM dbo.googleplaystore
GROUP BY Category
ORDER BY total_installs DESC;

--Retrieved top 10 categories with highest average sentiment polarity
SELECT TOP 10
    Category,
    AVG(TRY_CAST(Sentiment_polarity AS FLOAT)) AS avg_sentiment_polarity
FROM dbo.googleplaystore
JOIN dbo.googleplaystore_user_reviews
ON dbo.googleplaystore.App = dbo.googleplaystore_user_reviews.App
GROUP BY Category
ORDER BY avg_sentiment_polarity DESC;

--Retrieved top 10 categories with most frequent sentiments
SELECT TOP 10
    Category,
    Sentiment,
    COUNT(*) AS TOTAL_SENTIMENT
FROM dbo.googleplaystore
JOIN dbo.googleplaystore_user_reviews
ON dbo.googleplaystore.App = dbo.googleplaystore_user_reviews.App
WHERE Sentiment <> 'nan'
GROUP BY Category, Sentiment
ORDER BY TOTAL_SENTIMENT DESC;
