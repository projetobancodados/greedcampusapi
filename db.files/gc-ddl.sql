---------------------------------------------- Tabelas e relacionamentos definidos
--- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Types_Hunter 
( 
  Description VARCHAR(30) NOT NULL,  
  Type_Hunter_Id INT NOT NULL AUTO_INCREMENT, 
  PRIMARY KEY (Type_Hunter_Id)
); 

--- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Locations
( 
  Location_Id INT NOT NULL AUTO_INCREMENT,  
  Description VARCHAR(500) NOT NULL,  
  Xaxis INT NOT NULL,
  Yaxis INT NOT NULL,
  PRIMARY KEY (Location_Id)
);

--- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Types_Question 
( 
  Type_Question_Id INT NOT NULL AUTO_INCREMENT,  
  Description varchar(30) NOT NULL,
  PRIMARY KEY (Type_Question_Id)
);

--- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Hunters 
( 
  Hunter_Id INT NOT NULL AUTO_INCREMENT,  
  Avatar LONGBLOB,  
  Username VARCHAR(255) NOT NULL,  
  Password VARCHAR(255) NOT NULL,  
  Email VARCHAR(255) NOT NULL,  
  Location_Id INT,  
  Type_Hunter_Id INT, 
  Type_Question_Id INT,
  UNIQUE (Username),
  UNIQUE(Email),
  PRIMARY KEY (Hunter_Id),
  FOREIGN KEY (Location_Id) REFERENCES Locations (Location_Id) ON DELETE CASCADE,
  FOREIGN KEY (Type_Hunter_Id) REFERENCES Types_Hunter (Type_Hunter_Id) ON DELETE CASCADE,
  FOREIGN KEY (Type_Question_Id) REFERENCES Types_Question (Type_Question_Id) ON DELETE CASCADE
); 

--- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Hunter_Stats 
(
  Hunter_Stats_Id INT NOT NULL AUTO_INCREMENT,
  Jenny_Qtd BIGINT,  
  Cards_Qtd INT,  
  Hunter_Id INT NOT NULL,
  PRIMARY KEY (Hunter_Stats_Id),
  FOREIGN KEY (Hunter_Id) REFERENCES Hunters (Hunter_Id) ON DELETE CASCADE
);

--- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Books
( 
  Book_Id INT NOT NULL AUTO_INCREMENT,
  Hunter_Id INT NOT NULL,
  PRIMARY KEY (Book_Id),
  FOREIGN KEY (Hunter_Id) REFERENCES Hunters (Hunter_Id) ON DELETE CASCADE
);

-- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Cards_Difficulty 
( 
 Difficulty_Code INT NOT NULL AUTO_INCREMENT,  
 Difficulty_Description Varchar(10),
 PRIMARY KEY (Difficulty_Code)
); 

--- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Cards 
( 
  Title Varchar(500) NOT NULL,  
  Quantity INT NOT NULL,  
  Description varchar(500) NOT NULL,  
  Card_Id INT NOT NULL AUTO_INCREMENT,  
  Card_Img LONGBLOB,  
  Slot_Number Varchar(20),
  Difficulty_Code INT NOT NULL,  
  PRIMARY KEY (Card_Id),
  FOREIGN KEY (Difficulty_Code) REFERENCES Cards_Difficulty (Difficulty_Code) ON DELETE CASCADE
); 

-- Criar no sistema (flask)
CREATE TABLE Books_Cards 
( 
  Card_Id INT NOT NULL,  
  Book_Id INT NOT NULL,
  PRIMARY KEY (Card_Id, Book_Id),
  FOREIGN KEY (Card_Id) REFERENCES Cards(Card_Id),
  FOREIGN KEY (Book_Id) REFERENCES Books(Book_Id)
);

-- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Questions 
( 
  Question_Id INT NOT NULL AUTO_INCREMENT,  
  Statement LONGTEXT,  
  Type_Question_Id INT,
  Difficulty_Code INT,
  PRIMARY KEY (Question_Id),
  FOREIGN KEY (Type_Question_Id) REFERENCES Types_Question (Type_Question_Id) ON DELETE CASCADE,
  FOREIGN KEY (Difficulty_Code) REFERENCES Cards_Difficulty (Difficulty_Code) ON DELETE CASCADE
);

---------------------------------------------- Views
CREATE OR REPLACE VIEW IF NOT EXISTS All_Hunter_Info AS
SELECT h.Hunter_Id, h.Type_Hunter_Id, h.Location_Id, h.Type_Question_Id,
hs.Jenny_Qtd, hs.Cards_Qtd, b.Book_Id
FROM Hunters h
INNER JOIN Types_Hunter th ON th.Type_Hunter_Id = h.Type_Hunter_Id
INNER JOIN Hunter_Stats hs ON hs.Hunter_Id = h.Hunter_Id
INNER JOIN Locations l ON l.Location_Id = h.Location_Id
INNER JOIN Types_Question tq ON tq.Type_Question_Id = h.Type_Question_Id
INNER JOIN Books b ON b.Hunter_Id = h.Hunter_Id;


---------------------------------------------- Procedures


---------------------------------------------- Corrigir a partir daqui
CREATE TABLE answer 
( 
 content text,  
 id INT PRIMARY KEY,  
); 

CREATE TABLE card_challenge 
( 
 id INT PRIMARY KEY,  
 idcard INT,  
); 

 
CREATE TABLE card_challenge_answer 
( 
 idcard_challenge INT PRIMARY KEY,  
 idanswer INT,  
); 


ALTER TABLE card_challenge_answer ADD FOREIGN KEY(idcard_challenge) REFERENCES card_challenge (id);
ALTER TABLE card_challenge_answer ADD FOREIGN KEY(idanswer) REFERENCES answer (id);