/*
  Stella Ullman
  Lab 05 
  CSC 362 Database Systems F23
*/

DROP DATABASE IF EXISTS flying_carpets;
CREATE DATABASE flying_carpets;
USE flying_carpets;

CREATE TABLE rugs (
    rug_id INT AUTO_INCREMENT not NULL,
    rug_style VARCHAR(64),
    rug_year_made INT,
    country_id INT,
    material_id INT,
    rug_size VARCHAR(64),
    rug_purchase_price FLOAT,
    rug_year_acquired INT,
    rug_markup INT,
    rug_list_price FLOAT
);
CREATE TABLE countries(
    country_id INT AUTO_INCREMENT,
    rug_country VARCHAR(64)
)
CREATE TABLE materials(
    material_id INT AUTO_INCREMENT,
    rug_material VARCHAR(64)
)
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT not NULL,
    customer_first_name VARCHAR(64),
    customer_last_name VARCHAR(64),
    street_address VARCHAR(64) not NULL,
    city_address VARCHAR(64) not NULL,
    state_code VARCHAR(2) not NULL,
    zipcode_address VARCHAR(5) not NULL,
    phone_number VARCHAR(16),
    customer_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE states(
    state_code  VARCHAR(2) not NULL,
    state_name VARCHAR(64)
)