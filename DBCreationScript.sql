-- Stepping Into History DB --

DROP DATABASE IF EXISTS stepintohistoryv2;
CREATE DATABASE IF NOT EXISTS stepintohistoryv2;
USE stepintohistoryv2;

-- Customer Related --
CREATE Table city (
    cityID int NOT NULL AUTO_INCREMENT,
    cityName varchar(50) NOT NULL,
    PRIMARY KEY (cityID)
);

CREATE Table country (
    countryID int NOT NULL AUTO_INCREMENT,
    countryName varchar(50) NOT NULL,
    PRIMARY KEY (countryID)
);

CREATE TABLE address (
    addressID int NOT Null AUTO_INCREMENT,
    addressLine varchar(50) NOT NULL,
    city int(11) NOT NULL,
    country int(11) NOT NULL,
    postcode varchar(10) NOT NULL,
    PRIMARY KEY (addressID),
    FOREIGN KEY (city) REFERENCES city(cityID),
    FOREIGN KEY (country) REFERENCES country(countryID)
);

CREATE TABLE customer (
    customerID int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    address int(11) NOT NULL,
    number int(11) NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (customerID),
    FOREIGN KEY (address) REFERENCES address(addressID)
);

CREATE TABLE account (
    accountID int NOT NULL AUTO_INCREMENT,
    customer int(11) NOT NULL,
    username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    administrator int(1) NOT NULL,
    PRIMARY KEY (accountID),
    FOREIGN KEY (customer) REFERENCES customer(customerID)
);

-- Books and Docs Related --

CREATE TABLE publishers (
    publisherID int NOT NULL AUTO_INCREMENT,
    publisherName varchar(50) NOT NULL,
    PRIMARY KEY (publisherID)
);

CREATE TABLE genres (
    genreID int NOT NULL AUTO_INCREMENT,
    genreName varchar(50) NOT NULL,
    PRIMARY KEY (genreID)
);

CREATE TABLE authors (
    authorID int NOT NULL AUTO_INCREMENT,
    authorName varchar(50) NOT NULL,
    PRIMARY KEY (authorID)
);

CREATE TABLE books (
    bookID int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    author int(11) NOT NULL,
    publisher int(11) NOT NULL,
    genre int(11) NOT NULL,
    description varchar(255) NOT NULL,
    year int(4) NOT NULL,
    price decimal(10,2) NOT NULL,
    PRIMARY KEY (bookID),
    FOREIGN KEY (author) REFERENCES authors(authorID),
    FOREIGN KEY (publisher) REFERENCES publishers(publisherID),
    FOREIGN KEY (genre) REFERENCES genres(genreID)
);

CREATE TABLE documents (
    docID int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    author int(11) NOT NULL,
    description varchar(255) NOT NULL,
    year int(4) NOT NULL,
    PRIMARY KEY (docID),
    FOREIGN KEY (author) REFERENCES authors(authorID)
);

CREATE TABLE library (
    libraryID int NOT NULL AUTO_INCREMENT,
    bookID int(11),
    docID int(11),
    PRIMARY KEY (libraryID),
    FOREIGN KEY (bookID) REFERENCES books(bookID),
    FOREIGN KEY (docID) REFERENCES documents(docID)
);

-- Product / Serices Related --

CREATE TABLE accsesType (
    accsesTypeID int NOT NULL AUTO_INCREMENT,
    accsesType varchar(50) NOT NULL,
    PRIMARY KEY (accsesTypeID)
);

CREATE TABLE dna (
    dnaID int NOT NULL AUTO_INCREMENT,
    date date NOT NULL,
    price decimal(10,2) NOT NULL,
    serviceAccess int(11) NOT NULL,
    PRIMARY KEY (dnaID),
    FOREIGN KEY (serviceAccess) REFERENCES accsesType(accsesTypeID)
);

CREATE TABLE familyTree (
    familyTreeID int NOT NULL AUTO_INCREMENT,
    date date NOT NULL,
    price decimal(10,2) NOT NULL,
    serviceAccess int(11) NOT NULL,
    PRIMARY KEY (familyTreeID),
    FOREIGN KEY (serviceAccess) REFERENCES accsesType(accsesTypeID)
);

CREATE TABLE tour (
    tourID int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    date date NOT NULL,
    time time NOT NULL,
    price decimal(10,2) NOT NULL,
    capacity int(11) NOT NULL,
    location int(11) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY (tourID),
    FOREIGN KEY (location) REFERENCES country(countryID)
);

CREATE TABLE TourBooking (
    tourBookingID int NOT NULL AUTO_INCREMENT,
    tour int(11) NOT NULL,
    PRIMARY KEY (tourBookingID),
    FOREIGN KEY (tour) REFERENCES tour(tourID)
);

CREATE TABLE workshopandcourse (
    workshopID int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    date date NOT NULL,
    time time NOT NULL,
    price decimal(10,2) NOT NULL,
    capacity int(11) NOT NULL,
    location int(11) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY (workshopID),
    FOREIGN KEY (location) REFERENCES city(cityID)
);

CREATE TABLE workshopBooking (
    workshopBookingID int NOT NULL AUTO_INCREMENT,
    workshop int(11) NOT NULL,
    PRIMARY KEY (workshopBookingID),
    FOREIGN KEY (workshop) REFERENCES workshopandcourse(workshopID)
);

CREATE TABLE speaker (
    speakerID int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    PRIMARY KEY (speakerID)
);

CREATE TABLE lecture (
    lectureID int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    speaker int(11) NOT NULL,
    date date NOT NULL,
    time time NOT NULL,
    price decimal(10,2) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY (lectureID),
    FOREIGN KEY (speaker) REFERENCES speaker(speakerID)
);

CREATE TABLE lectureBooking (
    lectureBookingID int NOT NULL AUTO_INCREMENT,
    lecture int(11) NOT NULL,
    PRIMARY KEY (lectureBookingID),
    FOREIGN KEY (lecture) REFERENCES lecture(lectureID)
);

CREATE TABLE products (
    productID int NOT NULL AUTO_INCREMENT,
    productName varchar(50) NOT NULL,
    PRIMARY KEY (productID)
);

