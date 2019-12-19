--Procedure for: How many copies of the book titled 
--"The Lost Tribe" are owned by the library branch "Sharpstown"?



CREATE PROC dbo.uspnumcopies221at100 @branch nvarchar(30), @book nvarchar(30)
AS

SELECT BOOK_COPIES.Number_Of_Copies, BOOKS.Title, LIBRARY_BRANCH.BranchName
	FROM BOOK_COPIES
	INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
	INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID

WHERE BOOKS.Title = @book
AND LIBRARY_BRANCH.BranchName = @branch
GO
;
EXEC dbo.uspnumcopies221at100 @branch = 'Sharpstown', @book = 'The Lost Tribe'

SELECT * FROM BOOKS
SELECT * FROM LIBRARY_BRANCH
SELECT * FROM BOOK_COPIES
