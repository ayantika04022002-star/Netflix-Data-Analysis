# Netflix Movies & TV Shows — SQL Data Analysis

Exploratory data analysis of the Netflix titles catalog using SQL. The project loads the public Netflix dataset into a relational table and answers a series of business/analytical questions using SQL queries (aggregations, string parsing, date handling, and array functions).

## 📁 Repository Contents

| File | Description |
|---|---|
| `netflix_titles.csv` | Raw dataset — ~8,800 Netflix titles (Movies & TV Shows) with metadata such as director, cast, country, release year, rating, duration, genre, and description. |
| `Netflix_SQL.sql` | SQL script that creates the `netflix` table and contains all analysis queries. |

## 🗂️ Dataset Schema

The `netflix` table is created with the following columns:

| Column | Type | Description |
|---|---|---|
| `show_id` | VARCHAR(10) | Unique ID for each title |
| `type` | VARCHAR(10) | `Movie` or `TV Show` |
| `title` | VARCHAR(150) | Title of the show/movie |
| `director` | VARCHAR(250) | Director name(s) |
| `casts` | VARCHAR(1000) | Cast members |
| `country` | VARCHAR(200) | Country of production |
| `date_added` | VARCHAR(100) | Date the title was added to Netflix |
| `release_year` | INT | Year of release |
| `rating` | VARCHAR(20) | Content rating (e.g., PG-13, TV-MA) |
| `duration` | VARCHAR(20) | Duration (minutes for movies, seasons for TV shows) |
| `listed_in` | VARCHAR(200) | Genre(s)/categories |
| `description` | TEXT | Short synopsis |

## 🔍 Business Questions Answered

1. Total count of content on Netflix
2. Distinct content types available
3. Count of Movies vs TV Shows
4. Most common rating for Movies and TV Shows
5. All movies released in a specific year (e.g., 2020)
6. Top 5 countries with the most content
7. The longest movie by duration
8. Content added in the last 5 years
9. All movies/TV shows by a specific director (e.g., Rajiv Chilaka)
10. TV shows with more than 5 seasons
11. Count of content items per genre
12. Average content released per year in India — top 5 years by average
13. All documentary movies
14. Content with no director listed
15. How many movies actor Salman Khan appeared in over the last 10 years
16. Top 10 actors with the most movie appearances in Indian-produced content
17. Categorize content as "Good" or "Bad" based on keywords ("kill", "violence") in the description, and count each category

> Note: Some queries (12, 13–17) are outlined as open analysis tasks in the script and can be implemented following the patterns used in the earlier queries.

## 🛠️ Tech Stack

- **SQL dialect:** PostgreSQL (uses `TO_DATE`, `SPLIT_PART`, `STRING_TO_ARRAY`/`UNNEST`, and `INTERVAL` syntax)
- Should be run in PostgreSQL or a compatible engine. Minor syntax tweaks may be needed for MySQL/SQL Server.

## 🚀 How to Run

1. **Create the database and table**
   ```bash
   psql -U <username> -d <database_name> -f Netflix_SQL.sql
   ```
2. **Load the CSV data** into the `netflix` table (adjust path as needed):
   ```sql
   \copy netflix FROM 'netflix_titles.csv' DELIMITER ',' CSV HEADER;
   ```
3. Run the analysis queries in `Netflix_SQL.sql` individually to explore each insight.

## 📊 Key Insights (example findings)

- Movies significantly outnumber TV Shows in the catalog.
- The United States, India, and the United Kingdom are among the top content-producing countries.
- Documentaries and International content are among the most frequent genres.
- A large share of content was added to Netflix within the last 5 years, reflecting rapid catalog growth.

## 📌 Future Improvements

- Complete remaining open queries (avg. content per year in India, top actors, keyword-based content categorization).
- Add data visualizations (e.g., Python/Power BI/Tableau dashboard) on top of query outputs.
- Add indexes for performance on larger datasets.

## 📄 License

This project is for educational/portfolio purposes. Dataset sourced from the publicly available [Netflix Movies and TV Shows dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows).