CREATE TABLE delivery (
    deliveryID int NOT NULL AUTO_INCREMENT,
    deliveryType varchar(50) NOT NULL,
    PRIMARY KEY (deliveryID)
);

CREATE TABLE subscription (
    subID int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    version int(11) NOT NULL,
    price decimal(10,2) NOT NULL,
    PRIMARY KEY (subID)
);

CREATE TABLE subscriptionOrder (
    subOrderID int NOT NULL AUTO_INCREMENT,
    subscription int(11) NOT NULL,
    delivery int(11) NOT NULL,
    PRIMARY KEY (subOrderID),
    FOREIGN KEY (subscription) REFERENCES subscription(subID),
    FOREIGN KEY (delivery) REFERENCES delivery(deliveryID)
);



CREATE TABLE Orders (
    orderID int NOT NULL AUTO_INCREMENT,
    productType int(11) NOT NULL,
    productOrder int(11) NOT NULL,
    orderDate date NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customerID int(11) NOT NULL,
    PRIMARY KEY (orderID)
);

-- INSERT STATMENTS --

INSERT INTO accsesType (accsesType) VALUES ('In-Person');
INSERT INTO accsesType (accsesType) VALUES ('Remote');
INSERT INTO products (productName) VALUES ('DNA Testing');
INSERT INTO products (productName) VALUES ('Family Tree');
INSERT INTO products (productName) VALUES ('Guided Tour');
INSERT INTO products (productName) VALUES ('Workshop & Course');
INSERT INTO products (productName) VALUES ('Lectures');
INSERT INTO products (productName) VALUES ('Subscription');
INSERT INTO devivery (deliveryType) VALUES ('Phyiscal');
INSERT INTO devivery (deliveryType) VALUES ('Digital');


-- Create Procedures for Data Insertion --

-- Cusomter --
DELIMITER //
CREATE PROCEDURE insertCustomerInfo(name VARCHAR(50), address VARCHAR(50), city VARCHAR(50), country VARCHAR(50), postcode VARCHAR(10), contactNumber VARCHAR(50), email VARCHAR(50))
BEGIN
    IF (SELECT COUNT(country) FROM country WHERE countryName = country) = 0 THEN
        INSERT INTO country (countryName) VALUES (country);
    END IF;
    IF (SELECT COUNT(city) FROM city WHERE cityName = city) = 0 THEN
        INSERT INTO city (cityName) VALUES (city);
    END IF;

    INSERT INTO address (addressLine, city, country, postcode) VALUES (address, (SELECT cityID FROM city WHERE city = cityName), (SELECT countryID FROM country WHERE countryName = country), postcode);
    INSERT INTO customer (name, address, number, email) VALUES (name, LAST_INSERT_ID(), contactNumber, email);
END
//
DELIMITER ;

-- Book
DELIMITER //
CREATE PROCEDURE insertBookInfo(title VARCHAR(50), author VARCHAR(50), publisher VARCHAR(50), genre VARCHAR(50), description VARCHAR(50), year int(4), price DECIMAL(10,2))
BEGIN
	-- Check if the Author already exist in the database
	IF (SELECT COUNT(authorName) FROM authors WHERE author = authorName) = 0 THEN
		INSERT INTO authors (authorName) VALUES (author);
	END IF;

	-- Check if the Publisher already exist in the database
	IF (SELECT COUNT(publisherName) FROM publishers WHERE publisherName = publisher) = 0 THEN
		INSERT INTO publishers (publisherName) VALUES (publisher);
	END IF;

	-- Check if the Genre already exist in the database
	IF (SELECT COUNT(genreName) FROM genres WHERE genreName = genre) = 0 THEN
		INSERT INTO genres (genreName) VALUES (genre);
	END IF;
        
	-- Insert the book into the database
	INSERT INTO books (title, author, publisher, genre, description, year, price) VALUES (title, (SELECT authorID FROM authors WHERE author = authorName), (SELECT publisherID FROM publishers WHERE publisherName = publisher), (SELECT genreID FROM genres WHERE genreName = genre), description, year, price);
     
	-- Insert the book into the library
	INSERT INTO library (bookID) VALUES (LAST_INSERT_ID());
End
//
DELIMITER ;

-- Document
DELIMITER //
CREATE PROCEDURE insertDocInfo(title VARCHAR(50), author VARCHAR(50), description VARCHAR(50), year INT(4))
BEGIN
	-- Check if the Author already exist in the database
	IF (SELECT COUNT(authorName) FROM authors WHERE authorName = author) = 0 THEN
		INSERT INTO authors (authorName) VALUES (author);
	END IF;
        
	-- Insert the document into the database
	INSERT INTO documents (title, author, description, year) VALUES (title, (SELECT authorID FROM authors WHERE authorName = author), description, year);

	-- Insert the document into the library
	INSERT INTO library (docID) VALUES (LAST_INSERT_ID());
End
//
DELIMITER ;

-- DNA Booking
DELIMITER //
CREATE PROCEDURE bookingDNA(CustomerName VARCHAR (50), datebooking DATE, serviceaccses VARCHAR(10))
BEGIN
    insert into dna (date, price, serviceAccess) values (datebooking, 24.99, (select accsesTypeID from accsestype where accsesType = serviceaccses));
    insert into orders (productType, productOrder, customerID) values ((select productID from products where productName = 'DNA Testing'), LAST_INSERT_ID(), (select customerID from customer where name = CustomerName));
END
//
DELIMITER ;

-- Family Tree Procedure
DELIMITER //
CREATE PROCEDURE bookingTree(CustomerName VARCHAR (50), datebooking DATE, serviceaccses VARCHAR(10))
BEGIN
    INSERT INTO familytree (date, price, serviceAccess) values (datebooking, 21.99, (select accsesTypeID from accsestype where accsesType = serviceaccses));

    INSERT INTO orders (productType, productOrder, customerID) values ((select productID from products where productName = 'Family Tree'), LAST_INSERT_ID(), (select customerID from customer where name = CustomerName));
