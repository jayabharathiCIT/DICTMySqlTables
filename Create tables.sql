-- Create Table

-- 1. Database name : Dt_dict_Persons
CREATE TABLE `dict website`.`dt_dict_persons` (
 `Register_ID` INT NOT NULL,
`First_Name` VARCHAR(20) NOT NULL,
 `Last_Name` VARCHAR(20) NOT NULL,
 `Password` INT(10) NOT NULL,
  `Date_of_Birth` DATE NOT NULL,
 `Email` VARCHAR(80) NOT NULL,
`Date_Change_Password` DATETIME(6) NOT NULL,
  PRIMARY KEY (`Register_ID`));

-- 2.	Data table name: dt_News

CREATE TABLE `dict website`.`dt_news` (
  `News_Id` INT NOT NULL,
  `News_Title` VARCHAR(100) NOT NULL,
  `News_Date` DATE NOT NULL,
  `News_Ctgry_No` INT NOT NULL,
  `Source` VARCHAR(200) NOT NULL,
  `News_Content` MEDIUMTEXT NULL,
  `News_Image` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`News_Id`),
  INDEX `News_Ctgry_No_idx` (`News_Ctgry_No` ASC) VISIBLE,
  CONSTRAINT `News_Ctgry_No`
    FOREIGN KEY (`News_Ctgry_No`)
    REFERENCES `dict website`.`dt_news_ctgry` (`News_Ctgry_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- 3.	Data table name: dt_News_Ctgry
 
   CREATE TABLE `dict website`.`dt_news_ctgry` (
  `News_Ctgry_No` INT NOT NULL,
  `News_Catgry_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`News_Ctgry_No`));

-- 4.	Datatable name:  dt_Event

CREATE TABLE `dict website`.`  dt_event` (
  `Evt_ID` INT NOT NULL,
  `Evt_Title` VARCHAR(100) NOT NULL,
  `Evt_Location` VARCHAR(80) NOT NULL,
  `Evt_Date` DATE NOT NULL,
  `Evt_Strt_ tm` TIME NOT NULL,
  `Evt_End_tm` TIME NOT NULL,
  `Evt_Content` MEDIUMTEXT NOT NULL,
  `Evt_Image` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`Evt_ID`));

-- 5.	dt_Book_event

