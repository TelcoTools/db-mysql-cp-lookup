-- 1. Truncate all the Temp Tables first
TRUNCATE `S1`;
TRUNCATE `S3`;
TRUNCATE `S5`;
TRUNCATE `S7`;
TRUNCATE `S8`;
TRUNCATE `S9`;
TRUNCATE `SABC`;

-- 2. Load the data in the numbering files to the Temp Tables
LOAD DATA INFILE '/tmp/numbering/S1.csv' INTO TABLE `S1` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
LOAD DATA INFILE '/tmp/numbering/S3.csv' INTO TABLE `S3` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
LOAD DATA INFILE '/tmp/numbering/S5.csv' INTO TABLE `S5` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
LOAD DATA INFILE '/tmp/numbering/S7.csv' INTO TABLE `S7` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
LOAD DATA INFILE '/tmp/numbering/S8.csv' INTO TABLE `S8` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
LOAD DATA INFILE '/tmp/numbering/S9.csv' INTO TABLE `S9` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
-- LOAD DATA INFILE '/tmp/numbering/sabc.txt' INTO TABLE SABC FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

# 3. Truncate the live table then sanitise and insert the temp data into the live table
TRUNCATE `numbering_allocation`;
INSERT INTO `numbering_allocation` (`number`, `status`, `cp`, `num_length`, `last_change`, `use`, `timestamp`)
SELECT REPLACE(`NMSNumberBlock`, ' ', '') AS `number_range`, `status`, IF(`Communications Provider`="",NULL,`Communications Provider`) AS `cp`, IF(`Number Length`="",NULL,`Number Length`) AS `num_length`, IF(`change`="",NULL,STR_TO_DATE(`change`, '%d/%m/%Y')) AS `last_change`, NULL, NOW() FROM `S1`;

INSERT INTO `numbering_allocation` (`number`, `status`, `cp`, `num_length`, `last_change`, `use`, `timestamp`)
SELECT REPLACE(`NMSNumberBlock`, ' ', '') AS `number_range`, `status`, IF(`Communications Provider`="",NULL,`Communications Provider`) AS `cp`, IF(`Number Length`="",NULL,`Number Length`) AS `num_length`, IF(`change`="",NULL,STR_TO_DATE(`change`, '%d/%m/%Y')) AS `last_change`, NULL, NOW() FROM `S3`;

INSERT INTO `numbering_allocation` (`number`, `status`, `cp`, `num_length`, `last_change`, `use`, `timestamp`)
SELECT REPLACE(`NMSNumberBlock`, ' ', '') AS `number_range`, `status`, IF(`Communications Provider`="",NULL,`Communications Provider`) AS `cp`, IF(`Number Length`="",NULL,`Number Length`) AS `num_length`, IF(`change`="",NULL,STR_TO_DATE(`change`, '%d/%m/%Y')) AS `last_change`, NULL, NOW() FROM `S5`;

INSERT INTO `numbering_allocation` (`number`, `status`, `cp`, `num_length`, `last_change`, `use`, `timestamp`)
SELECT REPLACE(`NMSNumberBlock`, ' ', '') AS `number_range`, `status`, IF(`Communications Provider`="",NULL,`Communications Provider`) AS `cp`, IF(`Number Length`="",NULL,`Number Length`) AS `num_length`, IF(`change`="",NULL,STR_TO_DATE(`change`, '%d/%m/%Y')) AS `last_change`, NULL, NOW() FROM `S7`;

INSERT INTO `numbering_allocation` (`number`, `status`, `cp`, `num_length`, `last_change`, `use`, `timestamp`)
SELECT REPLACE(`NMSNumberBlock`, ' ', '') AS `number_range`, `status`, IF(`Communications Provider`="",NULL,`Communications Provider`) AS `cp`, IF(`Number Length`="",NULL,`Number Length`) AS `num_length`, IF(`change`="",NULL,STR_TO_DATE(`change`, '%d/%m/%Y')) AS `last_change`, NULL, NOW() FROM `S8`;

INSERT INTO `numbering_allocation` (`number`, `status`, `cp`, `num_length`, `last_change`, `use`, `timestamp`)
SELECT REPLACE(`NMSNumberBlock`, ' ', '') AS `number_range`, `status`, IF(`Communications Provider`="",NULL,`Communications Provider`) AS `cp`, IF(`Number Length`="",NULL,`Number Length`) AS `num_length`, IF(`change`="",NULL,STR_TO_DATE(`change`, '%d/%m/%Y')) AS `last_change`, NULL, NOW() FROM `S9`;

-- 4. Do a bit of tidying up
DELETE FROM `numbering_allocation` WHERE `number` IS NULL;
UPDATE `numbering_allocation` SET `use` = "Protected number range" WHERE `status` = "Protected" AND `use` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Protected" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Free for National Dialing Only" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Free" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Reserved" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Quarantined" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Designated" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "Awaiting Data" WHERE `status` = "Requested" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `use` = "No specific use data recorded" WHERE `use` IS NULL;

-- 5. Insert numbers from the "Known Ported" table
INSERT INTO `numbering_allocation` (`number`, `status`, `cp`, `num_length`, `use`, `last_change`, `timestamp`)
SELECT `number`, `status`, `cp`, `num_length`, `use`, `last_change`, `timestamp` FROM `known_ported`;