END
//
DELIMITER ;

-- Tour Procedure
DELIMITER //
CREATE PROCEDURE insertTourInfo( title VARCHAR(50), tourdate DATE, tourtime TIME, cost DECIMAL(10,2), capacity int(10), country varchar(50), description VARCHAR(255))
BEGIN
    -- Check if the country already exist in the database
    IF (SELECT COUNT(country) FROM country WHERE countryName = country) = 0 THEN
        INSERT INTO country (countryName) VALUES (country);
    END IF;
    -- Insert the tour into the database
    INSERT INTO tour (title, date, time, price, capacity, location, description) VALUES (title, tourdate, tourtime, cost, capacity, (SELECT countryID FROM country WHERE countryName = country), description);
END
//
DELIMITER ;

-- TourBooking Procedure
DELIMITER //
CREATE PROCEDURE bookingTour( tourOption VARCHAR(50), CustomerName VARCHAR(50))
BEGIN

    insert into TourBooking (tour) values ((SELECT tourID FROM tour WHERE tourOption = title));

    insert into orders (productType, productOrder, customerID) values ((select productID from products where productName = 'Guided Tour'), LAST_INSERT_ID(), (select customerID from customer where name = CustomerName));
END
//
DELIMITER ;

-- Wrkshop Procedure
DELIMITER //
CREATE PROCEDURE insertwrkshopInfo( wrktitle VARCHAR(50), wrkdate DATE, wrktime TIME, cost DECIMAL(10,2), capacity int(10), country varchar(50), description VARCHAR(255))
BEGIN
    -- Check if the country already exist in the database
    IF (SELECT COUNT(country) FROM country WHERE countryName = country) = 0 THEN
        INSERT INTO country (countryName) VALUES (country);
    END IF;
    -- Insert the tour into the database
    INSERT INTO workshopandcourse (title, date, time, price, capacity, location, description) VALUES (wrktitle, wrkdate, wrktime, cost, capacity, (SELECT countryID FROM country WHERE countryName = country), description);
END
//
DELIMITER ;

-- Wrkshop Booking Procedure
DELIMITER //
CREATE PROCEDURE bookingWrk( wrkOption VARCHAR(50), CustomerName VARCHAR(50))
BEGIN
    insert into workshopBooking (workshop) values ((SELECT workshopID FROM workshopandcourse WHERE wrkOption = title));
    insert into orders (productType, productOrder, customerID) values ((select productID from products where productName = 'Workshop & Course'), LAST_INSERT_ID(), (select customerID from customer where name = CustomerName));
END
//
DELIMITER ;

-- Lecture Procedure
DELIMITER //
CREATE PROCEDURE insertLectureInfo( lectitle VARCHAR(50), speakers varchar(50) , lecdate DATE, lectime TIME, cost DECIMAL(10,2), description VARCHAR(255))
BEGIN
    -- Check if the speaker already exist in the database
    IF (SELECT COUNT(speakers) FROM speaker WHERE speakers = name) = 0 THEN
        INSERT INTO speaker (name) VALUES (speakers);
    END IF;
    -- Insert the tour into the database
    INSERT INTO lecture (title, speaker ,date, time, price, description) VALUES (lectitle, (SELECT speakerID FROM speaker WHERE speaker = name) ,lecdate, lectime, cost,description);
END
//
DELIMITER ;

-- Lecture Booking Procedure
DELIMITER //
CREATE PROCEDURE bookinglecture( lecOption VARCHAR(50), CustomerName VARCHAR(50))
BEGIN
    insert into lectureBooking (lecture) values (lecOption);
    insert into orders (productType, ProdcutOrderID, customerID) values ((select productID from products where productName = 'Workshop & Course'), LAST_INSERT_ID(), (select customerID from customer where name = CustomerName));
END
//
DELIMITER ;

-- Subscription Procedure
DELIMITER //
CREATE PROCEDURE subscriptionInfo(title VARCHAR(50), version int(10), cost DECIMAL(10,2))
BEGIN
    insert into subscription (title, version, price) values (title, version, cost);
END
//
DELIMITER ;

-- Subscription Order Procedure
DELIMITER //
CREATE PROCEDURE orderSubscription(versionNum int(11), dType VARCHAR(25), cusName VARCHAR(50))
BEGIN
    INSERT INTO subscriptionOrder (subscription, delivery) VALUES ((SELECT subID from subscription WHERE version = versionNum), (select deliveryID from delivery where deliveryType = dType));
    Insert INTO Orders (productType, productOrder, customerID) VALUES ((select productID from products where productName = 'Subscription'), LAST_INSERT_ID(), (select customerID from customer where name = cusName));
END
//
DELIMITER ;

--- Inserting of Dummy Data ---

