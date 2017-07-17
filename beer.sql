-- psql -a -f clothing.sql

CREATE DATABASE beer;

\c beer;

CREATE TABLE pale_ales (id SERIAL PRIMARY KEY, brewer VARCHAR(255), name VARCHAR(255), type VARCHAR(255), abv DECIMAL, ibu DECIMAL, image_url VARCHAR(255), price DECIMAL, in_stock BOOLEAN);

INSERT INTO pale_ales (brewer, name, type, abv, ibu, image_url, price, in_stock) VALUES ('Revolution', 'Fist City', 'pale ale', 5.5, 40, 'https://www.friartuckonline.com/Products/Images/851464003423/1005/REVOLUTION-FIST-CITY-6PK-CANS_Savoy-IL-v1.jpg', 6, 'true');

CREATE TABLE stouts  (id SERIAL PRIMARY KEY, brewer VARCHAR(255), name VARCHAR(255), type VARCHAR(255), abv DECIMAL, ibu DECIMAL, image_url VARCHAR(255), price DECIMAL, in_stock BOOLEAN);
INSERT INTO stouts (brewer, name, type, abv, ibu, image_url, price, in_stock) VALUES ('Revolution', 'Fist City', 'pale ale', 5.5, 40, 'https://www.friartuckonline.com/Products/Images/851464003423/1005/REVOLUTION-FIST-CITY-6PK-CANS_Savoy-IL-v1.jpg', 6, 'true');
