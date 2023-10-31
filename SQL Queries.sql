-- Set All Tables Auto_intrement to start back at 1
ALTER TABLE account AUTO_INCREMENT =1;
ALTER TABLE address AUTO_INCREMENT =1;
ALTER TABLE author AUTO_INCREMENT =1;
ALTER TABLE book AUTO_INCREMENT =1;
ALTER TABLE countries AUTO_INCREMENT =1;
ALTER TABLE customer AUTO_INCREMENT =1;
ALTER TABLE dnatesting AUTO_INCREMENT =1;
ALTER TABLE document AUTO_INCREMENT =1;
ALTER TABLE familytree AUTO_INCREMENT =1;
ALTER TABLE genre AUTO_INCREMENT =1;


--- Counrties Table ---

-- Adding Countries to the Database 
INSERT INTO countries (countryname) VALUES ('United Kingdom');
INSERT INTO countries (countryname) VALUES ('United States');
INSERT INTO countries (countryname) VALUES ('Canada');
INSERT INTO countries (countryname) VALUES ('Australia');
INSERT INTO countries (countryname) VALUES ('France');
INSERT INTO countries (countryname) VALUES ('Germany');
INSERT INTO countries (countryname) VALUES ('Japan');
INSERT INTO countries (countryname) VALUES ('China');
INSERT INTO countries (countryname) VALUES ('Brazil');
INSERT INTO countries (countryname) VALUES ('Russia');
INSERT INTO countries (countryname) VALUES ('India');
INSERT INTO countries (countryname) VALUES ('South Africa');
INSERT INTO countries (countryname) VALUES ('United Arab Emirates');
INSERT INTO countries (countryname) VALUES ('Mexico');
INSERT INTO countries (countryname) VALUES ('South Korea');
INSERT INTO countries (countryname) VALUES ('Italy');
INSERT INTO countries (countryname) VALUES ('Singapore');
INSERT INTO countries (countryname) VALUES ('Spain');
INSERT INTO countries (countryname) VALUES ('Netherlands');
INSERT INTO countries (countryname) VALUES ('Sweden');
INSERT INTO countries (countryname) VALUES ('Switzerland');
INSERT INTO countries (countryname) VALUES ('Portugal');
INSERT INTO countries (countryname) VALUES ('Norway');
INSERT INTO countries (countryname) VALUES ('Denmark');
INSERT INTO countries (countryname) VALUES ('Finland');
INSERT INTO countries (countryname) VALUES ('Ireland');
INSERT INTO countries (countryname) VALUES ('New Zealand');
INSERT INTO countries (countryname) VALUES ('Greece');


--- Customers ---

-- Create Proceude to adding in new customers
DELIMITER //
CREATE PROCEDURE insertCustomerInfo(name VARCHAR(50), addressline VARCHAR(50), city VARCHAR(50), country VARCHAR(50), postcode VARCHAR(10),contactNumber VARCHAR(50),email VARCHAR(50))
BEGIN
    INSERT INTO address (addressline, city, country, postcode) VALUES (addressline, city, (SELECT country_id FROM countries WHERE countryname = country), postcode);
    INSERT INTO customer (name, address, contactNumber, email) VALUES (name, LAST_INSERT_ID(), contactNumber, email);
End
//
DELIMITER ;

