-- Creating the database
DROP DATABASE IF EXISTS stepintohistoryv2;
CREATE DATABASE IF NOT EXISTS stepintohistoryv2;
USE stepintohistoryv2;

------ Customer Related ------
 
CREATE TABLE titles (
    titleID int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    PRIMARY KEY (titleID)
);

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
    title int(11) NOT NULL,
    name varchar(100) NOT NULL,
    address int(11) NOT NULL,
    number int(11) NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (customerID),
    FOREIGN KEY (title) REFERENCES titles(titleID),
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

------- Books and Docs Related ----

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


--- Product / Serices Related ---

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

CREATE TABLE devivery (
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
    FOREIGN KEY (delivery) REFERENCES devivery(deliveryID)
);

CREATE TABLE Orders (
    orderID int NOT NULL AUTO_INCREMENT,
    productType int(11) NOT NULL,
    productOrder int(11) NOT NULL,
    orderDate date NOT NULL,
    customerID int(11) NOT NULL,
    PRIMARY KEY (orderID),
    FOREIGN KEY (productType) REFERENCES products(productID),
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (productOrder) REFERENCES dna(dnaID),
    FOREIGN KEY (productOrder) REFERENCES familyTree(familyTreeID),
    FOREIGN KEY (productOrder) REFERENCES tour(tourID),
    FOREIGN KEY (productOrder) REFERENCES workshopandcourse(workshopID),
    FOREIGN KEY (productOrder) REFERENCES lecture(lectureID)  
);

--- INSERT STATMENTS ---
INSERT INTO accsesType (accsesTypeID, accsesType) VALUES (1, 'In-Person');
INSERT INTO accsesType (accsesTypeID, accsesType) VALUES (2, 'Remote');
INSERT INTO products (productName) VALUES ('DNA Testing');
INSERT INTO products (productName) VALUES ('Family Tree');
INSERT INTO products (productName) VALUES ('Guided Tour');
INSERT INTO products (productName) VALUES ('Workshop & Course');
INSERT INTO products (productName) VALUES ('Lectures');
INSERT INTO products (productName) VALUES ('Subscription');
INSERT INTO devivery (deliveryType) VALUES ('Phyiscal');
INSERT INTO devivery (deliveryType) VALUES ('Digital');


---- Create Procedures for Data Insertion ----

-- Cusomter Procedure
DELIMITER //
CREATE PROCEDURE insertCustomerInfo(titleType VARCHAR(15), name VARCHAR(50), address VARCHAR(50), city VARCHAR(50), country VARCHAR(50), postcode VARCHAR(10), contactNumber VARCHAR(50), email VARCHAR(50))
BEGIN
    IF (SELECT COUNT(country) FROM country WHERE countryName = country) = 0 THEN
        INSERT INTO country (countryName) VALUES (country);
    END IF;
    IF (SELECT COUNT(city) FROM city WHERE cityName = city) = 0 THEN
        INSERT INTO city (cityName) VALUES (city);
    END IF;
    IF (SELECT COUNT(titles) FROM titles WHERE title = titleType) = 0 THEN
        INSERT INTO titles (title) VALUES (titleType);
    END IF;
    INSERT INTO address (addressLine, city, country, postcode) VALUES (address, (SELECT cityID FROM city WHERE city = cityName), (SELECT countryID FROM country WHERE countryName = country), postcode);
    INSERT INTO customer (title, name, address, number, email) VALUES ((SELECT titleID FROM titles WHERE titleType = title), name, LAST_INSERT_ID(), contactNumber, email);
END
//
DELIMITER ;

