-- Create Database
CREATE DATABASE IF NOT EXISTS medical_db;
USE medical_db;

-- Create Date Dimension Table
CREATE TABLE IF NOT EXISTS date_dimension (
    date_id INT PRIMARY KEY AUTO_INCREMENT,
    full_date DATE UNIQUE,
    year INT,
    month INT,
    day INT,
    day_of_week VARCHAR(10),
    quarter INT
);

-- Create Hospitals Dimension Table
CREATE TABLE IF NOT EXISTS hospitals (
    hospital_id INT PRIMARY KEY AUTO_INCREMENT,
    facility_id VARCHAR(20) UNIQUE,
    hospital_name VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    hospital_type VARCHAR(100),
    hospital_ownership VARCHAR(100),
    hospital_rating INT
);

-- Create Patients Dimension Table
CREATE TABLE IF NOT EXISTS patients (
    patient_id BIGINT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    has_diabetes BOOLEAN,
    has_hypertension BOOLEAN
);

-- Create Fact Table: Appointments
CREATE TABLE IF NOT EXISTS appointments (
    appointment_id BIGINT PRIMARY KEY,
    patient_id BIGINT,
    hospital_id INT,
    date_id INT,
    scheduled_date DATETIME,
    appointment_date DATETIME,
    status INT,  -- (0: came to appointment, 1: did not come)
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id),
    FOREIGN KEY (date_id) REFERENCES date_dimension(date_id)
);

-- Where API data from CDC will be stored
CREATE TABLE IF NOT EXISTS chronic_diseases (
    disease_id INT PRIMARY KEY AUTO_INCREMENT,
    condition_name VARCHAR(255),
    state VARCHAR(50),
    prevalence FLOAT,
    year INTappointment_idpatient_idhospital_iddate_id
);