DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams (
    id SERIAL PRIMARY KEY  NOT NULL,
    Name TEXT   NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY  NOT NULL,
    Name TEXT   NOT NULL,
    team_id INT   NOT NULL REFERENCES teams

);


CREATE TABLE league_dates (
    id SERIAL PRIMARY KEY  NOT NULL,
    Season TEXT   NOT NULL,
    season_start DATE   NOT NULL,
    season_end DATE   NOT NULL

);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY  NOT NULL,
    Name TEXT   NOT NULL

);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY  NOT NULL,
    Name TEXT   NOT NULL,
    home_team_id INT   NOT NULL REFERENCES teams,
    away_team_id INT   NOT NULL REFERENCES teams,
    referee_id INT   NOT NULL REFERENCES referees,
    season_id INT   NOT NULL REFERENCES league_dates

);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY  NOT NULL,
    match_id INT   NOT NULL REFERENCES matches ,
    player_id INT   NOT NULL

);


CREATE TABLE team_rankings (
    id SERIAL PRIMARY KEY  NOT NULL,
    Name TEXT   NOT NULL

);

CREATE TABLE results_by_team (
    id SERIAL PRIMARY KEY  NOT NULL,
    team_id INT   NOT NULL REFERENCES teams,
    match_id INT   NOT NULL REFERENCES matches,
    result TEXT   NOT NULL

);

