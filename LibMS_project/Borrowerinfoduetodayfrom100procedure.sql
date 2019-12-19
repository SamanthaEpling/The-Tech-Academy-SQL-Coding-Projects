--Procedure for: For each book that is loaned out from the 
--"Sharpstown" branch and whose DueDate is today, retrieve the 
--book title, the borrower's name, and the borrower's address.

CREATE PROC dbo.borrowerinfoduetodayfrom100 @DueDate nvarchar(50), @branch nvarchar(50)
AS	
SELECT BOOKS.Title, BORROWER.Name, BORROWER.Address
 FROM BOOK_LOANS
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
	INNER JOIN BOOKS ON BOOKS.BookID = BOOK_LOANS.BookID
	INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo

	WHERE BOOK_LOANS.DateDue = @DueDate
	AND LIBRARY_BRANCH.BranchName = @branch

GO
;

EXEC dbo.borrowerinfoduetodayfrom100 @DueDate = '2019-15-12', @branch = 'Sharpstown'
