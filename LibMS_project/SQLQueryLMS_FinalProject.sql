
USE db_LMS_project


--CREATE THE TABLES!

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	BranchName varchar(50) NOT NULL,
	Address varchar(50) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName varchar(50) PRIMARY KEY NOT NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(20) NOT NULL
);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (200,1),
	Title varchar(50) NOT NULL,
	PublisherName varchar(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchIDbookcopies FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT
);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (400,1),
	Name varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(20) NOT NULL
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BookIDauthors FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName varchar(50) NOT NULL,
);

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BookIDbookloans FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchIDbookloans FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNobookloans FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut varchar(50) NOT NULL,
	DateDue varchar(50) NOT NULL
);


--POPULATE THE TABLES!

SELECT * FROM LIBRARY_BRANCH
SELECT * FROM BOOKS
SELECT * FROM BOOK_AUTHORS
SELECT * FROM BOOK_COPIES
SELECT * FROM BOOK_LOANS
SELECT * FROM BORROWER
SELECT * FROM PUBLISHER

INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Sharpstown','5555 SW OAK ST GASTON OR 97119'),
	('Gaston','5556 SW OAK ST GASTON OR 97119'),
	('Forest Grove','5557 SW OAK ST GASTON OR 97119'),
	('Central','5558 SW OAK ST GASTON OR 97119')
;
SELECT * FROM LIBRARY_BRANCH

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The Green Mile','Subterranean Press'),
	('The Institute','Simon & Schuster'),
	('Death and Relaxation','Odd House Press'),
	('Devils and Details','Odd House Press'),
	('Gods and Ends','Odd House Press'),
	('The Ring of Allaire','HarperCollins Publishers'),
	('The Prince of Ill Luck','Del Rey'),
	('The Dragon and the George','Doubleday'),
	('The Dragon Knight','Tor Books'),
	('Working for the Devil','Orbit'),
	('Dead Man Rising','Warner Books'),
	('The Host','Little, Brown & Company'),
	('The Chemist','Little, Brown & Company'),
	('Jurrasic Park','Knopf'),
	('The Lost World','Knopf'),
	('Red-Headed Stepchild','Orbit'),
	('The Mage in Black','Orbit'),
	('Another Fine Myth','Starblaze Graphics'),
	('Myth Conceptions','Ace'),
	('The Lost Tribe','Picador USA')
;
SELECT * FROM BOOKS

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(202,'Stephen King'),
	(203,'Stephen King'),
	(204,'Devon Monk'),
	(205,'Devon Monk'),
	(206,'Devon Monk'),
	(221,'Mark Lee'),
	(207,'Susan Dexter'),
	(208,'Susan Dexter'),
	(209,'Gordon Dickinson'),
	(210,'Gordon Dickinson'),
	(211,'Lilith Saintcrow'),
	(212,'Lilith Saintcrow'),
	(213,'Stephanie Meyer'),
	(214,'Stephanie Meyer'),
	(215,'Michael Crichton'),
	(216,'Michael Crichton'),
	(217,'Jaye Wells'),
	(218,'Jaye Wells'),
	(219,'Robert Asprin'),
	(220,'Robert Asprin')
;
SELECT * FROM BOOK_AUTHORS

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(202,101,2),
	(202,100,1),
	(202,102,2),
	(202,103,1),
	(203,102,2),
	(203,103,1),
	(203,101,2),
	(202,100,3),
	(203,103,4),
	(203,102,2),
	(203,101,2),
	(203,100,1),
	(204,103,4),
	(204,102,2),
	(205,100,1),
	(205,101,1),
	(205,103,3),
	(205,102,2),	
	(206,103,4),
	(206,102,3),
	(206,101,2),
	(206,100,1),
	(207,100,4),
	(207,101,3),
	(207,102,2),
	(207,103,1),
	(208,100,2),
	(208,101,3),
	(208,102,2),
	(208,103,1),
	(209,100,4),
	(209,101,4),
	(209,102,4),
	(209,103,3),
	(210,101,2),
	(210,100,1),
	(210,102,3),
	(210,103,4),
	(211,100,4),
	(211,101,3),
	(211,102,2),
	(211,103,1),
	(212,100,3),
	(212,101,2),
	(212,102,1),
	(212,103,2),
	(213,100,3),
	(213,101,2),
	(213,102,1),
	(213,103,2),
	(214,100,3),
	(214,101,2),
	(214,102,1),
	(214,103,2),
	(215,100,3),
	(215,101,2),
	(215,102,1),
	(215,103,2),
	(216,100,3),
	(216,101,2),
	(216,102,1),
	(216,103,2),
	(217,100,3),
	(217,101,2),
	(217,102,1),
	(217,103,2),
	(218,100,3),
	(218,101,2),
	(218,102,1),
	(218,103,2),
	(219,100,3),
	(219,101,2),
	(219,102,1),
	(219,103,2),
	(220,100,3),
	(220,101,2),
	(220,102,1),
	(221,100,1)	
