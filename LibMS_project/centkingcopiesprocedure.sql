--Procedure for: For each book authored by "Stephen King", 
--retrieve the title and the number of copies owned by the 
--library whose name is "Central".

CREATE PROC dbo.centkingcopies @authorname nvarchar(30), @branch nvarchar(30)
AS
SELECT DISTINCT BOOKS.Title, BOOK_COPIES.Number_Of_Copies
FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
INNER JOIN BOOK_AUTHORS ON BOOK_COPIES.BookID = BOOK_AUTHORS.BookID
WHERE BOOK_AUTHORS.AuthorName = @authorname
	AND LIBRARY_BRANCH.BranchName = @branch
GO

EXEC dbo.centkingcopies @authorname = 'Stephen King', @branch = 'Sharpstown'