-- Book Dummy Data
    CALL insertBookInfo('The Rise and Fall of the Roman Empire', 'Edward Gibbon', 'Penguin Classics', 'Ancient History', 'A comprehensive account of the Roman Empire and its eventual decline.', 1776, 19.99);
    CALL insertBookInfo('The Crusades: A Short History', 'Jonathan Riley-Smith', 'Yale University Press', 'Medieval History', 'An overview of the medieval Crusades and their impact on history.', 2008, 15.99);
    CALL insertBookInfo('A People''s History of the United States', 'Howard Zinn', 'Harper Perennial', 'American History', 'A different perspective on U.S. history, focusing on the experiences of everyday people.', 1980, 12.99);
    CALL insertBookInfo('The Origins of Political Order', 'Francis Fukuyama', 'Farrar, Straus and Giroux', 'Political History', 'Exploring the development of political institutions from prehistoric times to the French Revolution.', 2011, 22.99);
    CALL insertBookInfo('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Harper', 'World History', 'An exploration of the history of the human species, from early humans to the present.', 2014, 18.99);
    CALL insertBookInfo('The Guns of August', 'Barbara W. Tuchman', 'Presidio Press', 'Military History', 'A detailed account of the events leading up to World War I.', 1962, 17.99);
    CALL insertBookInfo('The Wright Brothers', 'David McCullough', 'Simon & Schuster', 'Biographical History', 'A biography of the Wright brothers and their invention of the first powered airplane.', 2015, 16.99);
    CALL insertBookInfo('A History of Western Philosophy', 'Bertrand Russell', 'Routledge', 'Philosophy', 'A comprehensive history of Western philosophy from the pre-Socratic philosophers to the mid-20th century.', 1945, 21.99);
    CALL insertBookInfo('A Short History of Nearly Everything', 'Bill Bryson', 'Broadway Books', 'Science History', 'An engaging journey through the history of science and the universe.', 2003, 14.99);
    CALL insertBookInfo('The Silk Roads: A New History of the World', 'Peter Frankopan', 'Knopf', 'World History', 'An exploration of the interconnected history of the Silk Roads and their impact on the world.', 2015, 19.99);
    CALL insertBookInfo('The Making of Europe: Conquest, Colonization and Cultural Change, 950-1350', 'Robert Bartlett', 'Penguin Books', 'Medieval History', 'An examination of the transformation of Europe in the Middle Ages.', 1993, 16.99);
    CALL insertBookInfo('The Age of Extremes: A History of the World, 1914-1991', 'Eric Hobsbawm', 'Vintage', '20th Century History', 'A global history of the tumultuous 20th century.', 1994, 20.99);
    CALL insertBookInfo('Genghis Khan and the Making of the Modern World', 'Jack Weatherford', 'Broadway Books', 'Biographical History', 'A biography of Genghis Khan and his impact on world history.', 2004, 15.99);
    CALL insertBookInfo('1491: New Revelations of the Americas Before Columbus', 'Charles C. Mann', 'Vintage', 'American History', 'Reexamining the history of the Americas before the arrival of Columbus.', 2005, 14.99);
    CALL insertBookInfo('The Story of Art', 'E.H. Gombrich', 'Phaidon Press', 'Art History', 'An accessible and comprehensive history of art from ancient times to the present.', 1950, 18.99);
    CALL insertBookInfo('The Birth of the West: Rome, Germany, France, and the Creation of Europe in the Tenth Century', 'Paul Collins', 'PublicAffairs', 'Medieval History', 'A look at the development of Europe in the 10th century.', 2013, 16.99);
    CALL insertBookInfo('A Little History of the World', 'E.H. Gombrich', 'Yale University Press', 'World History', 'An engaging history of the world written for younger readers and adults alike.', 1935, 12.99);
    CALL insertBookInfo('The Reformation: A History', 'Diarmaid MacCulloch', 'Viking', 'Religious History', 'A detailed account of the Protestant Reformation and its impact on Christianity.', 2003, 21.99);
    CALL insertBookInfo('A Short History of Myth', 'Karen Armstrong', 'Canongate Books', 'Mythology', 'Exploring the history and significance of myth in human culture.', 2005, 13.99);
    CALL insertBookInfo('The Path Between the Seas: The Creation of the Panama Canal, 1870-1914', 'David McCullough', 'Simon & Schuster', '20th Century History', 'A history of the construction of the Panama Canal.', 1977, 19.99);
    CALL insertBookInfo('The History of the Ancient World: From the Earliest Accounts to the Fall of Rome', 'Susan Bauer', 'W. W. Norton & Company', 'Ancient History', 'A comprehensive history of the ancient world.', 2007, 15.99);
    CALL insertBookInfo('The First Tycoon: The Epic Life of Cornelius Vanderbilt', 'T.J. Stiles', 'Vintage', 'Biographical History', 'A biography of Cornelius Vanderbilt and his role in shaping American transportation and industry.', 2009, 18.99);

