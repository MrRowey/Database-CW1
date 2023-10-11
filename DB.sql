------------- Steping into History DB --------------------

-- Destroy and Create DB --
DROP DATABASE IF EXISTS History;
CREATE DATABASE IF NOT EXISTS History;
USE History;


----- User & Staff -----

CREATE TABLE Customer (
    id INT(10) NOT NUll AUTO_INCREMENT PRIMARY KEY,
    name_id INT(10) NOT NULL,
    contactDetails_id INT(10) NOT NUll,
    address_id INT(10) NOT NUll,
    account_id INT(10) NOT NULL
)

CREATE TABLE Staff (
    id INT(10) Not Null AUTO_INCREMENT PRIMARY KEY,
    name_id INT(10) NOT NULL ,
    contactDetails_id INT(10) NOT NUll,
    address_id INT(10) NOT NUll,
    account_id INT(10) NOT NULL,
    jobRole_id int(10) NOT NULL
)

Create TABLE Name (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    forname VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL
)

Create TABLE ContactDetails (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    homePhone int(20) NOT NULL,
    mobilePhone int(20) NOT NULL,
    email VARCHAR(50) NOT NULL
)

Create TABLE Account (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
)

Create TABLE Address (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    addressLine1 VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    county VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    country_id INT(10) NOT NULL
)

Create TABLE Country (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(50) NOT NULL
)

Create TABLE JobRole (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(50) NOT NULL
)

Create table CustomerToTour (
    customer_id INT(10) NOT NULL,
    tour_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (tour_id) REFERENCES GuidedTour(id)
)

Create table CustomerToLecture (
    customer_id INT(10) NOT NULL,
    lecture_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (lecture_id) REFERENCES Lecture(id)
)

Create table CustomerToWorkshop (
    customer_id INT(10) NOT NULL,
    workshop_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (workshop_id) REFERENCES Workshop(id)
)

Create table CustomerToCourse (
    customer_id INT(10) NOT NULL,
    course_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (course_id) REFERENCES Course(id)
)

Create table CustomerToTree (
    customer_id INT(10) NOT NULL,
    tree_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (tree_id) REFERENCES FamilyTreeService(id)
)

Create table CustomerToGenom (
    customer_id INT(10) NOT NULL,
    genom_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (genom_id) REFERENCES GenomService(id)
)




----- Services -----

Create TABLE GuidedTour (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    staff_id INT(10) NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    details_id INT(10) NOT NULL
)

Create TABLE GuidedTourDetails (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tourType_id INT(10) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    capacity INT(10) NOT NULL,
    location_id INT(10) NOT NULL
)

Create TABLE GuidedTourType (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tourType VARCHAR(50) NOT NULL
)

Create TABLE StaffToGuidedTour (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    staff_id INT(10) NOT NULL,
    guidedTour_id INT(10) NOT NULL
)

Create TABLE GuidedTourLocation (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    province VARCHAR(50) NOT NULL,
    country_id INT(10) NOT NULL
)

Create TABLE GuidedTourBooking (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    guidedTour_id INT(10) NOT NULL,
    user_id INT(10) NOT NULL
)

-- Lecture --

create TABLE Lecture (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    speaker_id INT(10) NOT NULL,
    topic VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    bookingFee DECIMAL(10,2) NOT NULL
)

create TABLE Speaker (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_id INT(10) NOT NULL,
    contactDetails_id INT(10) NOT NULL
)

Create TABLE LectureBooking (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    lecture_id INT(10) NOT NULL,
    user_id INT(10) NOT NULL
)

 
-- Family Tree Serice & Genom  --

Create TABLE FamilyTreeService (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id INT(10) NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    details_id INT(10) NOT NULL
)

create TABLE FamilyTreeServiceDetails (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    serviceAccses_id INT(1) NOT NULL
)

Create TABLE StaffToFamilyTreeService (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    staff_id INT(10) NOT NULL,
    familyTreeService_id INT(10) NOT NULL
)

Create TABLE FamilyTreeServiceBooking (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    familyTreeService_id INT(10) NOT NULL,
    user_id INT(10) NOT NULL
)

Create TABLE ServiceAccess (
    id INT(1) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    serviceAccess VARCHAR(50) NOT NULL
)

Create TABLE GenomService (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id INT(10) NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    details_id INT(10) NOT NULL
)

create TABLE GenomServiceDetails (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    serviceAccses_id INT(1) NOT NULL
)

Create TABLE GenomServiceBooking (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    genomService_id INT(10) NOT NULL,
    user_id INT(10) NOT NULL
)

Create TABLE StaffToGenomService (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    staff_id INT(10) NOT NULL,
    genomService_id INT(10) NOT NULL
)

-- Books / Docs --

Create TABLE Book (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author_id INT(10) NOT NULL,
    publisher_id INT(10) NOT NULL,
    genre_id INT(10) NOT NULL,
    description VARCHAR(50) NOT NULL,
    year DATE NOT NULL,
    isbn int(13) NOT NULL,
    image VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
)

Create TABLE Author (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_id INT(10) NOT NULL
)

Create TABLE Publisher (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name INT(10) NOT NULL
)

create TABLE Magazine (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    issue INT(10) NOT NULL,
    price DECIMAL(10,2) NOT NULL
)



-- Bookings --
Create TABLE Bookings (
    id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    genom_id INT(10) NOT NULL,
    tour_id INT(10) NOT NULL,
    lecture_id INT(10) NOT NULL,
    workshop_id INT(10) NOT NULL,
    course_id INT(10) NOT NULL
)

-- Store
Create TABLE Store (
    id INT(10) AUTO_INCREMENT AUTO,
    order_id INT(10) NOT NULL,
    PRIMARY KEY(id)
);

-- Order
Create Order (
    id INT(10) AUTO_INCREMENT AUTO,
    user_id INT(10) NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(id)
);