-- Book Procedure
    DELIMITER //
    CREATE PROCEDURE insertBookInfo(title VARCHAR(50), author VARCHAR(50), publisher VARCHAR(50), genre VARCHAR(50), description VARCHAR(50), year int(4), price DECIMAL(10,2))
    BEGIN
        -- Check if the Author already exist in the database
        IF (SELECT COUNT(authorName) FROM author WHERE authorName = author) = 0 THEN
            INSERT INTO author (authorName) VALUES (author);
        END IF;

        -- Check if the Publisher already exist in the database
        IF (SELECT COUNT(publisherName) FROM publisher WHERE publisherName = publisher) = 0 THEN
            INSERT INTO publisher (publisherName) VALUES (publisher);
        END IF;

        -- Check if the Genre already exist in the database
        IF (SELECT COUNT(genreName) FROM genres WHERE genreName = genre) = 0 THEN
            INSERT INTO genres (genreName) VALUES (genre);
        END IF;
        
        -- Insert the book into the database
        INSERT INTO book (title, author, publisher, genre, description, year, price) VALUES (title, (SELECT authorID FROM author WHERE authorName = author), (SELECT publisherID FROM publisher WHERE publisherName = publisher), (SELECT genreID FROM genres WHERE genreName = genre), description, year, price);
     
        -- Insert the book into the library
        INSERT INTO library (book) VALUES (LAST_INSERT_ID());
    End
    //
    DELIMITER ;

-- Document Procedure
    DELIMITER //
    CREATE PROCEDURE insertDocInfo(title VARCHAR(50), author VARCHAR(50), description VARCHAR(50), year INT(4))
    BEGIN
        -- Check if the Author already exist in the database
        IF (SELECT COUNT(authorName) FROM author WHERE authorName = author) = 0 THEN
            INSERT INTO author (authorName) VALUES (author);
        END IF;
        -- Insert the document into the database
        INSERT INTO document (title, author, description, year) VALUES (title, (SELECT authorID         FROM author WHERE authorName = author), description, year);

        -- Insert the document into the library
        INSERT INTO library (document) VALUES (LAST_INSERT_ID());
    End
    //
    DELIMITER ;

-- DNA Procedure
    DELIMITER //
    CREATE PROCEDURE bookingDNA(CustomerName VARCHAR (50), datebooking DATE, serviceaccses VARCHAR(10), cost DECIMAL(10,2))
    BEGIN

        insert into dna (date, price, serviceAccess) values (datebooking, cost, (select accsesTypeID from accsesType where accsesType = serviceaccses));

        insert into orders (productType, ProdcutOrderID, customerID) values ((select productID from products where productName = 'DNA Testing'), LAST_INSERT_ID(), (select customerID from customer where name = CustomerName));
    END
    //
    DELIMITER ;

-- Family Tree Procedure
    DELIMITER //
    CREATE PROCEDURE bookingTree(CustomerName VARCHAR (50), datebooking DATE, serviceaccses VARCHAR(10), cost DECIMAL(10,2))
    BEGIN

        insert into familyTree (date, price, serviceAccess) values (datebooking, cost, (select accsesTypeID from accsesType where accsesType = serviceaccses));

        insert into orders (productType, ProdcutOrderID, orderDate, customerID) values ((select productID from products where productName = 'Family Tree'), LAST_INSERT_ID(), datebooking, (select customerID from customer where name = CustomerName));
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

        insert into TourBooking (tour) values ((SELECT tourID WHERE tour = tourOption));

        insert into orders (productType, ProdcutOrderID, customerID) values ((select productID from products where productName = 'Guided Tour'), LAST_INSERT_ID(), (select customerID from customer where name = CustomerName));
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

        insert into workshopBooking (workshop) values (wrkOption);

        insert into orders (productType, ProdcutOrderID, customerID) values ((select productID from products where productName = 'Workshop & Course'), LAST_INSERT_ID(), (select customerID from customer where name = CustomerName));
    END
    //
    DELIMITER ;