-- Documets Dummy Data
    CALL insertDocInfo('The Universal Declaration of Human Rights', 'United Nations', 'A document that proclaims the basic rights and freedoms to which all people are entitled', 1948);
    CALL insertDocInfo('The Civil Rights Act of 1964', 'United States Congress', 'A landmark civil rights and labor law that outlawed discrimination based on race, color, religion, sex, or national origin', 1964);
    CALL insertDocInfo('The Emancipation Proclamation', 'Abraham Lincoln', 'An executive order that proclaimed the freedom of slaves in Confederate-held territory', 1863);
    CALL insertDocInfo('The Declaration of Independence', 'Thomas Jefferson', 'The formal statement announcing the independence of the United States from Great Britain', 1776);
    CALL insertDocInfo('The Gettysburg Address', 'Abraham Lincoln', 'A brief but powerful speech given by President Lincoln during the American Civil War', 1863);
    CALL insertDocInfo('The Bill of Rights', 'James Madison', 'The first ten amendments to the United States Constitution, protecting individual liberties', 1791);
    CALL insertDocInfo('The Treaty of Versailles', 'Various', 'The peace treaty that officially ended World War I', 1919);
    CALL insertDocInfo('The United Nations Charter', 'United Nations', 'The foundational treaty of the United Nations, established to promote international cooperation and prevent future world wars', 1945);
    CALL insertDocInfo('The Marshall Plan', 'George C. Marshall', 'An American initiative to aid Western Europe in rebuilding after World War II', 1948);
    CALL insertDocInfo('The Magna Carta', 'King John of England', 'A charter that limited the power of the English monarchy and laid the foundation for constitutional government', 1215);
    CALL insertDocInfo('The Nuremberg Trials', 'Various', 'A series of military tribunals held to prosecute prominent leaders of Nazi Germany for war crimes', 1945);
    CALL insertDocInfo('The Cuban Missile Crisis: President Kennedys Speech', 'John F. Kennedy', 'A speech addressing the American public during the Cuban Missile Crisis', 1962);
    CALL insertDocInfo('The Declaration of the Rights of Man and of the Citizen', 'National Assembly of France', 'A fundamental document of the French Revolution, asserting individual and collective rights', 1789);
    CALL insertDocInfo('The Treaty of Rome', 'Various', 'The treaty that established the European Economic Community (EEC), precursor to the European Union', 1957);
    CALL insertDocInfo('The Treaty of Lisbon', 'Various', 'A treaty that reformed the constitutional basis of the European Union', 2007);
    CALL insertDocInfo('The Geneva Conventions', 'International Committee of the Red Cross', 'A set of international treaties that govern the treatment of wounded and sick combatants, prisoners of war, and civilians in wartime', 502);
    CALL insertDocInfo('The Articles of Confederation', 'Continental Congress', 'The first constitution of the United States, adopted during the American Revolution', 1777);
    CALL insertDocInfo('The United Nations Universal Declaration on Cultural Diversity', 'United Nations', 'A declaration emphasizing the importance of cultural diversity and dialogue', 2001);
    CALL insertDocInfo('The Kyoto Protocol', 'United Nations', 'An international treaty aimed at reducing greenhouse gas emissions', 1997);
    CALL insertDocInfo('The Treaty on the Non-Proliferation of Nuclear Weapons', 'Various', 'An international treaty designed to prevent the spread of nuclear weapons and promote disarmament', 1968);
    CALL insertDocInfo('The Treaty of Tordesillas', 'Spain and Portugal', 'A treaty dividing the newly discovered lands outside Europe between the two countries', 1494);
    CALL insertDocInfo('The Treaty of Waitangi', 'Various', 'A treaty between the Māori people and the British Crown in New Zealand', 1840);
    CALL insertDocInfo('The Treaty of Brest-Litovsk', 'Various', 'A peace treaty between the Central Powers and Soviet Russia, ending Russian participation in World War I', 1918);
    CALL insertDocInfo('The Camp David Accords', 'Various', 'A pair of peace agreements between Israel and Egypt, brokered by the United States', 1978);
    CALL insertDocInfo('The Treaty of San Francisco', 'Various', 'A treaty that officially ended the state of war between Japan and the Allied Powers, ending World War II', 1951);
    CALL insertDocInfo('The United Nations Framework Convention on Climate Change', 'United Nations', 'An international treaty addressing climate change and global warming', 1992);
    CALL insertDocInfo('The Treaty of Lisbon', 'Various', 'A treaty that reformed the constitutional basis of the European Union', 2007);
    CALL insertDocInfo('The Helsinki Accords', 'Various', 'A series of agreements on security and cooperation in Europe, aimed at reducing Cold War tensions', 1975);
    CALL insertDocInfo('The Camp David Accords', 'Various', 'A pair of peace agreements between Israel and Egypt, brokered by the United States', 1978);
    CALL insertDocInfo('The North Atlantic Treaty', 'Various', 'The founding treaty of NATO, established for collective defense against aggression', 1949);
    CALL insertDocInfo('The Antarctic Treaty', 'Various', 'A treaty that regulates international relations in Antarctica, designating it as a scientific preserve', 1959);
    CALL insertDocInfo('The Dayton Agreement', 'Various', 'A peace agreement that ended the Bosnian War and established Bosnia and Herzegovina', 1995);
    CALL insertDocInfo('The Paris Agreement', 'United Nations', 'An international treaty on climate change, aiming to limit global warming', 2016);

-- Customer Dummy Data
    CALL insertCustomerInfo('John Smith', '123 Main St', 'New York', 'USA', '10001', '+1 (123) 456-7890', 'john.smith@gmail.com');
    CALL insertCustomerInfo('Emily Johnson', '456 Elm St', 'Los Angeles', 'USA', '90001', '+1 (987) 654-3210', 'emily.johnson@yahoo.com');
    CALL insertCustomerInfo('Michael Brown', '789 Oak St', 'London', 'United Kingdom', 'SW1A 1AA', '+44 20 1234 5678', 'michael.brown@hotmail.com');
    CALL insertCustomerInfo( 'Sarah Davis', '101 Pine St', 'Toronto', 'Canada', 'M5V 2T6', '+1 (416) 555-1234', 'sarah.davis@outlook.com');
    CALL insertCustomerInfo('David Lee', '234 Cedar St', 'Sydney', 'Australia', '2000', '+61 2 9876 5432', 'david.lee@mail.com');
    CALL insertCustomerInfo('Maria Rodriguez', '567 Birch St', 'Madrid', 'Spain', '28001', '+34 91 123 45 67', 'maria.rodriguez@icloud.com');
    CALL insertCustomerInfo('Hans Müller', '890 Maple St', 'Berlin', 'Germany', '10115', '+49 30 987654321', 'hans.mueller@web.de');
    CALL insertCustomerInfo('Yuki Tanaka', '543 Redwood St', 'Tokyo', 'Japan', '100-0004', '+81 3 1234 5678', 'yuki.tanaka@softbank.ne.jp');
    CALL insertCustomerInfo( 'Giovanni Rossi', '654 Walnut St', 'Rome', 'Italy', '00118', '+39 06 1234 5678', 'giovanni.rossi@libero.it');
    CALL insertCustomerInfo('Sophie Dupont', '321 Willow St', 'Paris', 'France', '75001', '+33 1 23 45 67 89', 'sophie.dupont@orange.fr');
    CALL insertCustomerInfo('Carlos Fernandez', '876 Acacia St', 'Buenos Aires', 'Argentina', 'C1002AAC', '+54 11 1234-5678', 'carlos.fernandez@fibertel.com.ar');
    CALL insertCustomerInfo('Mohamed Ali', '111 Poplar St', 'Cairo', 'Egypt', '11511', '+20 2 1234 5678', 'mohamed.ali@link.net');
    CALL insertCustomerInfo( 'Marta Kowalski', '222 Elm St', 'Warsaw', 'Poland', '00-001', '+48 22 123 45 67', 'marta.kowalski@wp.pl');
    CALL insertCustomerInfo('Juan Lopez', '333 Oak St', 'Mexico City', 'Mexico', '06500', '+52 55 1234 5678', 'juan.lopez@prodigy.net.mx');
    CALL insertCustomerInfo('Chen Wei', '444 Pine St', 'Shanghai', 'China', '200000', '+86 21 1234 5678', 'chen.wei@qq.com');
    CALL insertCustomerInfo('Ivan Petrov', '555 Cedar St', 'Moscow', 'Russia', '101000', '+7 495 123-45-67', 'ivan.petrov@mail.ru');
    CALL insertCustomerInfo( 'Sara Silva', '666 Redwood St', 'Sao Paulo', 'Brazil', '01323-000', '+55 11 1234-5678', 'sara.silva@terra.com.br');
    CALL insertCustomerInfo('Muhammad Khan', '777 Birch St', 'Karachi', 'Pakistan', '75500', '+92 21 12345678', 'muhammad.khan@hotmail.com.pk');
    CALL insertCustomerInfo('Ali Hassan', '888 Willow St', 'Cairo', 'Egypt', '11511', '+20 2 1234 5678', 'ali.hassan@tedata.net.eg');
    CALL insertCustomerInfo('Maria Lopez', '999 Maple St', 'Buenos Aires', 'Argentina', 'C1002AAC', '+54 11 1234-5678', 'maria.lopez@fibertel.com.ar');
    CALL insertCustomerInfo( 'Jiro Tanaka', '100 Acacia St', 'Tokyo', 'Japan', '100-0004', '+81 3 1234 5678', 'jiro.tanaka@docomo.ne.jp');
    CALL insertCustomerInfo('Sophie Dupuis', '111 Poplar St', 'Paris', 'France', '75001', '+33 1 23 45 67 89', 'sophie.dupuis@laposte.net');
    CALL insertCustomerInfo('Carlos Rodriguez', '222 Elm St', 'Madrid', 'Spain', '28001', '+34 91 123 45 67', 'carlos.rodriguez@telefonica.es');
    CALL insertCustomerInfo('Giovanni Rossi', '333 Oak St', 'Rome', 'Italy', '00118', '+39 06 1234 5678', 'giovanni.rossi@fastweb.it');
    CALL insertCustomerInfo( 'Hans Müller', '444 Pine St', 'Berlin', 'Germany', '10115', '+49 30 987654321', 'hans.mueller@t-online.de');
    CALL insertCustomerInfo('Maria Lopez', '555 Cedar St', 'Buenos Aires', 'Argentina', 'C1002AAC', '+54 11 1234-5678', 'maria.lopez@arnet.com.ar');
    CALL insertCustomerInfo('Chen Wei', '666 Redwood St', 'Shanghai', 'China', '200000', '+86 21 1234 5678', 'chen.wei@163.com');
    CALL insertCustomerInfo('Ivan Petrov', '777 Birch St', 'Moscow', 'Russia', '101000', '+7 495 123-45-67', 'ivan.petrov@mail.ru');
    CALL insertCustomerInfo( 'Sara Silva', '888 Willow St', 'Sao Paulo', 'Brazil', '01323-000', '+55 11 1234-5678', 'sara.silva@terra.com.br');
    CALL insertCustomerInfo('Muhammad Khan', '999 Maple St', 'Karachi', 'Pakistan', '75500', '+92 21 12345678', 'muhammad.khan@hotmail');