-- Insering Dummy Data into the Database
CALL insertCustomerInfo('John Doe', '123 Main St', 'New York', 'United States', '10001', '+1 555-123-4567', 'john.doe@gmail.com');
CALL insertCustomerInfo('Alice Smith', '456 Elm Ave', 'Los Angeles', 'United States', '90001', '+1 555-987-6543', 'alice.smith@yahoo.com');
CALL insertCustomerInfo('Robert Johnson', '789 Oak Rd', 'Chicago', 'United States', '60601', '+1 555-567-8901', 'robert.johnson@hotmail.com');
CALL insertCustomerInfo('Emily Brown', '321 Pine Ln', 'London', 'United Kingdom', 'SW1A 1AA', '+44 20 1234 5678', 'emily.brown@outlook.com');
CALL insertCustomerInfo('Michael Wilson', '654 Birch St', 'Toronto', 'Canada', 'M5H 2N2', '+1 416-555-7890', 'michael.wilson@gmail.com');
CALL insertCustomerInfo('Sara Miller', '987 Cedar Ave', 'Sydney', 'Australia', '2000', '+61 2 8765 4321', 'sara.miller@yahoo.com.au');
CALL insertCustomerInfo('James Lee', '555 Oak Rd', 'San Francisco', 'United States', '94105', '+1 415-555-1234', 'james.lee@hotmail.com');
CALL insertCustomerInfo('Emma Davis', '456 Elm Ln', 'Paris', 'France', '75001', '+33 1 2345 6789', 'emma.davis@outlook.fr');
CALL insertCustomerInfo('William Garcia', '123 Main St', 'Madrid', 'Spain', '28001', '+34 91 555 7890', 'william.garcia@gmail.com');
CALL insertCustomerInfo('Olivia Hernandez', '987 Maple Rd', 'Berlin', 'Germany', '10115', '+49 30 5555 4321', 'olivia.hernandez@yahoo.de');
CALL insertCustomerInfo('Ethan Lopez', '654 Pine Ave', 'Tokyo', 'Japan', '100-0006', '+81 3 1234 5678', 'ethan.lopez@hotmail.co.jp');
CALL insertCustomerInfo('Ava Martinez', '789 Oak St', 'Beijing', 'China', '100005', '+86 10 5555 6789', 'ava.martinez@gmail.com.cn');
CALL insertCustomerInfo('Liam Gonzalez', '321 Cedar Ln', 'Rio de Janeiro', 'Brazil', '20040-008', '+55 21 555-4321', 'liam.gonzalez@yahoo.com.br');
CALL insertCustomerInfo('Sophia Rodriguez', '555 Maple Rd', 'Cape Town', 'South Africa', '8001', '+27 21 555 1234', 'sophia.rodriguez@hotmail.co.za');
CALL insertCustomerInfo('Mason Wilson', '123 Birch St', 'Sydney', 'Australia', '2000', '+61 2 8765 4321', 'mason.wilson@gmail.com.au');
CALL insertCustomerInfo('Isabella Harris', '456 Elm Ave', 'Paris', 'France', '75001', '+33 1 2345 6789', 'isabella.harris@outlook.fr');
CALL insertCustomerInfo('Noah Clark', '789 Cedar Rd', 'Madrid', 'Spain', '28001', '+34 91 555 7890', 'noah.clark@yahoo.es');
CALL insertCustomerInfo('Sophia Young', '321 Pine Ln', 'Toronto', 'Canada', 'M5H 2N2', '+1 416-555-7890', 'sophia.young@hotmail.com');
CALL insertCustomerInfo('Liam Hall', '987 Oak St', 'New York', 'United States', '10001', '+1 555-123-4567', 'liam.hall@gmail.com');
CALL insertCustomerInfo('Ava Scott', '555 Birch Ave', 'London', 'United Kingdom', 'SW1A 1AA', '+44 20 1234 5678', 'ava.scott@yahoo.co.uk');
CALL insertCustomerInfo('Daniel Larson', '234 Pine St', 'Stockholm', 'Sweden', '111 22', '+46 8 1234 5678', 'daniel.larson@gmail.com');
CALL insertCustomerInfo('Ella Perez', '789 Cedar Ave', 'Mexico City', 'Mexico', '11560', '+52 55 5555 4321', 'ella.perez@yahoo.com.mx');
CALL insertCustomerInfo('Logan Gupta', '987 Elm Rd', 'Mumbai', 'India', '400001', '+91 22 5555 6789', 'logan.gupta@hotmail.co.in');
CALL insertCustomerInfo('Sophia Chen', '555 Oak Ln', 'Shanghai', 'China', '200001', '+86 21 5555 1234', 'sophia.chen@gmail.com.cn');
CALL insertCustomerInfo('Ethan Smith', '123 Birch Ave', 'Brisbane', 'Australia', '4000', '+61 7 8765 4321', 'ethan.smith@yahoo.com.au');
CALL insertCustomerInfo('Olivia Kim', '321 Maple Rd', 'Seoul', 'South Korea', '04515', '+82 2 555-7890', 'olivia.kim@hotmail.co.kr');
CALL insertCustomerInfo('William Jansen', '654 Cedar St', 'Amsterdam', 'Netherlands', '1012 SL', '+31 20 555 1234', 'william.jansen@outlook.nl');
CALL insertCustomerInfo('Mia Andersson', '456 Pine Ave', 'Stockholm', 'Sweden', '111 22', '+46 8 1234 5678', 'mia.andersson@gmail.com');
CALL insertCustomerInfo('Liam Fernandez', '123 Elm Rd', 'Barcelona', 'Spain', '08002', '+34 93 5555 4321', 'liam.fernandez@yahoo.es');
CALL insertCustomerInfo('Ava Silva', '789 Maple Ln', 'Lisbon', 'Portugal', '1200-425', '+351 21 5555 6789', 'ava.silva@hotmail.pt');

