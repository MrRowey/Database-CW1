------------- Steping into History DB --------------------

-- Destroy and Create DB --
DROP DATABASE IF EXISTS History;
CREATE DATABASE IF NOT EXISTS History;
USE History;


----- User & Staff -----
CREATE TABLE 'Account' (
    'id' INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'username' VARCHAR(50) NOT NULL,
    'password' VARCHAR(50) NOT NULL
);

CREATE TABLE 'Country' (
    'id' INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'country' VARCHAR(50) NOT NULL
);

CREATE TABLE 'Address' (
    'id' INT(10) NOT NULL AUTO_INCREMENT,
    'addressLine1' VARCHAR(50) NOT NULL,
    'addressLine2' VARCHAR(50) NOT NULL,
    'city' VARCHAR(50) NOT NULL,
    'county' VARCHAR(50) NOT NULL,
    'postcode' VARCHAR(10) NOT NULL,
    'country_id' INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (country_id) REFERENCES Country(id)
);

CREATE TABLE 'Job_Role' (
    'id' INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'role' VARCHAR(50) NOT NULL
);

CREATE TABLE 'Name' (
    'id' INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'forname' VARCHAR(50) NOT NULL,
    'surname' VARCHAR(50) NOT NULL
);

CREATE TABLE 'Contact_Details' (
    'id' INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'homePhone' int(20) NOT NULL,
    'mobilePhone' int(20) NOT NULL,
    'email' VARCHAR(50) NOT NULL
)

CREATE TABLE 'Customer' (
    'id' INT(10) NOT NUll AUTO_INCREMENT,
    'name_id' INT(10) NOT NULL,
    'contactDetails_id' INT(10) NOT NUll,
    'address_id' INT(10) NOT NUll,
    'account_id' INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (name_id) REFERENCES Name(id),
    FOREIGN KEY (contactDetails_id) REFERENCES Contact_Details(id),
    FOREIGN KEY (address_id) REFERENCES Address(id),
    FOREIGN KEY (account_id) REFERENCES Account(id)
);