-- DNA Dummy Data
    CALL bookingDNA('John Smith', '2023-02-15', 'In-Person');
    CALL bookingDNA('Michael Brown', '2023-10-29', 'In-Person');
    CALL bookingDNA('Sara Silva', '2023-01-07', 'Remote');
    CALL bookingDNA('Muhammad Khan', '2023-01-07', 'In-Person');

-- Family Tree Dummy Data
    CALL bookingTree('Ivan Petrov', '2023-02-15', 'In-Person');
    CALL bookingTree('Maria Lopez', '2023-05-28', 'Remote');
    CALL bookingTree('Ali Hassan', '2023-10-29', 'In-Person');
    CALL bookingTree('Chen Wei', '2023-01-07', 'Remote');
    CALL bookingTree('Muhammad Kha', '2023-01-07', 'In-Person');

-- Tour Info Dummy Data
    CALL insertTourInfo('The Alhambra Palace', '2023-05-10', '09:00 AM', 25.00, 50, 'Spain', 'Explore the stunning Alhambra Palace, a UNESCO World Heritage site known for its Islamic architecture and beautiful gardens.');
    CALL insertTourInfo('Gettysburg Battlefield', '2023-06-20', '10:30 AM', 15.00, 100, 'USA', 'Visit the Gettysburg Battlefield, a historic Civil War site where the Battle of Gettysburg took place.');
    CALL insertTourInfo('The Louvre Museum', '2023-07-15', '11:00 AM', 30.00, 80, 'France', 'Discover the world-famous Louvre Museum in Paris, home to thousands of art pieces, including the Mona Lisa.');
    CALL insertTourInfo('The Colosseum', '2023-08-05', '10:00 AM', 20.00, 60, 'Italy', 'Step back in time and witness the grandeur of the Colosseum, the ancient Roman amphitheater.');
    CALL insertTourInfo('Machu Picchu', '2023-09-12', '08:30 AM', 40.00, 30, 'Peru', 'Hike to the breathtaking Machu Picchu, an Inca citadel set high in the Andes mountains.');
    CALL insertTourInfo('Hiroshima Peace Memorial', '2023-10-08', '12:00 PM', 12.00, 120, 'Japan', 'Reflect on the history of Hiroshima at the Peace Memorial Park and Museum.');
    CALL insertTourInfo('Versailles Palace', '2023-11-15', '10:30 AM', 27.00, 50, 'France', 'Explore the opulent Palace of Versailles, a symbol of absolute monarchy in France.');
    CALL insertTourInfo('Taj Mahal', '2023-12-20', '09:00 AM', 35.00, 40, 'India', 'Marvel at the iconic Taj Mahal, a UNESCO World Heritage site and a testament to eternal love.');
    CALL insertTourInfo('Great Wall of China', '2024-01-25', '11:00 AM', 18.00, 70, 'China', 'Walk along the historic Great Wall of China, a symbol of ancient defense.');
    CALL insertTourInfo('Pompeii Archaeological Site', '2024-02-18', '10:30 AM', 22.00, 45, 'Italy', 'Witness the preserved ruins of Pompeii, an ancient Roman city destroyed by the eruption of Mount Vesuvius.');
    CALL insertTourInfo('Auschwitz-Birkenau Memorial', '2024-03-10', '10:00 AM', 8.00, 150, 'Poland', 'Pay tribute to the victims of the Holocaust at Auschwitz-Birkenau.');
    CALL insertTourInfo('Chichen Itza', '2024-04-05', '09:30 AM', 30.00, 55, 'Mexico', 'Visit the Mayan ruins of Chichen Itza, a wonder of ancient architecture.');
    CALL insertTourInfo('The Tower of London', '2024-05-15', '11:30 AM', 19.00, 65, 'United Kingdom', 'Explore the Tower of London, a historic castle with a rich and sometimes dark history.');
    CALL insertTourInfo('Pearl Harbor Memorial', '2024-06-21', '12:00 PM', 10.00, 120, 'USA', 'Remember the events of Pearl Harbor at the memorial site in Hawaii.');
    CALL insertTourInfo('Petra, Jordan', '2024-07-10', '08:00 AM', 25.00, 50, 'Jordan', 'Discover the ancient city of Petra, known for its rock-cut architecture and archaeological significance.');

