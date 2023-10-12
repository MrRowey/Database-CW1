CREATE TABLE Customer (
    id INT(10) NOT NUll AUTO_INCREMENT PRIMARY KEY,
    name_id INT(10) NOT NULL,
    contactDetails_id INT(10) NOT NUll,
    address_id INT(10) NOT NUll,
    account_id INT(10) NOT NULL
);

CREATE TABLE Staff (
    id INT(10) Not Null AUTO_INCREMENT PRIMARY KEY,
    name_id INT(10) NOT NULL ,
    contactDetails_id INT(10) NOT NUll,
    address_id INT(10) NOT NUll,
    account_id INT(10) NOT NULL,
    jobRole_id int(10) NOT NULL
);

Create TABLE Name (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    forname VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL
);

Create TABLE ContactDetails (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    homePhone int(20) NOT NULL,
    mobilePhone int(20) NOT NULL,
    email VARCHAR(50) NOT NULL
);

Create TABLE Account (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

Create TABLE Address (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    addressLine1 VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    county VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    country_id INT(10) NOT NULL
);

Create TABLE Country (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(50) NOT NULL
);

Create TABLE JobRole (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(50) NOT NULL
)