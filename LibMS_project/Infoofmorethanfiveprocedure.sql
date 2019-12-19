--Procedure for: Retrieve the names, addresses, and the 
--number of books checked out for all borrowers who have 
--more than five books checked out.

CREATE PROC dbo.infoofmorethannumbookscheckedout @numbookscheckedout int
AS
SELECT DISTINCT BORROWER.Name 
	,BORROWER.Address 
	,BORROWER.Phone
	,COUNT(BOOK_LOANS.CardNo) AS TotalNumBooksOut
FROM BOOK_LOANS
	INNER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo

GROUP BY
BORROWER.Name, BORROWER.Address, BORROWER.Phone

HAVING COUNT(BOOK_LOANS.CardNo) >= @numbookscheckedout


GO

EXEC dbo.infoofmorethannumbookscheckedout @numbookscheckedout=5