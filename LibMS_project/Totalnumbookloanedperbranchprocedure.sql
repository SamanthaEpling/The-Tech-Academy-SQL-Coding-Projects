--Procedure for: For each library branch, retrieve the branch 
--name and the total number of books loaned out from that branch.

CREATE PROC dbo.totalnumbookloanedperbranch 
AS
SELECT DISTINCT LIBRARY_BRANCH.BranchName
	, COUNT(*) OVER (PARTITION BY BOOK_LOANS.BranchID) AS TotalNumBooksOut
FROM BOOK_LOANS 
INNER JOIN LIBRARY_BRANCH ON BOOK_LOANS.BranchID = LIBRARY_BRANCH.BranchID
GO
;
EXEC dbo.totalnumbookloanedperbranch

