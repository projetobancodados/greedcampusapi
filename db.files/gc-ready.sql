-- Drop generated tables to start again (development)
DROP TABLE Books;
DROP TABLE Hunter_Stats;
DROP TABLE Hunters;
DROP TABLE Locations;
DROP TABLE Types_Hunter;
DROP TABLE Question;
DROP TABLE Types_Question;
DROP TABLE Cards;

-- INSERT INTO () VALUES ();

-- Type_Hunter
INSERT INTO Types_Hunter (Description) VALUES ("GAME MASTER");
INSERT INTO Types_Hunter (Description) VALUES ("NORMAL PLAYER");

-- Locations
INSERT INTO Locations (Description, Xaxis, Yaxis) VALUES ("Central Science Institute", 62, 37);
INSERT INTO Locations (Description, Xaxis, Yaxis) VALUES ("Education Institute", 45, 35);
INSERT INTO Locations (Description, Xaxis, Yaxis) VALUES ("Art Institute", 54, 36);
INSERT INTO Locations (Description, Xaxis, Yaxis) VALUES ("Biology Institute", 58, 50);
INSERT INTO Locations (Description, Xaxis, Yaxis) VALUES ("Computer Science Institute", 76, 35);
INSERT INTO Locations (Description, Xaxis, Yaxis) VALUES ("Olympic Center", 85, 80);
INSERT INTO Locations (Description, Xaxis, Yaxis) VALUES ("Central Library", 71, 37);

-- Type Question : Movies, Animes, Música
INSERT INTO Types_Question (Description) VALUES ("Anime");
INSERT INTO Types_Question (Description) VALUES ("Music");
INSERT INTO Types_Question (Description) VALUES ("Movie");

-- Card Difficulty
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("SS");
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("A");
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("B");
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("C");
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("D");
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("E");
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("F");
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("G");
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("H");

-- Cards (000 - 099)
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Ruler's Blessings", 1, "A Castle given as a prize for winning the contest, town with population 10.000 included. It's Residents will live according to whatever laws and commands you issue.", "000", 1);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Patch of Forest", 3, "The entrance to the giant forest called the Mountain god's garden where many unique endemic species live. They are all tame and friendly.", "001", 1);

-- Question 

-- 1  - 11  : Difficulty 1
-- 12 - 22  : Difficulty 2
-- 23 - 33  : Difficulty 3
-- 34 - 44  : Difficulty 4
-- 45 - 55  : Difficulty 5
-- 56 - 66  : Difficulty 6
-- 67 - 77  : Difficulty 7
-- 78 - 88  : Difficulty 8
-- 89 - 100 : Difficulty 9

-- Anime Questions - Type_Question_Id (1)
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ("", 1, 1);

-- Music Questions - Type_Question_Id (2)
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ("", 2, 1);

-- Movie Questions - Type_Question_Id (3)
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ("", 3, 1);