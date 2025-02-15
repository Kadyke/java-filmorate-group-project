DROP TABLE IF EXISTS film_mpa;
DROP TABLE IF EXISTS film_genre;
DROP TABLE IF EXISTS user_friend;
DROP TABLE IF EXISTS user_film_like;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS mpa_rating;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS usr;
DROP TABLE IF EXISTS film;

CREATE TABLE IF NOT EXISTS film
(
    id           bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name         varchar,
    description  varchar,
    release      timestamp,
    duration     int
);

CREATE TABLE IF NOT EXISTS usr
(
    id       bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    email    varchar,
    login    varchar,
    name     varchar,
    birthday timestamp
);

CREATE TABLE IF NOT EXISTS user_film_like
(
    film_id bigint,
    user_id bigint
);

CREATE TABLE IF NOT EXISTS genre
(
    id   bigint PRIMARY KEY,
    name varchar
);

CREATE TABLE IF NOT EXISTS mpa_rating
(
    id   bigint PRIMARY KEY,
    name varchar
);

CREATE TABLE IF NOT EXISTS status
(
    id   bigint PRIMARY KEY,
    name varchar
);

CREATE TABLE IF NOT EXISTS film_mpa
(
    film_id bigint,
    mpa_id  bigint,
    FOREIGN KEY (film_id) REFERENCES film (id),
    FOREIGN KEY (mpa_id) REFERENCES mpa_rating (id)
);

CREATE TABLE IF NOT EXISTS film_genre
(
    film_id  bigint,
    genre_id bigint,
    FOREIGN KEY (film_id) REFERENCES film (id),
    FOREIGN KEY (genre_id) REFERENCES genre (id)
);

CREATE TABLE IF NOT EXISTS user_friend
(
    user_id         bigint,
    user_friend_id  bigint,
    status_id       bigint,
    FOREIGN KEY (user_friend_id) REFERENCES usr (id),
    FOREIGN KEY (status_id) REFERENCES status (id)
);