-- Lecture Procedure
    DELIMITER //
    CREATE PROCEDURE insertLectureInfo( lectitle VARCHAR(50), speaker varchar(50) , lecdate DATE, lectime TIME, cost DECIMAL(10,2), description VARCHAR(255))
    BEGIN
        -- Check if the country already exist in the database
        IF (SELECT COUNT(country) FROM country WHERE countryName = country) = 0 THEN
            INSERT INTO country (countryName) VALUES (country);
        END IF;

        -- Check if the speaker already exist in the database
        IF (SELECT COUNT(speakerName) FROM speaker WHERE speakerName = speaker) = 0 THEN
            INSERT INTO speaker (speakerName) VALUES (speaker);
        END IF;

        -- Insert the tour into the database
        INSERT INTO lecture (title, speaker ,date, time, price, capacity, location, description) VALUES (lectitle, (SELECT speakerID FROM speaker WHERE speaker = speakerName) ,lecdate, lectime, cost,description);
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
    CREATE PROCEDURE orderSubscription(version int(11), deviverytype VARCHAR(25)), Name VARCHAR(50))
    BEGIN
        insert into subscriptionOrder (subscription, delivery) values (version, (select deliveryID from devivery where deliveryType = deviverytype));

        insert into orders (productType, ProdcutOrderID, customerID) values ((select productID from products where productName = 'Subscription'), LAST_INSERT_ID(), (select customerID from customer where name = Name));
    END
    //
    DELIMITER ;

--- Inserting of Dummy Data ---

