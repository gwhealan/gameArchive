-- ----------------
-- Create Game
-- ----------------

USE games_2;

set @series = null;
set @players = 1;

INSERT INTO `games_2`.`meta_game` (series, players) VALUE (@series, @players);

set @gameID = (SELECT `auto_increment` FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'meta_game') - 1;
SELECT @gameID;

