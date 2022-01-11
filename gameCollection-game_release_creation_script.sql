-- ----------------
-- Create Game Release
-- ----------------

USE games_2;

-- ----------------
set @gID = 7;
-- ----------------

set @title = "fghf";
set @console = "GEN";
set @region = "USA";
set @producer = "SEGA";
set @developer = "SEGA";
set @release_date = "March 16 1987";

-- ---------------

set @gCount = (SELECT COUNT(*) FROM meta_game WHERE gID=@gID);
set @pcCount = (SELECT COUNT(*) FROM console WHERE pcID=@console);
set @portCount = (SELECT COUNT(*) FROM game_port WHERE gID=@gID AND @console=pcID);
set @regionCount = (SELECT COUNT(*) FROM region WHERE rID=@region);
set @producerCount = (SELECT COUNT(*) FROM company WHERE cID=@producer);
set @developerCount = (SELECT COUNT(*) FROM company WHERE cID=@developer);
set @r_date = str_to_date(@release_date, "%M %d %Y");
SELECT @portCount, @regionCount, @producerCount, @developerCount;

INSERT INTO game_port SELECT @gID, @console, @producer, @developer 
	WHERE @gCount=1 AND @pcCount=1 AND @portCount=0 AND @regionCount=1 AND @producerCount=1 AND @developerCount=1;
INSERT INTO game_release SELECT @gID, @console, @region, @title, @r_date 
	WHERE @gCount = 1 AND @pcCount=1 AND @regionCount=1 AND @producerCount=1 AND @developerCount=1;

SELECT r.gname as title, r.pcID as console, r.rID as region, p.producer, p.developer, r.release_date
FROM game_port p JOIN game_release r USING(gID, pcID)
WHERE r.gname=@title;

