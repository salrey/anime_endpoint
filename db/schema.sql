-- step 1 incase we already have a db, drop it
DROP DATABASE IF EXISTS animes_dev; 
-- step 2 create the db
CREATE DATABASE animes_dev;
-- step 3 connect to the db
\c animes_dev;
-- step 4 create a table for the db with these values
CREATE TABLE anime (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    release INT
);

-- create reviews table and link to anime_id
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    anime_id INT REFERENCES anime (id) ON DELETE CASCADE,
    reviewer TEXT NOT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    rating INT,
    CHECK (rating >= 0 AND RATING <= 5)
);