;
SELECT * FROM BOOK_COPIES

INSERT INTO BOOK_LOANS
	(BookID,BranchID,CardNo,DateOut,DateDue)
	VALUES
	(211,100,404,'2019-15-10','2019-15-11'),
	(212,102,406,'2019-15-10','2019-15-11'),
	(213,100,400,'2019-15-10','2019-15-11'),
	(214,100,400,'2019-15-10','2019-15-11'),
	(215,103,407,'2019-15-10','2019-15-11'),
	(216,102,406,'2019-15-10','2019-15-11'),
	(217,101,405,'2019-15-10','2019-15-11'),
	(218,100,404,'2019-15-10','2019-15-11'),
	(219,101,403,'2019-15-10','2019-15-11'),
	(220,100,404,'2019-01-11','2019-01-11'),
	(202,103,407,'2019-02-11','2019-02-12'),
	(203,102,406,'2019-03-11','2019-03-12'),
	(204,101,405,'2019-04-11','2019-04-12'),
	(205,101,405,'2019-04-11','2019-04-12'),
	(206,102,406,'2019-05-11','2019-05-12'),
	(207,103,407,'2019-06-11','2019-06-12'),
	(208,100,400,'2019-07-11','2019-07-12'),
	(209,100,400,'2019-08-11','2019-08-12'),
	(210,100,400,'2019-08-11','2019-08-12'),
	(211,100,400,'2019-08-11','2019-08-12'),
	(212,103,407,'2019-09-11','2019-09-12'),
	(213,103,407,'2019-09-11','2019-09-12'),
	(214,103,407,'2019-09-11','2019-09-12'),
	(215,102,406,'2019-10-11','2019-10-12'),
	(216,102,406,'2019-10-11','2019-10-12'),
	(217,102,406,'2019-11-11','2019-11-12'),
	(218,101,405,'2019-12-11','2019-12-12'),
	(219,101,405,'2019-12-11','2019-12-12'),
	(220,101,405,'2019-12-11','2019-12-12'),
	(219,100,404,'2019-13-11','2019-13-12'),
	(202,100,404,'2019-13-11','2019-13-12'),
	(203,100,404,'2019-13-11','2019-13-12'),
	(204,101,403,'2019-14-11','2019-14-12'),
	(205,101,403,'2019-14-11','2019-14-12'),
	(206,102,402,'2019-15-11','2019-15-12'),
	(207,102,402,'2019-15-11','2019-15-12'),
	(208,102,402,'2019-15-11','2019-15-12'),
	(209,101,402,'2019-15-11','2019-15-12'),
	(210,101,401,'2019-16-11','2019-16-12'),
	(211,101,401,'2019-16-11','2019-16-12'),
	(212,101,401,'2019-16-11','2019-16-12'),
	(213,101,401,'2019-16-11','2019-16-12'),
	(214,101,401,'2019-16-11','2019-16-12'),
	(215,100,401,'2019-17-11','2019-17-12'),
	(216,100,400,'2019-17-11','2019-17-12'),
	(217,100,400,'2019-17-11','2019-17-12'),
	(218,100,400,'2019-17-11','2019-17-12'),
	(219,100,400,'2019-17-11','2019-17-12'),
	(220,100,400,'2019-17-11','2019-17-12'),
	(202,100,400,'2019-17-11','2019-17-12')
;
SELECT * FROM BOOK_LOANS