-- Book Dummy Data
    CALL insertBookInfo('The Guns of August', 'Barbara W. Tuchman', 'Macmillan', 'History', 'A detailed analysis of the events leading to World War I', 1962, 18.99);
    CALL insertBookInfo('A People’s History of the United States', 'Howard Zinn', 'Harper & Row', 'American History', 'A critical look at U.S. history from the perspective of marginalized groups', 1980, 19.99);
    CALL insertBookInfo('The Second World War', 'Sir Winston Churchill', 'Houghton Mifflin', 'World War II History', 'A firsthand account of the events during World War II', 1948, 22.99);
    CALL insertBookInfo('The Rise and Fall of the Third Reich', 'William L. Shirer', 'Simon & Schuster', 'World War II History', 'A comprehensive history of Nazi Germany', 1960, 21.99);
    CALL insertBookInfo('The Wright Brothers', 'David McCullough', 'Simon & Schuster', 'Aviation History', 'The story of the inventors of the first successful airplane', 2015, 20.99);
    CALL insertBookInfo('The Guns, 1914-1916', 'Ian Hogg', 'Greenhill Books', 'World War I History', 'An examination of artillery during World War I', 1998, 17.99);
    CALL insertBookInfo('The Box: How the Shipping Container Made the World Smaller and the World Economy Bigger', 'Marc Levinson', 'Princeton University Press', 'Economic History', 'The impact of shipping containers on global trade', 2006, 18.99);
    CALL insertBookInfo('Genghis Khan and the Making of the Modern World', 'Jack Weatherford', 'Crown Publishers', 'Mongol Empire History', 'The influence of Genghis Khan on world history', 2004, 19.99);
    CALL insertBookInfo('The Wright Brothers', 'Tom D. Crouch', 'W.W. Norton & Company', 'Aviation History', 'A biography of the pioneering aviators', 2003, 17.99);
    CALL insertBookInfo('The Silk Roads: A New History of the World', 'Peter Frankopan', 'Bloomsbury Publishing', 'World History', 'A reexamination of world history through the lens of the Silk Road', 2015, 21.99);
    CALL insertBookInfo('Einstein: His Life and Universe', 'Walter Isaacson', 'Simon & Schuster', 'Biography', 'A biography of the renowned physicist Albert Einstein', 2007, 20.99);
    CALL insertBookInfo('Citizens: A Chronicle of the French Revolution', 'Simon Schama', 'Penguin Books', 'French Revolution History', 'A comprehensive history of the French Revolution', 1989, 18.99);
    CALL insertBookInfo('The Warmth of Other Suns', 'Isabel Wilkerson', 'Random House', 'African American History', 'The Great Migration and its impact on America', 2010, 22.99);
    CALL insertBookInfo('The Wright Brothers', 'James Tobin', 'Henry Holt and Co.', 'Aviation History', 'A biography of the pioneering aviators', 2003, 19.99);
    CALL insertBookInfo('The Emperor of All Maladies: A Biography of Cancer', 'Siddhartha Mukherjee', 'Scribner', 'Medical History', 'The history of cancer and its treatment', 2010, 21.99);
    CALL insertBookInfo('The Devil in the White City', 'Erik Larson', 'Crown Publishers', 'American History', 'A tale of architecture and serial murder at the 1893 Worlds Fair', 2003, 18.99);
    CALL insertBookInfo('King Leopolds Ghost', 'Adam Hochschild', 'Houghton Mifflin', 'Colonial History', 'The exploitation of the Congo under King Leopold II', 1998, 19.99);
    CALL insertBookInfo('The Prize: The Epic Quest for Oil, Money, and Power', 'Daniel Yergin', 'Free Press', 'Economic History', 'The history of the oil industry and its impact on geopolitics', 1991, 22.99);
    CALL insertBookInfo('Destiny of the Republic: A Tale of Madness, Medicine, and the Murder of a President', 'Candice Millard', 'Doubleday', 'American History', 'The assassination of President James A. Garfield', 2011, 20.99);
    CALL insertBookInfo('The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', 'Crown Publishing', 'Medical History', 'The story of Henrietta Lacks and the HeLa cell line', 2010, 21.99);
    CALL insertBookInfo('A Brief History of Time', 'Stephen Hawking', 'Bantam Books', 'Cosmology', 'A popular science book on the universe and black holes', 1988, 17.99);
    CALL insertBookInfo('In the Garden of Beasts', 'Erik Larson', 'Crown Publishers', 'American History', 'The experiences of the American ambassador to Nazi Germany', 2011, 19.99);
    CALL insertBookInfo('The Wright Brothers', 'Fred C. Kelly', 'Dover Publications', 'Aviation History', 'A biography of the pioneering aviators', 1943, 16.99);
    CALL insertBookInfo('The History of the Decline and Fall of the Roman Empire', 'Edward Gibbon', 'Various Publishers', 'Ancient History', 'A classic work on the fall of the Roman Empire', 1776, 12.99);
    CALL insertBookInfo('The Wright Brothers', 'Peter Reese', 'The History Press', 'Aviation History', 'A biography of the pioneering aviators', 2015, 17.99);
    CALL insertBookInfo('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Harper', 'Human History', 'A look at the history of Homo sapiens', 2014, 21.99);
    CALL insertBookInfo('The History of Love', 'Nicole Krauss', 'W.W. Norton & Company', 'Historical Fiction', 'A novel intertwining multiple love stories across time', 2005, 16.99);
    CALL insertBookInfo('The Path Between the Seas: The Creation of the Panama Canal, 1870-1914', 'David McCullough', 'Simon & Schuster', 'Engineering History', 'The story of building the Panama Canal', 1977, 20.99);
    CALL insertBookInfo('The Wright Brothers', 'Wilbur Wright', 'Dover Publications', 'Aviation History', 'The story of the inventors of the first successful airplane', 1917, 14.99);
    CALL insertBookInfo('A History of the World in 10½ Chapters', 'Julian Barnes', 'Jonathan Cape', 'World History', 'A unique take on world history through various narratives', 1989, 15.99);
    CALL insertBookInfo('The Heart of the Sea: The Tragedy of the Whaleship Essex', 'Nathaniel Philbrick', 'Viking', 'Maritime History', 'The harrowing true story that inspired "Moby-Dick"', 2000, 18.99);
    CALL insertBookInfo('The Wright Brothers', 'Lewis Helfand', 'Campfire', 'Graphic Novel', 'A graphic novel adaptation of the Wright brothers story', 2013, 13.99);
    CALL insertBookInfo('The Wright Brothers', 'Alex Woolf', 'Raintree', 'Aviation History', 'A biography of the pioneering aviators', 2014, 16.99);
    CALL insertBookInfo('The Wright Brothers', 'George E. Chalou', 'The Wright Memorial Foundation', 'Aviation History', 'A biography of the pioneering aviators', 2003, 17.99);
    CALL insertBookInfo('The Wright Brothers', 'Charles River Editors', 'CreateSpace Independent Publishing Platform', 'Aviation History', 'A concise history of the Wright brothers achievements', 2015, 14.99);

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
    CALL insertDocInfo('The Geneva Conventions', 'International Committee of the Red Cross', 'A set of international treaties that govern the treatment of wounded and sick combatants, prisoners of war, and civilians in wartime', Various);
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
        CALL insertCustomerInfo('Mr', 'John Smith', '123 Main St', 'New York', 'USA', '10001', '+1 (123) 456-7890', 'john.smith@gmail.com');
    CALL insertCustomerInfo('Ms', 'Emily Johnson', '456 Elm St', 'Los Angeles', 'USA', '90001', '+1 (987) 654-3210', 'emily.johnson@yahoo.com');
    CALL insertCustomerInfo('Dr', 'Michael Brown', '789 Oak St', 'London', 'United Kingdom', 'SW1A 1AA', '+44 20 1234 5678', 'michael.brown@hotmail.com');
    CALL insertCustomerInfo('Mrs', 'Sarah Davis', '101 Pine St', 'Toronto', 'Canada', 'M5V 2T6', '+1 (416) 555-1234', 'sarah.davis@outlook.com');
    CALL insertCustomerInfo('Mr', 'David Lee', '234 Cedar St', 'Sydney', 'Australia', '2000', '+61 2 9876 5432', 'david.lee@mail.com');
    CALL insertCustomerInfo('Ms', 'Maria Rodriguez', '567 Birch St', 'Madrid', 'Spain', '28001', '+34 91 123 45 67', 'maria.rodriguez@icloud.com');
    CALL insertCustomerInfo('Dr', 'Hans Müller', '890 Maple St', 'Berlin', 'Germany', '10115', '+49 30 987654321', 'hans.mueller@web.de');
    CALL insertCustomerInfo('Mr', 'Yuki Tanaka', '543 Redwood St', 'Tokyo', 'Japan', '100-0004', '+81 3 1234 5678', 'yuki.tanaka@softbank.ne.jp');
    CALL insertCustomerInfo('Mrs', 'Giovanni Rossi', '654 Walnut St', 'Rome', 'Italy', '00118', '+39 06 1234 5678', 'giovanni.rossi@libero.it');
    CALL insertCustomerInfo('Ms', 'Sophie Dupont', '321 Willow St', 'Paris', 'France', '75001', '+33 1 23 45 67 89', 'sophie.dupont@orange.fr');
    CALL insertCustomerInfo('Dr', 'Carlos Fernandez', '876 Acacia St', 'Buenos Aires', 'Argentina', 'C1002AAC', '+54 11 1234-5678', 'carlos.fernandez@fibertel.com.ar');
    CALL insertCustomerInfo('Mr', 'Mohamed Ali', '111 Poplar St', 'Cairo', 'Egypt', '11511', '+20 2 1234 5678', 'mohamed.ali@link.net');
    CALL insertCustomerInfo('Mrs', 'Marta Kowalski', '222 Elm St', 'Warsaw', 'Poland', '00-001', '+48 22 123 45 67', 'marta.kowalski@wp.pl');
    CALL insertCustomerInfo('Ms', 'Juan Lopez', '333 Oak St', 'Mexico City', 'Mexico', '06500', '+52 55 1234 5678', 'juan.lopez@prodigy.net.mx');
    CALL insertCustomerInfo('Dr', 'Chen Wei', '444 Pine St', 'Shanghai', 'China', '200000', '+86 21 1234 5678', 'chen.wei@qq.com');
    CALL insertCustomerInfo('Mr', 'Ivan Petrov', '555 Cedar St', 'Moscow', 'Russia', '101000', '+7 495 123-45-67', 'ivan.petrov@mail.ru');
    CALL insertCustomerInfo('Mrs', 'Sara Silva', '666 Redwood St', 'Sao Paulo', 'Brazil', '01323-000', '+55 11 1234-5678', 'sara.silva@terra.com.br');
    CALL insertCustomerInfo('Ms', 'Muhammad Khan', '777 Birch St', 'Karachi', 'Pakistan', '75500', '+92 21 12345678', 'muhammad.khan@hotmail.com.pk');
    CALL insertCustomerInfo('Dr', 'Ali Hassan', '888 Willow St', 'Cairo', 'Egypt', '11511', '+20 2 1234 5678', 'ali.hassan@tedata.net.eg');
    CALL insertCustomerInfo('Mr', 'Maria Lopez', '999 Maple St', 'Buenos Aires', 'Argentina', 'C1002AAC', '+54 11 1234-5678', 'maria.lopez@fibertel.com.ar');
    CALL insertCustomerInfo('Mrs', 'Jiro Tanaka', '100 Acacia St', 'Tokyo', 'Japan', '100-0004', '+81 3 1234 5678', 'jiro.tanaka@docomo.ne.jp');
    CALL insertCustomerInfo('Ms', 'Sophie Dupuis', '111 Poplar St', 'Paris', 'France', '75001', '+33 1 23 45 67 89', 'sophie.dupuis@laposte.net');
    CALL insertCustomerInfo('Dr', 'Carlos Rodriguez', '222 Elm St', 'Madrid', 'Spain', '28001', '+34 91 123 45 67', 'carlos.rodriguez@telefonica.es');
    CALL insertCustomerInfo('Mr', 'Giovanni Rossi', '333 Oak St', 'Rome', 'Italy', '00118', '+39 06 1234 5678', 'giovanni.rossi@fastweb.it');
    CALL insertCustomerInfo('Mrs', 'Hans Müller', '444 Pine St', 'Berlin', 'Germany', '10115', '+49 30 987654321', 'hans.mueller@t-online.de');
    CALL insertCustomerInfo('Ms', 'Maria Lopez', '555 Cedar St', 'Buenos Aires', 'Argentina', 'C1002AAC', '+54 11 1234-5678', 'maria.lopez@arnet.com.ar');
    CALL insertCustomerInfo('Dr', 'Chen Wei', '666 Redwood St', 'Shanghai', 'China', '200000', '+86 21 1234 5678', 'chen.wei@163.com');
    CALL insertCustomerInfo('Mr', 'Ivan Petrov', '777 Birch St', 'Moscow', 'Russia', '101000', '+7 495 123-45-67', 'ivan.petrov@mail.ru');
    CALL insertCustomerInfo('Mrs', 'Sara Silva', '888 Willow St', 'Sao Paulo', 'Brazil', '01323-000', '+55 11 1234-5678', 'sara.silva@terra.com.br');
    CALL insertCustomerInfo('Ms', 'Muhammad Khan', '999 Maple St', 'Karachi', 'Pakistan', '75500', '+92 21 12345678', 'muhammad.khan@hotmail');

