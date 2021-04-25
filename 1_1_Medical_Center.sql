
-- in terminal:
-- psql < 1_1_Medical_Center.sql
-- psql medical_center

DROP DATABASE IF EXISTS  medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE doctors_patients
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors,
  patient_id INTEGER REFERENCES patients
);
CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE diseases_patients
(
  id SERIAL PRIMARY KEY,
  disease_id INTEGER REFERENCES diseases,
  patient_id INTEGER REFERENCES patients
);

INSERT INTO doctors (name)
VALUES ('Henry'), ('Julian'),('Travis');

INSERT INTO patients (name)
VALUES ('Bailey'),('Brenda'),('Brittney');

INSERT INTO diseases (name)
VALUES ('Heart'),('Covid'),('Asthma');

INSERT INTO diseases_patients (disease_id,patient_id )
VALUES (1,1),(1,2),(2,2),(3,2),(3,2);

INSERT INTO doctors_patients (doctor_id,patient_id )
VALUES (1,1),(1,2),(1,3),(2,2),(3,3);