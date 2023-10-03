/*
  Stella Ullman
  Lab 05 
  CSC 362 Database Systems F23
*/

DROP DATABASE IF EXISTS flying_carpets;
CREATE DATABASE flying_carpets;
USE flying_carpets;

CREATE TABLE rugs (
    rug_id INT AUTO_INCREMENT,
    rug_style VARCHAR(64),
    rug_year_made INT,
    country_id INT,
    material_id INT,
    rug_size VARCHAR(64),
    rug_purchase_price FLOAT,
    rug_date_acquired VARCHAR(64),
    rug_markup INT,
    PRIMARY KEY (rug_id)
);
--validation table
CREATE TABLE countries(
    country_id INT AUTO_INCREMENT,
    country_name VARCHAR(64),
    PRIMARY KEY (country_id)
);
--validation table
CREATE TABLE materials(
    material_id INT AUTO_INCREMENT,
    material_name VARCHAR(64),
    PRIMARY KEY (material_id)
);
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    customer_first_name VARCHAR(64),
    customer_last_name VARCHAR(64),
    street_address VARCHAR(64) NOT NULL,
    city_address VARCHAR(64) NOT NULL,
    state_code VARCHAR(2) NOT NULL,
    zipcode_address VARCHAR(5) NOT NULL,
    phone_number VARCHAR(16),
    customer_active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (customer_id)
);
-- validation table
CREATE TABLE states(
    state_code  VARCHAR(2) NOT NULL,
    state_name VARCHAR(64),
    PRIMARY KEY (state_code)
);


CREATE TABLE purchases (
    rug_id INT,
    customer_id INT,
    sale_date VARCHAR(64),
    sale_price VARCHAR(64),
    return_date VARCHAR(64),
    FOREIGN KEY rug_id REFERENCES rugs(rug_id) ON DELETE SET NULL,
    FOREIGN KEY customer_id REFERENCES customers(customer_id),
    PRIMARY KEY (rug_id, customer_id)
);

CREATE TABLE trials (
    rug_id INT,
    customer_id INT,
    trial_start_date VARCHAR(64),
    trial_expected_end_date VARCHAR(64),
    trial_end_date VARCHAR(64),
    FOREIGN KEY rug_id REFERENCES rugs(rug_id) ON DELETE SET NULL,
    FOREIGN KEY customer_id REFERENCES customers(customer_id),
    PRIMARY KEY (rug_id, customer_id)
);

CREATE VIEW rug_used AS
    SELECT *
    FROM rugs
        LEFT OUTER JOIN purchases
        LEFT OUTER JOIN trials;

/* --------ENTER IN DATA----------- */
INSERT INTO materials(material_name)
VALUES
    ('silk'),
    ('wool'),
    ('cotton');

INSERT INTO states(state_code, state_name)
VALUES
    ('CA', 'California'),
    ('OH', 'Ohio'),
    ('GA', 'Georgia'),
    ('PA', 'Pennslyvania');

INSERT INTO countries(country_name)
VALUES
    ('India'),
    ('Afghanistan'),
    ('Iran'),
    ('Turkey');

INSERT INTO customers(customer_first_name, customer_last_name, street_address, 
    city_address, state_code, zipcode_address, phone_number)
VALUES
    ('Gloria', 'Gomez', '78 Corona Rd.', 'Fullerton', 'CA', '92831', NULL),
    ('Marco', 'Page', '747 East Harrison Lane', 'Atlanta', 'GA', '30303', '(588) 799-6535'),
    ('Sandra', 'Page', '747 East Harrison Lane', 'Atlanta', 'GA', '30303', '(997) 697-2666');

INSERT INTO rugs(country_id, rug_style, rug_year_made, rug_size, material_id,
     rug_purchase_price, rug_date_acquired, rug_markup)
VALUES
    (4, 'Ushak', '1925', '5x7', 2, 625.00, '4/6/17', 100);

INSERT INTO purchases(customer_id, rug_id, sale_date, sale_price, return_date)
VALUES
    (1, 1, '12/14/17', 990.00);

INSERT INTO trials (customer_id, rug_id, trial_start_date, trial_expected_end_date, trial_end_date)
VALUES
    (1, 1, '12/01/17', '12/18/17', '12/14/17');


SELECT customer_id, rug_id, sale_date, sale_price
    FROM purchases
    INNER JOIN rugs
    INNER JOIN customers;