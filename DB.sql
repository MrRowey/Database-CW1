------------- Steping into History DB --------------------

-- Destroy and Create DB --
DROP DATABASE IF EXISTS History;
CREATE DATABASE IF NOT EXISTS History;
USE History;


----- User & Staff -----
Create TABLE Account (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

Create TABLE Address (
    id INT(10) NOT NULL AUTO_INCREMENT,
    addressLine1 VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    county VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    country_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (country_id) REFERENCES Country(id)
);

Create TABLE Country (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(50) NOT NULL
);

Create TABLE Job_Role (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(50) NOT NULL
);

Create TABLE Name (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    forname VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL
);

Create TABLE Contact_Details (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    homePhone int(20) NOT NULL,
    mobilePhone int(20) NOT NULL,
    email VARCHAR(50) NOT NULL
)

CREATE TABLE Customer (
    id INT(10) NOT NUll AUTO_INCREMENT,
    name_id INT(10) NOT NULL,
    contactDetails_id INT(10) NOT NUll,
    address_id INT(10) NOT NUll,
    account_id INT(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (name_id) REFERENCES Name(id),
    FOREIGN KEY (contactDetails_id) REFERENCES Contact_Details(id),
    FOREIGN KEY (address_id) REFERENCES Address(id),
    FOREIGN KEY (account_id) REFERENCES Account(id)
);

CREATE TABLE Staff (
    id INT(10) Not Null AUTO_INCREMENT,
    name_id INT(10) NOT NULL ,
    contactDetails_id INT(10) NOT NUll,
    address_id INT(10) NOT NUll,
    account_id INT(10) NOT NULL,
    jobRole_id int(10) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (name_id) REFERENCES Name(id),
    FOREIGN KEY (contactDetails_id) REFERENCES Contact_Details(id),
    FOREIGN KEY (address_id) REFERENCES Address(id),
    FOREIGN KEY (account_id) REFERENCES Account(id),
    FOREIGN KEY (jobRole_id) REFERENCES JobRole(id)
);

-- Link Tables for Customer --

Create table Customer_To_Tour (
    customer_id INT(10) NOT NULL,
    tour_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (tour_id) REFERENCES Tour(id)
)

Create table Customer_To_Lecture (
    customer_id INT(10) NOT NULL,
    lecture_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (lecture_id) REFERENCES Lecture(id)
)

Create table Customer_To_Workshop (
    customer_id INT(10) NOT NULL,
    workshop_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (workshop_id) REFERENCES Workshop(id)
)

Create table Customer_To_Course (
    customer_id INT(10) NOT NULL,
    course_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (course_id) REFERENCES Course(id)
)

Create table Customer_To_Tree (
    customer_id INT(10) NOT NULL,
    tree_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (tree_id) REFERENCES FamilyTreeService(id)
)

Create table Customer_To_Genom (
    customer_id INT(10) NOT NULL,
    genom_id INT(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (genom_id) REFERENCES GenomService(id)
)

-- Link tables for Staff --

Create table StaffToTour (
    staff_id INT(10) NOT NULL,
    tour_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (tour_id) REFERENCES GuidedTour(id)
)

Create table StaffToWorkshop (
    staff_id INT(10) NOT NULL,
    workshop_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (workshop_id) REFERENCES Workshop(id)
)

Create table StaffToCourse (
    staff_id INT(10) NOT NULL,
    course_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (course_id) REFERENCES Course(id)
)

Create table StaffToTree (
    staff_id INT(10) NOT NULL,
    tree_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (tree_id) REFERENCES FamilyTreeService(id)
)

Create table StaffToGenom (
    staff_id INT(10) NOT NULL,
    genom_id INT(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (genom_id) REFERENCES GenomService(id)
)


----- Services -----

Create TABLE Tour (
    id INT(10) NOT NULL AUTO_INCREMENT,
    staff_id INT(10) NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    details_id INT(10) NOT NULL
    PRIMARY KEY(id),
    FOREIGN KEY (staff_id) REFERENCES StaffToTour(staff_id),
    FOREIGN KEY (details_id) REFERENCES TourDetails(id)
)

Create TABLE TourDetails (
    id INT(10) AUTO_INCREMENT NOT NULL,
    tourType_id INT(10) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    capacity INT(10) NOT NULL,
    location_id INT(10) NOT NULL
    PRIMARY KEY(id),
    FOREIGN KEY (tourType_id) REFERENCES TourType(id),
    FOREIGN KEY (location_id) REFERENCES TourLocation(id)
)

Create TABLE TourType (
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

