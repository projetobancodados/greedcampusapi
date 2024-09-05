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

-- Criar antes
CREATE TABLE IF NOT EXISTS Card_Difficulty 
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
  FOREIGN KEY (Difficulty_Code) REFERENCES Card_Difficulty (Difficulty_Code) ON DELETE CASCADE
); 

-- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Question 
( 
  Question_Id INT NOT NULL AUTO_INCREMENT,  
  Statement LONGTEXT,  
  Type_Question_Id INT,
  Difficulty_Code INT,
  PRIMARY KEY (Question_Id),
  FOREIGN KEY (Type_Question_Id) REFERENCES Types_Question (Type_Question_Id) ON DELETE CASCADE,
  FOREIGN KEY (Difficulty_Code) REFERENCES Card_Difficulty (Difficulty_Code) ON DELETE CASCADE
);
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



CREATE TABLE book_cards 
( 
 idcard INT PRIMARY KEY,  
 idbook INT,
 FOREIGN KEY (idcard) REFERENCES Cards(Card_Id),
 FOREIGN KEY (idbook) REFERENCES Books(Book_Id)
); 

CREATE TABLE card_challenge_answer 
( 
 idcard_challenge INT PRIMARY KEY,  
 idanswer INT,  
); 


ALTER TABLE book_cards ADD FOREIGN KEY(idcard) REFERENCES card (id);
ALTER TABLE book_cards ADD FOREIGN KEY(idbook) REFERENCES book (id);
ALTER TABLE card_challenge_answer ADD FOREIGN KEY(idcard_challenge) REFERENCES card_challenge (id);
ALTER TABLE card_challenge_answer ADD FOREIGN KEY(idanswer) REFERENCES answer (id);