-- Tour Booking Dummy Data
    CALL bookingTour('The Alhambra Palace', 'John Smith');
    CALL bookingTour('Gettysburg Battlefield', 'Maria Lopez');
    CALL bookingTour('The Louvre Museum', 'Ali Hassan');
    CALL bookingTour('The Colosseum', 'Chen Wei');
    CALL bookingTour('Machu Picchu', 'Chen Wei');
    
-- Workshop Info Dummy Data
    CALL insertwrkshopInfo('Introduction to Archaeology', '2023-04-10', '10:00 AM', 50.00, 30, 'USA', 'Learn the basics of archaeological fieldwork and artifact analysis.');
    CALL insertwrkshopInfo('Ancient History Painting', '2023-05-15', '1:00 PM', 40.00, 20, 'Italy', 'Discover the art of recreating ancient historical scenes through painting.');
    CALL insertwrkshopInfo('Digging Up the Past', '2023-06-20', '9:30 AM', 55.00, 25, 'Greece', 'Participate in an excavation project to uncover ancient relics.');
    CALL insertwrkshopInfo('Roman Mosaic Making', '2023-07-05', '11:00 AM', 45.00, 15, 'Spain', 'Create your own Roman-style mosaic art piece.');
    CALL insertwrkshopInfo('Medieval Weaponry Crafting', '2023-08-12', '2:00 PM', 60.00, 10, 'United Kingdom', 'Learn to craft medieval weapons and armor.');
    CALL insertwrkshopInfo('Egyptian Hieroglyphs', '2023-09-18', '10:30 AM', 35.00, 20, 'Egypt', 'Decode the secrets of ancient Egyptian hieroglyphs.');
    CALL insertwrkshopInfo('Fossil Identification', '2023-10-25', '9:00 AM', 25.00, 30, 'Canada', 'Identify and catalog prehistoric fossils.');
    CALL insertwrkshopInfo('Greek Pottery Replication', '2023-11-10', '1:30 PM', 50.00, 15, 'Greece', 'Recreate ancient Greek pottery designs.');
    CALL insertwrkshopInfo('Ancient Architecture Sketching', '2024-02-05', '11:30 AM', 40.00, 25, 'Italy', 'Sketch famous ancient architectural landmarks.');
    CALL insertwrkshopInfo('Mayan Calendar Workshop', '2024-03-18', '10:00 AM', 45.00, 20, 'Mexico', 'Study the Mayan calendar system and its significance.');
    CALL insertwrkshopInfo('Historical Cooking Techniques', '2024-04-12', '2:30 PM', 55.00, 15, 'France', 'Cook and taste historical recipes from different eras.');
    CALL insertwrkshopInfo('Stonehenge Mystery Tour', '2024-05-28', '8:00 AM', 30.00, 40, 'United Kingdom', 'Explore the mysteries of Stonehenge.');
    CALL insertwrkshopInfo('Incan Textile Weaving', '2024-06-15', '10:30 AM', 65.00, 10, 'Peru', 'Learn traditional Incan textile weaving techniques.');
    CALL insertwrkshopInfo('Ancient Shipwrecks and Diving', '2024-07-20', '9:00 AM', 70.00, 12, 'Greece', 'Dive into the world of underwater archaeology.');
    CALL insertwrkshopInfo('Experimental Archaeology', '2024-08-10', '1:00 PM', 50.00, 18, 'Spain', 'Recreate ancient technologies through experimental archaeology.');
    CALL insertwrkshopInfo('Historical Costume Design', '2024-09-05', '11:30 AM', 45.00, 22, 'Italy', 'Design and create historical costumes from different time periods.');
    CALL insertwrkshopInfo('Cave Painting Workshop', '2024-10-15', '10:00 AM', 40.00, 16, 'France', 'Paint like prehistoric humans in a cave painting workshop.');
    CALL insertwrkshopInfo('Bronze Age Metalworking', '2024-11-10', '2:30 PM', 60.00, 8, 'Greece', 'Learn the art of crafting bronze-age metal objects.');
    CALL insertwrkshopInfo('Hieroglyphic Decoding', '2024-12-12', '9:30 AM', 35.00, 25, 'Egypt', 'Decode and translate Egyptian hieroglyphs.');
    CALL insertwrkshopInfo('Virtual Archaeological Tour', '2025-01-20', '11:00 AM', 30.00, 30, 'Worldwide', 'Take a virtual tour of archaeological sites from around the world.');

-- Workshop Booking Dummy Data
    CALL bookingWrk('Introduction to Archaeology', 'John Smith');
    CALL bookingWrk('Ancient History Painting', 'Alice Johnson');
    CALL bookingWrk('Digging Up the Past', 'Michael Brown');
    CALL bookingWrk('Roman Mosaic Making', 'Emily Lee');
    CALL bookingWrk('Medieval Weaponry Crafting', 'Robert Garcia');