CREATE TABLE `dict website`.`dt_book_event` (
  `Book_No` INT NOT NULL,
  `Evt_ID` INT NOT NULL,
  `Register_ID` INT NOT NULL,
  `Book_Phone_No` VARCHAR(10) NULL,
  PRIMARY KEY (`Book_No`),
  INDEX `Evt_ID_idx` (`Evt_ID` ASC) VISIBLE,
  INDEX `Register_ID_idx` (`Register_ID` ASC) VISIBLE,
  CONSTRAINT `Evt_ID`
    FOREIGN KEY (`Evt_ID`)
    REFERENCES `dict website`.`  dt_event` (`Evt_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Register_ID`
    FOREIGN KEY (`Register_ID`)
    REFERENCES `dict website`.`dt_dict_persons` (`Register_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- 6.	Database name : dt_Deleted_Account

CREATE TABLE `dict website`.`dt_deleted_account` (
  `Deleted_ID` INT NOT NULL,
  `Register_ID` INT(11) NOT NULL,
  `Date_Delete` DATETIME(6) NOT NULL,
  PRIMARY KEY (`Deleted_ID`),
  INDEX `Register_ID_idx` (`Register_ID` ASC) VISIBLE,
  CONSTRAINT `Register_ID_FK`
    FOREIGN KEY (`Register_ID`)
    REFERENCES `dict website`.`dt_dict_persons` (`Register_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- 7.	Database name : Dt_Units

CREATE TABLE `dict website`.` dt_units` (
  `Unit_ID` INT NOT NULL,
  `Unit_Name` VARCHAR(80) NOT NULL,
  `Unit_Code` VARCHAR(20) NOT NULL,
  `Unit_Details` MEDIUMTEXT NOT NULL,
  `Cost` INT NOT NULL,
  `Teacher_Name` VARCHAR(40) NOT NULL,
  `Teacher_Emails` VARCHAR(60) NOT NULL,
  `Description_Unit(` MEDIUMTEXT NOT NULL,
  `Pre_Requisites` MEDIUMTEXT NULL,
  PRIMARY KEY (`Unit_ID`));

-- 8.	Database name : Dt_Courses

CREATE TABLE `dict website`.`dt_courses` (
  `Program_ID` INT NOT NULL,
  `Course_Name` VARCHAR(80) NOT NULL,
  `Unit_ID` INT NOT NULL,
  `Duration` VARCHAR(20) NOT NULL,
  `Fee` INT NOT NULL,
  `Details` MEDIUMTEXT NOT NULL,
  `Entry_Reqs` MEDIUMTEXT NOT NULL,
  `Campus` VARCHAR(60) NOT NULL,
  `Job_Outcome` VARCHAR(80) NOT NULL,
  `Enroll_Type` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Program_ID`),
  INDEX `Unit_ID_idx` (`Unit_ID` ASC) VISIBLE,
  CONSTRAINT `Unit_ID`
    FOREIGN KEY (`Unit_ID`)
    REFERENCES `dict website`.` dt_units` (`Unit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- 9.	Datatable name : Dt_Posts

CREATE TABLE `dict website`.` dt_posts` (
  `Post_ID` INT NOT NULL,
  `Topic_Title` VARCHAR(80) NOT NULL,
  `Description_Post` VARCHAR(200) NOT NULL,
  `Category_ID` INT NOT NULL,
  `Date_Posted` DATETIME(6) NOT NULL,
  `Register_ID` INT NULL,
  `No_Replies` INT NULL,
  PRIMARY KEY (`Post_ID`),
  INDEX `Category_ID_idx` (`Category_ID` ASC),
  INDEX `Register_Post_idx` (`Register_ID` ASC),
  CONSTRAINT `Category_ID`
    FOREIGN KEY (`Category_ID`)
    REFERENCES `dict website`.`dt_postcategory` (`Category_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Register_Post`
    FOREIGN KEY (`Register_ID`)
    REFERENCES `dict website`.`dt_dict_persons` (`Register_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- 10.	 Datatable name : Dt_PostCategory

CREATE TABLE `dict website`.`dt_postcategory` (
  `Category_ID` INT NOT NULL,
  `Category_Name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Category_ID`));
  
-- 11.	 Datatable name : Dt_Reply

CREATE TABLE `dict website`.` dt_reply` (
  `Reply_ID` INT NOT NULL,
  `Post_ID` INT NOT NULL,
  `Register_ID` INT NOT NULL,
  `Rpy_Comment` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`Reply_ID`),
  INDEX `Post_ID_idx` (`Post_ID` ASC),
  INDEX `Regisster_reply_idx` (`Register_ID` ASC),
  CONSTRAINT `Post_ID`
    FOREIGN KEY (`Post_ID`)
    REFERENCES `dict website`.` dt_posts` (`Post_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Regisster_reply`
    FOREIGN KEY (`Register_ID`)
    REFERENCES `dict website`.`dt_dict_persons` (`Register_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- 12.	 Data table name: Dt_Announcement_ID

CREATE TABLE `dict website`.`dt_announcement_id` (
  `Announcement_ID` INT NOT NULL,
  `Register_ID` INT NOT NULL,
  `Ann_Title` VARCHAR(80) NOT NULL,
  `Ann_Body` MEDIUMTEXT NOT NULL,
  `Posted_On` DATETIME(6) NOT NULL,
  PRIMARY KEY (`Announcement_ID`),
  INDEX `Register_ID_Ann_idx` (`Register_ID` ASC) VISIBLE,
  CONSTRAINT `Register_ID_Ann`
    FOREIGN KEY (`Register_ID`)
    REFERENCES `dict website`.`dt_dict_persons` (`Register_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




