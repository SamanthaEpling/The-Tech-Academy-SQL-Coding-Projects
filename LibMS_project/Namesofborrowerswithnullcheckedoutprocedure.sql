--Procedure for: Retrieve the names of all the borrowers 
--who do not have any books checked out.
 CREATE PROC dbo.namesofborrowerswithnullcheckedout
AS
SELECT BORROWER.Name, BOOK_LOANS.CardNo
FROM BOOK_LOANS
INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo
WHERE BOOK_LOANS.CardNo IS NULL
GO

EXEC dbo.namesofborrowerswithnullcheckedout 