-- Lecture Info Dummy Data
    CALL insertLectureInfo('The Silk Road: Ancient Trade Routes', 'Dr. Elizabeth Adams', '2023-03-15', '7:00', 20.00, 'Join Dr. Elizabeth Adams as she unravels the history of the Silk Road, one of the worlds most influential trade networks.');
    CALL insertLectureInfo('The Aztec Empire: Rise and Fall', 'Prof. Jonathan Miller', '2023-04-20', '6:30 PM', 15.00, 'Prof. Jonathan Miller discusses the rise and fall of the Aztec Empire, exploring its cultural and historical significance.');
    CALL insertLectureInfo('Exploring Ancient Egypt: Mysteries of the Nile', 'Dr. Victoria White', '2023-05-25', '7:30 PM', 25.00, 'Dr. Victoria White takes you on a journey to explore the mysteries of ancient Egypt and its fascinating civilization.');
    CALL insertLectureInfo('The Crusades: Holy Wars and Their Legacy', 'Prof. Charles Robinson', '2023-06-10', '6:00 PM', 18.00, 'Prof. Charles Robinson delves into the history of the Crusades, examining their impact on religion, culture, and diplomacy.');
    CALL insertLectureInfo('The Ming Dynasty: Chinas Golden Age', 'Dr. Sophia Turner', '2023-07-12', '7:15 PM', 22.00, 'Dr. Sophia Turner discusses the Ming Dynasty, a period of Chinese history known for its cultural achievements and innovations.');
    CALL insertLectureInfo('The Russian Revolution: A Century of Change', 'Prof. William Mitchell', '2023-08-18', '6:45 PM', 17.00, 'Prof. William Mitchell explores the Russian Revolution and its profound impact on Russia and the world.');
    CALL insertLectureInfo('The Age of Napoleon: Emperor and Reformer', 'Dr. Amelia Parker', '2023-09-05', '7:00 PM', 20.00, 'Dr. Amelia Parker examines the life and legacy of Napoleon Bonaparte, one of historys most iconic figures.');
    CALL insertLectureInfo('Ancient Greece: Birthplace of Democracy', 'Prof. Alexander Harris', '2023-10-14', '6:30 PM', 15.00, 'Prof. Alexander Harris uncovers the birthplace of democracy in ancient Greece and its influence on modern political systems.');
    CALL insertLectureInfo('The Vikings: Raiders and Traders', 'Dr. Emma Peterson', '2023-11-20', '7:30 PM', 25.00, 'Dr. Emma Peterson explores the world of the Vikings, known for their seafaring and cultural impact.');
    CALL insertLectureInfo('The Inca Empire: Masters of the Andes', 'Prof. Benjamin Lewis', '2023-12-10', '6:00 PM', 18.00, 'Prof. Benjamin Lewis provides insights into the Inca Empires remarkable achievements in architecture and governance.');

-- Lecture Booking Dummy Data
    CALL bookingLecture('The Silk Road: Ancient Trade Routes', 'John Smith');
    CALL bookingLecture('The Aztec Empire: Rise and Fall', 'Alice Johnson');
    CALL bookingLecture('Exploring Ancient Egypt: Mysteries of the Nile', 'Michael Brown');
    CALL bookingLecture('The Crusades: Holy Wars and Their Legacy', 'Emily Lee');
    CALL bookingLecture('The Ming Dynasty: Chinas Golden Age', 'Robert Garcia');

-- Subscription Info Dummy Data
    CALL subscriptionInfo('Ancient Civilizations', 101, 12.99);
    CALL subscriptionInfo('Medieval Times',102 , 14.50);
    CALL subscriptionInfo('World History Highlights',103 , 13.75);
    CALL subscriptionInfo('Historical Insights',104 , 15.00);
    CALL subscriptionInfo('Revolutionary Wars',105 , 12.99);
    CALL subscriptionInfo('Ancient Mysteries',106 , 14.50);
    CALL subscriptionInfo('Rise of Empires',107 , 13.75);
    CALL subscriptionInfo('Archaeology Unearthed',108 , 15.00);
    CALL subscriptionInfo('Modern History Review',109, 12.99);
    CALL subscriptionInfo('Colonial America',110 , 14.50);
    CALL subscriptionInfo('The Renaissance Era',111 , 13.75);
    CALL subscriptionInfo('World War Chronicles',112 , 15.00);
    CALL subscriptionInfo('Exploring Ancient Wonders',113 , 12.99);
    CALL subscriptionInfo('The Age of Discovery',114 , 14.50);
    CALL subscriptionInfo('Intrigues of History',115 , 13.75);
    CALL subscriptionInfo('Empires of the Past',116 , 15.00);
    CALL subscriptionInfo('Mysteries of Antiquity',117 , 12.99);
    CALL subscriptionInfo('Medieval Kingdoms',118 , 14.50);
    CALL subscriptionInfo('World History Odyssey',119 , 13.75);
    CALL subscriptionInfo('Historical Pioneers',120 , 15.00);
    CALL subscriptionInfo('Civilization Chronicles',121 , 12.99);
    CALL subscriptionInfo('Revolutionary Leaders',122 , 14.50);
    CALL subscriptionInfo('Ancient Artifacts',123 , 13.75);
    CALL subscriptionInfo('Legacy of Empires',124 , 15.00);
    CALL subscriptionInfo('Warfare Through Time',125 , 12.99);
    CALL subscriptionInfo('Timeless Treasures',126 , 14.50);
    CALL subscriptionInfo('Historical Explorations',127 , 13.75);
    CALL subscriptionInfo('Lost Civilizations',127 , 15.00);
    CALL subscriptionInfo('Historys Greatest Battles',128 , 12.99);
    CALL subscriptionInfo('Ancient Rulers',129 , 14.50);
    CALL subscriptionInfo('Journey Through the Ages',130, 13.75);
    CALL subscriptionInfo('Emerging Nations',131, 15.00);

-- Subscription Order Dummy Data
    CALL orderSubscription(115,'Physical', 'John Smith');
    CALL orderSubscription(129,'Digital', 'Alice Johnson');
    CALL orderSubscription(111,'Physical', 'Michael Brown');
    CALL orderSubscription(123,'Digital', 'Emily Lee');
    CALL orderSubscription(126,'Physical', 'Robert Garcia');


