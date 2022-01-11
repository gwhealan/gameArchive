-- Add series query

USE games;
DROP TABLE IF EXISTS `games`.`_tmp_names`;
set @seriesFolder := "series/";

set @seriesAbout := "Dragon Quest is a fantasy role-playing series developed by Enix (later Square-Enix). Each installment tells it's own story however, monsters, locations, and the rules of the world tend to stay consistent. The Dragon Quest Series art direction is led by Akira Toriyama - the author of the Dragon Ball series - so the aesthetic is very similar.";
set @seriesImageRef := "dragonquest.png";
set @seriesImageAlt := "Dragon Quest logo";

set @seriesImageRef := CONCAT(@seriesFolder,@seriesImageRef);

set @wld_name = "";
set @jpn_name = "Doragon Kuesuto";
set @pal_name = "Dragon Quest";
set @aus_name = "";
set @chn_name = "Yongzhe Dou e Long";
set @usa_name = "Dragon Warrior / Dragon Quest";
set @enp_name = "";



CREATE TABLE `games`.`_tmp_names` (
    `region` char(3) NOT NULL,
	`name` char (64) NOT NULL,
    PRIMARY KEY (`name`,`region`)
);
INSERT INTO `games`.`_tmp_names` VALUES ('WLD',@wld_name), ('JPN',@jpn_name), ('PAL',@pal_name), ('AUS',@aus_name), ('CHN',@chn_name), ('USA',@usa_name), ('ENP',@enp_name);

-- DELETE FROM `games`.`image` WHERE ref=@seriesImageRef; -- Dumb fix but works 
INSERT INTO `games`.`image` (ref, alt) SELECT @seriesImageRef, @seriesImageAlt FROM (SELECT COUNT(*) AS cnt FROM image i WHERE i.ref=@seriesImageRef) AS tmp WHERE tmp.cnt = 0;
set @imageID = (SELECT `auto_increment` FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'image') - 1;
INSERT INTO `games`.`series` (about, icon) VALUE (@seriesAbout, @imageID);
set @seriesID = (SELECT `auto_increment` FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'series') - 1;
INSERT INTO `games`.`series_region` SELECT tmp.region, @seriesID, tmp.name FROM _tmp_names tmp WHERE tmp.name != '';

DROP TABLE `games`.`_tmp_names`;