-- DNA Dummy Data
    CALL bookingDNA('John Smith', '2023-02-15', 'In-Person');
    CALL bookingDNA('Alice Johnson', '2023-05-28', 'Remote');
    CALL bookingDNA('Michael Brown', '2023-10-29', 'In-Person');
    CALL bookingDNA('Emily Lee', '2023-01-07', 'Remote');
    CALL bookingDNA('Robert Garcia', '2023-01-07', 'In-Person');

-- Family Tree Dummy Data
    CALL bookingDNA('William Davis', '2023-02-15', 'In-Person');
    CALL bookingDNA('Sofia Rodriguez', '2023-05-28', 'Remote');
    CALL bookingDNA('Ethan Martinez', '2023-10-29', 'In-Person');
    CALL bookingDNA('Olivia Anderson', '2023-01-07', 'Remote');
    CALL bookingDNA('Daniel Turner', '2023-01-07', 'In-Person');

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
    CALL bookingTour('Gettysburg Battlefield', 'Alice Johnson');
    CALL bookingTour('The Louvre Museum', 'Michael Brown');
    CALL bookingTour('The Colosseum', 'Emily Lee');
    CALL bookingTour('Machu Picchu', 'Robert Garcia');
    
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
    CALL insertLectureInfo('The Silk Road: Ancient Trade Routes', 'Dr. Elizabeth Adams', '2023-03-15', '7:00 PM', 20.00, 'Join Dr. Elizabeth Adams as she unravels the history of the Silk Road, one of the worlds most influential trade networks.');
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