INSERT INTO BORROWER
	(BORROWER.Name, BORROWER.Address, BORROWER.Phone)
	VALUES
	('Fiona Epling','3839 Pacific Ave Unit #150 Forest Grove OR, 97116','555-555-5556'),
	('Hermione Epling','3839 Pacific Ave Unit #150 Forest Grove OR, 97116','555-555-5557'),
	('Mister Epling','3839 Pacific Ave Unit #150 Forest Grove OR, 97116','555-555-5558'),
	('Mr. Bubbles Epling','3839 Pacific Ave Unit #150 Forest Grove OR, 97116','555-555-5559'),
	('Rosie Tinkerbell Epling','3839 Pacific Ave Unit #150 Forest Grove OR, 97116','555-555-5560'),
	('Love Bug Epling','3839 Pacific Ave Unit #150 Forest Grove OR, 97116','555-555-5561'),
	('Lionel Epling','3839 Pacific Ave Unit #150 Forest Grove OR, 97116','555-555-5562'),
	('Romani Epling','3839 Pacific Ave Unit #150 Forest Grove OR, 97116','555-555-5563')
;
SELECT * FROM BORROWER

INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('Subterranean Press','18154 SW Barcelona Way Beaverton, OR, 97007','555-556-5555'),
	('Simon & Schuster','18155 SW Barcelona Way Beaverton, OR, 97007','555-557-5555'),
	('Odd House Press','18156 SW Barcelona Way Beaverton, OR, 97007','555-558-5555'),
	('Roc Books','18157 SW Barcelona Way Beaverton, OR, 97007','555-559-5555'),
	('Picador USA','18158 SW Barcelona Way Beaverton, OR, 97007','555-560-5555'),
	('HarperCollins Publishers','18159 SW Barcelona Way Beaverton, OR, 97007','555-561-5555'),
	('Del Rey','18160 SW Barcelona Way Beaverton, OR, 97007','555-561-5555'),
	('Doubleday','18161 SW Barcelona Way Beaverton, OR, 97007','555-562-5555'),
	('Tor Books','18162 SW Barcelona Way Beaverton, OR, 97007','555-563-5555'),
	('Orbit','18163 SW Barcelona Way Beaverton, OR, 97007','555-564-5555'),
	('Starblaze Graphics','18164 SW Barcelona Way Beaverton, OR, 97007','555-565-5555'),
	('Ace','18165 SW Barcelona Way Beaverton, OR, 97007','555-566-5555'),
	('Knopf','18166 SW Barcelona Way Beaverton, OR, 97007','555-567-5555'),
	('Warner Books','18167 SW Barcelona Way Beaverton, OR, 97007','555-568-5555'),
	('Little, Brown & Company','18168 SW Barcelona Way Beaverton, OR, 97007','555-569-5555')
;
SELECT * FROM PUBLISHER

--QUERY THE DATABASE!!

--Procedure for: How many copies of the book titled 
--"The Lost Tribe" are owned by the library branch "Sharpstown"?
EXEC dbo.uspnumcopies221at100 @branch = 'Sharpstown', @book = 'The Lost Tribe'

--Procedure for: How many copies of the book titled 
--"The Lost Tribe are owned by each library branch?
EXEC dbo.uspnumcopies221atallbranches @book = 'The Lost Tribe'

--Procedure for: Retrieve the names of all the borrowers 
--who do not have any books checked out.
EXEC dbo.namesofborrowerswithnullcheckedout 

--Procedure for: For each book that is loaned out from the 
--"Sharpstown" branch and whose DueDate is today, retrieve the 
--book title, the borrower's name, and the borrower's address.
EXEC dbo.borrowerinfoduetodayfrom100 @DueDate = '2019-15-12', @branch = 'Sharpstown'


--Procedure for: For each library branch, retrieve the branch 
--name and the total number of books loaned out from that branch.
EXEC dbo.totalnumbookloanedperbranch

--Procedure for: Retrieve the names, addresses, and the 
--number of books checked out for all borrowers who have 
--more than five books checked out.
EXEC dbo.infoofmorethannumbookscheckedout @numbookscheckedout=5

--Procedure for: For each book authored by "Stephen King", 
--retrieve the title and the number of copies owned by the 
--library whose name is "Central".
EXEC dbo.centkingcopies @authorname = 'Stephen King', @branch = 'Sharpstown'

	--As a note for this one, the procedure is correct,
	--my poor table population for BOOK_COPIES includes several duplicates...
