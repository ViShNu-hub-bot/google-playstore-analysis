Google Play Store Analysis Project README

Overview:
This project offers an in-depth analysis of the Google Play Store dataset using SQL queries for data processing and Power BI for visualization. The dataset encompasses a wide range of information about different apps available on the platform, including categories, ratings, reviews, installs, and more.

Files Included:

googleplaystore.sql: Contains SQL queries for data cleaning, processing, and analysis.
power_bi_dashboard.pbix: Power BI file housing the dashboard for visualizing analysis results.
SQL Queries Highlights:

Data Cleaning:
Elimination of rows with NULL values in essential columns to enhance data quality.
Data Analysis:
Calculation of total distinct apps and categories.
Identification of top categories based on various metrics such as number of apps, ratings, reviews, installs, and sentiment polarity.
Power BI Dashboard Insights:

Clustered Column Chart: Offers insights into the distribution of apps across different categories.
Line Chart: Tracks the trend of app installs over time categorized by app category.
Sentiment Polarity by Category: Visualizes user sentiment polarity across app categories.
Donut Chart: Illustrates the distribution of app categories by sentiment.
Line and Stacked Column Chart: Compares app ratings and reviews.
Clustered Bar Chart: Presents the distribution of reviews by app.
Table: Summarizes categories and their average ratings.
Usage:

Execute the SQL script (googleplaystore.sql) on your SQL database to conduct the data analysis.
Utilize Power BI Desktop or Power BI Online to open and interact with the dashboard included in power_bi_dashboard.pbix.
Requirements:

SQL Server or a compatible database management system for executing SQL queries.
Power BI Desktop or Power BI Online for accessing and interacting with the dashboard.
Contributing:
Contributions to this project are welcomed. Feel free to suggest improvements, add new analysis features, or enhance existing visualizations. Fork the repository, implement your changes, and submit a pull request.