-- Crating a View to display all the customers
SELECT customer.customer_ID, customer.name, address.addressline,address.city, countries.countryname, address.postcode, customer.contactNumber, customer.email
FROM customer
INNER JOIN address ON customer.address = address.address_ID
INNER JOIN countries ON address.country = countries.country_ID;


-- Join with Columns renaming
SELECT customer.customer_ID as 'Customer Number', customer.name as 'Name', address.addressline as 'Address',address.city as 'City', countries.countryname as ' Country', address.postcode as 'Postcode', customer.contactNumber as 'Contact Number', customer.email as 'Email'
FROM customer
INNER JOIN address ON customer.address = address.address_ID
INNER JOIN countries ON address.country = countries.country_ID;


-- Select statmetn with Table Aliase

SELECT c.name, c.contactNumber, c.email FROM customer c;


--- Books ---

-- Adding Genres to the Database
INSERT INTO genre (genre) VALUES ('Ancient History');
INSERT INTO genre (genre) VALUES ('Medieval History');
INSERT INTO genre (genre) VALUES ('Modern History');
INSERT INTO genre (genre) VALUES ('European History');
INSERT INTO genre (genre) VALUES ('American History');
INSERT INTO genre (genre) VALUES ('World History');
INSERT INTO genre (genre) VALUES ('Military History');
INSERT INTO genre (genre) VALUES ('Political History');
INSERT INTO genre (genre) VALUES ('Social History');
INSERT INTO genre (genre) VALUES ('Cultural History');
INSERT INTO genre (genre) VALUES ('Economic History');
INSERT INTO genre (genre) VALUES ('Biographical History');
INSERT INTO genre (genre) VALUES ('Historiography');
INSERT INTO genre (genre) VALUES ('Art History');
INSERT INTO genre (genre) VALUES ('Religious History');
INSERT INTO genre (genre) VALUES ('Environmental History');
INSERT INTO genre (genre) VALUES ('Legal History');
INSERT INTO genre (genre) VALUES ('Womens History');
INSERT INTO genre (genre) VALUES ('Colonial History');
INSERT INTO genre (genre) VALUES ('Maritime History');
INSERT INTO genre (genre) VALUES ('Intellectual History');
INSERT INTO genre (genre) VALUES ('Mythology');
INSERT INTO genre (genre) VALUES ('Music History');
INSERT INTO genre (genre) VALUES ('20th Century History');
INSERT INTO genre (genre) VALUES ('Science History');
INSERT INTO genre (genre) VALUES ('Philosophy');
INSERT INTO genre (genre) VALUES ('Fiction');
INSERT INTO genre (genre) VALUES ('Renaissance History');

-- Create Proceduer for adding books to the database
DELIMITER //
CREATE PROCEDURE insertBookInfo(title VARCHAR(50), authorName VARCHAR(50), genreType VARCHAR(50), description VARCHAR(50), year YEAR(4), price DECIMAL(10,2))
BEGIN
    IF (SELECT COUNT(Name) FROM author WHERE Name = authorName) = 0 THEN
        INSERT INTO author (Name) VALUES (authorName);
    END IF;
    
    INSERT INTO book (title, author, genre, description, year, price) VALUES (title, (SELECT author_id FROM author WHERE Name = authorName) , (SELECT genre_id FROM genre WHERE genreType = genre), description, year, price);
    INSERT INTO library (book) VALUES (LAST_INSERT_ID());
