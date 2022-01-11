-- Add company

USE games_2;

set @company_ID = "test";
set @company_name = "test co";
set @founding = "March 3 1999";
set @closing = null;
set @address = "addy";
set @parent_cID = null; -- assume correct

set @parentCount = (SELECT COUNT(*) FROM company WHERE cID=UPPER(@parent_cID));
SELECT @parentCount;

INSERT INTO `company` SELECT 
	UPPER(@company_ID), @company_name, str_to_date(@founding, "%M %d %Y"), ifnull(str_to_date(@closing, "%M %d %Y"), null), @address, UPPER(@parent_cID) 
WHERE @parentCount=1 OR @parent_cID IS NULL;

SELECT * FROM company c;