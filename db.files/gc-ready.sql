-- INSERT INTO () VALUES ();

-- Type_Hunter
INSERT INTO Types_Hunter (Description) VALUES ("GAME MASTER");
INSERT INTO Types_Hunter (Description) VALUES ("NORMAL PLAYER");

-- Locations
INSERT INTO Locations (Description) VALUES ("Central Science Institute");

-- Drop generated tables to start again (development)
DROP TABLE Books;
drop table Hunter_Stats;
drop table Hunters;
drop table Cards;

-- Card Difficulty
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("SS");
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("A");
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("B");
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("C");
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("D");
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("E");
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("F");
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("G");
INSERT INTO Card_Difficulty (Difficulty_Description) VALUES ("H");

-- Cards (000 - 099)
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Ruler's Blessings", 1, "A Castle given as a prize for winning the contest, town with population 10.000 included. It's Residents will live according to whatever laws and commands you issue.", "000", 1);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Patch of Forest", 3, "The entrance to the giant forest called the Mountain god's garden where many unique endemic species live. They are all tame and friendly.", "001", 1);

-- Type Question : Movies, Animes, Música

-- Question 