End
//
DELIMITER ;

SELECT author_id FROM author WHERE Name = Bill Bryson

SELECT genre_id FROM genre WHERE genreType = `World History`

SELECT b.title as 'Title', authoer.author as 'Book Author',g.genre as 'Book Genre', b.year
FROM book b
INNER JOIN author a ON a.name = a.author_id
INNER JOIN genre g ON g.genre = g.genre_idID;


-- Inserting Dummy Data into the Database
CALL insertBookInfo('The Rise and Fall of the Roman Empire', 'Edward Gibbon', 'Ancient History', 'A comprehensive account of the Roman Empire and its eventual decline.', 1976, 19.99);
CALL insertBookInfo('The Crusades: A Short History', 'Jonathan Riley-Smith', 'Medieval History', 'An overview of the medieval Crusades and their impact on history.', 2008, 15.99);
CALL insertBookInfo('A People''s History of the United States', 'Howard Zinn', 'American History', 'A different perspective on U.S. history, focusing on the experiences of everyday people.', 1980, 12.99);
CALL insertBookInfo('The Origins of Political Order', 'Francis Fukuyama', 'Political History', 'Exploring the development of political institutions from prehistoric times to the French Revolution.', 2011, 22.99);
CALL insertBookInfo('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'World History', 'An exploration of the history of the human species, from early humans to the present.', 2014, 18.99);
CALL insertBookInfo('The Guns of August', 'Barbara W. Tuchman', 'Military History', 'A detailed account of the events leading up to World War I.', 1962, 17.99);
CALL insertBookInfo('The Wright Brothers', 'David McCullough', 'Biographical History', 'A biography of the Wright brothers and their invention of the first powered airplane.', 2015, 16.99);
CALL insertBookInfo('A History of Western Philosophy', 'Bertrand Russell', 'Philosophy', 'A comprehensive history of Western philosophy from the pre-Socratic philosophers to the mid-20th century.', 1945, 21.99);
CALL insertBookInfo('A Short History of Nearly Everything', 'Bill Bryson', 'Science History', 'An engaging journey through the history of science and the universe.', 2003, 14.99);
CALL insertBookInfo('The Silk Roads: A New History of the World', 'Peter Frankopan', 'World History', 'An exploration of the interconnected history of the Silk Roads and their impact on the world.', 2015, 19.99);
CALL insertBookInfo('The Making of Europe: Conquest, Colonization and Cultural Change, 950-1350', 'Robert Bartlett', 'Medieval History', 'An examination of the transformation of Europe in the Middle Ages.', 1993, 16.99);
CALL insertBookInfo('The Age of Extremes: A History of the World, 1914-1991', 'Eric Hobsbawm', '20th Century History', 'A global history of the tumultuous 20th century.', 1994, 20.99);
CALL insertBookInfo('Genghis Khan and the Making of the Modern World', 'Jack Weatherford', 'Biographical History', 'A biography of Genghis Khan and his impact on world history.', 2004, 15.99);
CALL insertBookInfo('1491: New Revelations of the Americas Before Columbus', 'Charles C. Mann', 'American History', 'Reexamining the history of the Americas before the arrival of Columbus.', 2005, 14.99);
CALL insertBookInfo('The Story of Art', 'E.H. Gombrich', 'Art History', 'An accessible and comprehensive history of art from ancient times to the present.', 1950, 18.99);
CALL insertBookInfo('The Birth of the West: Rome, Germany, France, and the Creation of Europe in the Tenth Century', 'Paul Collins', 'Medieval History', 'A look at the development of Europe in the 10th century.', 2013, 16.99);
CALL insertBookInfo('A Little History of the World', 'E.H. Gombrich', 'World History', 'An engaging history of the world written for younger readers and adults alike.', 1935, 12.99);
CALL insertBookInfo('The Reformation: A History', 'Diarmaid MacCulloch', 'Religious History', 'A detailed account of the Protestant Reformation and its impact on Christianity.', 2003, 21.99);
CALL insertBookInfo('A Short History of Myth', 'Karen Armstrong', 'Mythology', 'Exploring the history and significance of myth in human culture.', 2005, 13.99);
CALL insertBookInfo('The Path Between the Seas: The Creation of the Panama Canal, 1870-1914', 'David McCullough', '20th Century History', 'A history of the construction of the Panama Canal.', 1977, 19.99);
CALL insertBookInfo('The History of the Ancient World: From the Earliest Accounts to the Fall of Rome', 'Susan Bauer', 'Ancient History', 'A comprehensive history of the ancient world.', 2007, 15.99);
CALL insertBookInfo('The First Tycoon: The Epic Life of Cornelius Vanderbilt', 'T.J. Stiles', 'Biographical History', 'A biography of Cornelius Vanderbilt and his role in shaping American transportation and industry.', 2009, 18.99);
CALL insertBookInfo('The Second World War', 'Winston S. Churchill', 'Military History', 'A firsthand account of World War II by the British Prime Minister.', 1948, 20.99);
CALL insertBookInfo('The History of Money', 'Jack Weatherford', 'Economic History', 'An exploration of the history and significance of money in human civilization.', 1997, 16.99);
CALL insertBookInfo('A History of God: The 4,000-Year Quest of Judaism, Christianity, and Islam', 'Karen Armstrong', 'Religious History', 'A history of the major Abrahamic religions.', 1993, 21.99);
CALL insertBookInfo('The History of the Renaissance World: From the Rediscovery of Aristotle to the Conquest of Constantinople', 'Susan Bauer', 'Renaissance History', 'A look at the development of Europe during the Renaissance period.', 2013, 16.99);
CALL insertBookInfo('The History of Love', 'Nicole Krauss', 'Fiction', 'A novel that weaves together a history of love and loss.', 2005, 12.99);
CALL insertBookInfo('The World in Six Songs: How the Musical Brain Created Human Nature', 'Daniel J. Levitin', 'Music History', 'An exploration of the history of music and its impact on human evolution and culture.', 2008, 17.99);
CALL insertBookInfo('1956', 'Nicole Krauss', 'Fiction', 'The Year 1956 in 2023.', 2024, 16.99);

--- Documents ---

-- Create Proceduer for adding documents to the database
DELIMITER //
CREATE PROCEDURE insertDocInfo(title VARCHAR(50), authorForname VARCHAR(50), authorSurname VARCHAR(50), description VARCHAR(50), year SMALLINT(4))
BEGIN
    INSERT INTO author (forname, surname) VALUES (authorForname, authorSurname);
    INSERT INTO document (title, author, description, year) VALUES (title, LAST_INSERT_ID(), description, year);
    INSERT INTO library (document) VALUES (LAST_INSERT_ID());
End
//
DELIMITER ;

-- Inserting Dummy Data into the Database
CALL insertDocInfo('The Declaration of Independence', 'Thomas', 'Jefferson', 'The founding document of the United States, declaring independence from Great Britain.', 1776);
CALL insertDocInfo('The Magna Carta', 'Unknown', '', 'A historic charter that limited the powers of the English monarchy and established the principle of the rule of law.', 1215);
CALL insertDocInfo('The Emancipation Proclamation', 'Abraham', 'Lincoln', 'An executive order by President Lincoln that declared the freedom of all enslaved people in Confederate territory.', 1863);
CALL insertDocInfo('The Universal Declaration of Human Rights', 'United Nations', '', 'A document that sets out fundamental human rights to be universally protected.', 1948);
CALL insertDocInfo('The Communist Manifesto', 'Karl', 'Marx', 'A political pamphlet that outlines the principles of communism and the class struggle.', 1848);
CALL insertDocInfo('The Gettysburg Address', 'Abraham', 'Lincoln', 'A speech given by President Lincoln during the American Civil War, emphasizing the principles of freedom and equality.', 1863);
CALL insertDocInfo('The Treaty of Versailles', 'Various', '', 'The peace treaty that officially ended World War I, imposing significant penalties on Germany.', 1919);
CALL insertDocInfo('The Bill of Rights', 'James', 'Madison', 'The first ten amendments to the United States Constitution, protecting individual liberties.', 1791);
CALL insertDocInfo('The Articles of Confederation', 'Continental Congress', '', 'The first constitution of the United States, in effect from 1781 to 1789.', 1777);
CALL insertDocInfo('The Code of Hammurabi', 'Hammurabi', '', 'One of the earliest known legal codes, originating in ancient Babylon.', 1754);
CALL insertDocInfo('The Geneva Conventions', 'Various', '', 'A set of international treaties that establish the humanitarian rules of war.', 1864);
CALL insertDocInfo('The Treaty of Tordesillas', 'Portugal and Spain', '', 'An agreement between Portugal and Spain to divide the newly discovered lands outside Europe.', 1494);
CALL insertDocInfo('The Emancipation of the Serfs', 'Alexander II', '', 'An edict in Russia that abolished serfdom, granting serfs their freedom.', 1861);
CALL insertDocInfo('The Nineteenth Amendment', 'Various', '', 'Amendment to the United States Constitution granting women the right to vote.', 1920);
CALL insertDocInfo('The Treaty of Waitangi', 'Various', '', 'An agreement between the British Crown and Māori chiefs in New Zealand.', 1840);
CALL insertDocInfo('The Petition of Right', 'Parliament of England', '', 'A statement of civil liberties sent by the English Parliament to King Charles I.', 1628);
CALL insertDocInfo('The Monroe Doctrine', 'James', 'Monroe', 'A U.S. policy opposing European colonization in the Americas.', 1823);
CALL insertDocInfo('The Nuremberg Trials', 'Various', '', 'A series of military tribunals held to prosecute prominent leaders of Nazi Germany for war crimes.', 1945);
CALL insertDocInfo('The Treaty of Ghent', 'Various', '', 'The peace treaty that ended the War of 1812 between the United States and the United Kingdom.', 1814);
CALL insertDocInfo('The Zenger Trial', 'John Peter', 'Zenger', 'A landmark case for freedom of the press in the American colonies.', 1735);
CALL insertDocInfo('The Treaty of Brest-Litovsk', 'Various', '', 'A peace treaty between Soviet Russia and the Central Powers, ending Russias involvement in World War I.', 1918);
CALL insertDocInfo('The Treaty of Paris (1783)', 'Various', '', 'The treaty that recognized the independence of the United States from Great Britain.', 1783);
CALL insertDocInfo('The Edict of Milan', 'Constantine the Great', '', 'A decree that allowed religious tolerance in the Roman Empire, particularly for Christianity.', 1313);
CALL insertDocInfo('The United Nations Charter', 'United Nations', '', 'The foundational treaty of the United Nations organization.', 1945);
CALL insertDocInfo('The Berlin Wall Speech', 'John F.', 'Kennedy', 'A speech by President Kennedy expressing support for West Berlin during the Cold War.', 1963);
CALL insertDocInfo('The Louisiana Purchase Treaty', 'Various', '', 'The acquisition of the Louisiana Territory by the United States from France.', 1803);
CALL insertDocInfo('The Treaty of Kanagawa', 'Matthew', 'Perry', 'An agreement that opened Japan to trade with the United States.', 1854);
CALL insertDocInfo('The Proclamation of Neutrality', 'George', 'Washington', 'A declaration of U.S. neutrality in the conflict between Great Britain and France.', 1793);
CALL insertDocInfo('The Edict of Worms', 'Charles V', '', 'A decree that declared Martin Luther an outlaw and heretic.', 1521);
CALL insertDocInfo('The Treaty of Tordesillas', 'Portugal and Spain', '', 'An agreement between Portugal and Spain to divide the newly discovered lands outside Europe.', 1494);
CALL insertDocInfo('The Yalta Conference', 'Winston', 'Churchill', 'A meeting between the leaders of the Allied powers during World War II.', 1945);
CALL insertDocInfo('The Treaty of Guadalupe Hidalgo', 'Various', '', 'The peace treaty that ended the Mexican-American War and ceded territory to the United States.', 1848);
CALL insertDocInfo('The Alien and Sedition Acts', 'John', 'Adams', 'A series of laws that restricted the rights of immigrants and free speech.', 1798);
CALL insertDocInfo('The Mayflower Compact', 'Various', '', 'A social contract among the Pilgrims aboard the Mayflower, establishing self-government.', 1620);
CALL insertDocInfo('The Taft-Hartley Act', 'United States Congress', '', 'A U.S. labor law that restricts the activities and power of labor unions.', 1947);
CALL insertDocInfo('The Treaty of Tordesillas', 'Portugal and Spain', '', 'An agreement between Portugal and Spain to divide the newly discovered lands outside Europe.', 1494);
CALL insertDocInfo('The Treaty of Waitangi', 'Various', '', 'An agreement between the British Crown and Māori chiefs in New Zealand.', 1840);
CALL insertDocInfo('The Proclamation of 1763', 'King George III', '', 'A royal proclamation that restricted American settlement west of the Appalachian Mountains.', 1763);

--- DNA Testing Order ---

-- ServiceAccses --

INSERT INTO serviceaccses (serviceAccses) VALUES ('In-Person');
INSERT INTO serviceaccses (serviceAccses) VALUES ('Remote');

-- Procutes --

INSERT INTO product (productName) VALUES ('DNA Testing');
INSERT INTO product (productName) VALUES ('Family Tree');
INSERT INTO product (productName) VALUES ('GuidedTour');
INSERT INTO product (productName) VALUES ('Workshop');
INSERT INTO product (productName) VALUES ('Lectures');
INSERT INTO product (productName) VALUES ('Subscription');


-- Create Proceduer for adding DNA Testing to the database
DELIMITER //
CREATE PROCEDURE bookDNATesting(prodType VARCHAR(50), orderDate DATE, treeDate DATE, cost DECIMAL(10,2), Accses VARCHAR(15), user VARCHAR(50))
BEGIN
    INSERT INTO dnatesting (date, price, serviceAccess) VALUES (treeDate, cost, (SELECT serviceAccses_ID from serviceaccses where Accses = serviceAccses ));
    INSERT INTO orders (productType, ProdcutOrderID, orderDate, customerID) VALUES ((SELECT product_id from product where prodType = productName), LAST_INSERT_ID() , orderDate, (SELECT customer_ID FROM customer WHERE user = name ));
End
//
DELIMITER ;

-- Inserting Dummy Data into the Database
CALL bookDNATesting('DNA Testing', '2023-10-29', '2023-11-15', 150.00, 'In-Person', 'John Doe');
CALL bookDNATesting('DNA Testing', '2023-10-29', '2023-12-16', 150.00, 'Remote', 'Alice Smith');
CALL bookDNATesting('DNA Testing', '2023-10-29', '2024-10-17', 150.00, 'In-Person', 'Michael Wilson');
CALL bookDNATesting('DNA Testing', '2021-10-05', '2021-10-18', 150.00, 'Remote', 'Emily Brown');

--- Family Tree Order ---
DELIMITER //
CREATE PROCEDURE bookFamilyTree(prodType VARCHAR(50), orderDate DATE, dnaDate DATE, cost DECIMAL(10,2), Accses VARCHAR(15), user VARCHAR(50))
BEGIN
    INSERT INTO familytree (date, price, serviceAccess) VALUES (dnaDate, cost, (SELECT serviceAccses_ID from serviceaccses where Accses = serviceAccses ));
    INSERT INTO orders (productType, ProdcutOrderID, orderDate, customerID) VALUES ((SELECT product_id from product where prodType = productName),LAST_INSERT_ID() , orderDate, (SELECT customer_ID FROM customer WHERE user = name ));
End
//
DELIMITER ;

-- Inserting Dummy Data into the Database
CALL bookFamilyTree('Family Tree', '2023-10-29', '2023-10-15', 200.00, 'In-Person', 'Ava Silva');
CALL bookFamilyTree('Family Tree', '2023-10-29', '2023-10-16', 200.00, 'Remote', 'William Jansen');
CALL bookFamilyTree('Family Tree', '2023-10-29', '2023-10-17', 200.00, 'In-Person', 'Ethan Smith');
CALL bookFamilyTree('Family Tree', '2023-10-29', '2023-10-18', 200.00, 'Remote', 'Logan Gupta');
CALL bookFamilyTree('Family Tree', '2023-10-29', '2023-10-19', 200.00, 'In-Person', 'Daniel Larson');