CREATE TABLE 'Staff' (
    'id' INT(10) Not Null AUTO_INCREMENT,
    'name_id' INT(10) NOT NULL ,
    'contactDetails_id' INT(10) NOT NUll,
    'address_id' INT(10) NOT NUll,
    'account_id' INT(10) NOT NULL,
    'jobRole_id' int(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (name_id) REFERENCES Name(id),
    FOREIGN KEY (contactDetails_id) REFERENCES Contact_Details(id),
    FOREIGN KEY (address_id) REFERENCES Address(id),
    FOREIGN KEY (account_id) REFERENCES Account(id),
    FOREIGN KEY (jobRole_id) REFERENCES Job_Role(id)
);



-- Link Tables for Customer --

Create table Customer_To_Tour (
    customer_id INT(10) NOT NULL,
    tour_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (tour_id) REFERENCES Tour(id)
);

Create table Customer_To_Lecture (
    customer_id INT(10) NOT NULL,
    lecture_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (lecture_id) REFERENCES Lecture(id)
);

Create table Customer_To_Workshop_and_Course (
    customer_id INT(10) NOT NULL,
    workshop_or_course_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (workshop_or_course_id) REFERENCES Workshop_and_Course(id)
);

Create table Customer_To_Tree (
    customer_id INT(10) NOT NULL,
    tree_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (tree_id) REFERENCES Family_Tree(id)
);

Create table Customer_To_Genom (
    customer_id INT(10) NOT NULL,
    genom_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (genom_id) REFERENCES Genom(id)
);

-- Link tables for Staff --

Create table Staff_To_Tour (
    staff_id INT(10) NOT NULL,
    tour_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (tour_id) REFERENCES Tour(id)
);

Create table Staff_To_Workshop_and_Course (
    staff_id INT(10) NOT NULL,
    workshop_or_course_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (workshop_or_course_id) REFERENCES Workshop_and_Course(id)
);

Create table Staff_To_Tree (
    staff_id INT(10) NOT NULL,
    tree_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (tree_id) REFERENCES Family_Tree(id)
);

Create table Staff_To_Genom (
    staff_id INT(10) NOT NULL,
    genom_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (genom_id) REFERENCES Genom(id)
);


----- Services -----



--- Tour ----

Create TABLE Tour_Type (
    id INT(10) AUTO_INCREMENT NOT NULL,
    tourType VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

Create TABLE Tour_Location (
    id INT(10) AUTO_INCREMENT NOT NULL,
    province VARCHAR(50) NOT NULL,
    country_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (country_id) REFERENCES Country(id)
);

Create TABLE Tour_Details (
    id INT(10) AUTO_INCREMENT NOT NULL,
    tourType_id INT(10) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    capacity INT(10) NOT NULL,
    location_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (tourType_id) REFERENCES Tour_Type(id),
    FOREIGN KEY (location_id) REFERENCES Tour_Location(id)
);

Create TABLE Tour (
    id INT(10) NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    details_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (details_id) REFERENCES Tour_Details(id)
);

-- Lecture --

Create TABLE Speaker (
    id INT(10) AUTO_INCREMENT NOT NULL,
    name_id INT(10) NOT NULL,
    contactDetails_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (name_id) REFERENCES Name(id),
    FOREIGN KEY (contactDetails_id) REFERENCES Contact_Details(id)
);

Create TABLE Lecture (
    id INT(10) AUTO_INCREMENT NOT NULL,
    speaker_id INT(10) NOT NULL,
    topic VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    bookingFee DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (speaker_id) REFERENCES Speaker(id)
);

-- Family Tree --

Create TABLE Service_Access (
    id INT(1) AUTO_INCREMENT NOT NULL,
    serviceAccess VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

Create TABLE Family_Tree_Details (
    id INT(10) AUTO_INCREMENT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    serviceAccses_id INT(1) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (serviceAccses_id) REFERENCES Service_Access(id)
);

Create TABLE Family_Tree (
    id INT(10) AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    details_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (details_id) REFERENCES Family_Tree_Details(id)
);

-- Genom --

Create TABLE Genom_Details (
    id INT(10) AUTO_INCREMENT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    serviceAccses_id INT(1) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (serviceAccses_id) REFERENCES Service_Access(id)
);

Create TABLE Genom (
    id INT(10) AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    details_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (details_id) REFERENCES Genom_Details(id)
);


-- Workshop --

Create TAble Workshop_and_Course_Details (
    id INT(10) AUTO_INCREMENT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    capacity INT(10) NOT NULL,
    PRIMARY KEY(id)
);

Create TABLE Workshop_and_Course (
    id INT(10) AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    details_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (details_id) REFERENCES Workshop_and_Course_Details(id)
);

-- Books --

Create TABLE Author (
    id INT(10) AUTO_INCREMENT NOT NULL,
    name_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (name_id) REFERENCES Name(id)
);

Create TABLE Publisher (
    id INT(10) AUTO_INCREMENT NOT NULL,
    name INT(10) NOT NULL,
    PRIMARY KEY(id)
);

Create Table Genre (
    id INT(10) AUTO_INCREMENT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

Create TABLE Book_Details (
    id INT(10) AUTO_INCREMENT NOT NULL,
    date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    isbn INT(10) NOT NULL,
    img VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

Create TABLE Book (
    id INT(10) AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    author_id INT(10) NOT NULL,
    publisher_id INT(10) NOT NULL,
    genre_id INT(10) NOT NULL,
    description VARCHAR(50) NOT NULL,
    book_details_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    FOREIGN KEY (book_details_id) REFERENCES Book_Details(id)
);

-- Magazine --

Create TABLE Magazine (
    id INT(10) AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    issue INT(10) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(id)
);

-- Document --
create table Document (
    id INT(10) AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    author_id INT(10) NOT NULL,
    year YEAR(4) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (author_id) REFERENCES Author(id)
);

-- Service
create table service_to_order (
    id INT(10) AUTO_INCREMENT NOT NULL,
    tour_id INT(10) NOT NULL,
    lecture_id INT(10) NOT NULL,
    workshop_id INT(10) NOT NULL,
    tree_id INT(10) NOT NULL,
    genom_id INT(10) NOT NULL,
    book_id INT(10) NOT NULL,
    magazine_id INT(10) NOT NULL,
    document_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (tour_id) REFERENCES Tour(id),
    FOREIGN KEY (lecture_id) REFERENCES Lecture(id),
    FOREIGN KEY (workshop_id) REFERENCES Workshop(id),
    FOREIGN KEY (tree_id) REFERENCES FamilyTree(id),
    FOREIGN KEY (genom_id) REFERENCES Genom(id),
    FOREIGN KEY (book_id) REFERENCES Book(id),
    FOREIGN KEY (magazine_id) REFERENCES Magazine(id),
);

-- Order
Create table Order (
    id INT(10) AUTO_INCREMENT AUTO,
    service_id INT(10) NOT NULL,
    user_id INT(10) NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (service_id) REFERENCES Service(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
);


