--Procedure for: How many copies of the book titled 
--"The Lost Tribe are owned by each library branch?

CREATE PROC dbo.uspnumcopies221atallbranches  @book nvarchar(30)
AS

SELECT BOOK_COPIES.Number_Of_Copies, BOOKS.Title, LIBRARY_BRANCH.BranchName
	FROM BOOK_COPIES
	INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
	INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID

WHERE BOOKS.Title = @book
GO
;
EXEC dbo.uspnumcopies221atallbranches @book = 'The Lost Tribe'

--SELECT * FROM BOOKS
--SELECT * FROM LIBRARY_BRANCH
SELECT * FROM BOOK_COPIES