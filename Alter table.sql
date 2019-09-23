--Alter table----

-- 1 query to change the name of the column
ALTER TABLE `dict website`.`  dt_event` 
CHANGE COLUMN `Evt_Location` `Evt_Loctn` VARCHAR(80) NOT NULL ;

--2  query to change the size
ALTER TABLE `dict website`.`  dt_event` 
CHANGE COLUMN `Evt_Loctn` `Evt_Loctn` VARCHAR(45) NOT NULL ;

--3 query to change the type 
ALTER TABLE `dict website`.`  dt_event` 
CHANGE COLUMN `Evt_Title` `Evt_Title` TINYTEXT NOT NULL ;

