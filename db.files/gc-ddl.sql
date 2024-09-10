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
  Jenny_Qtd BIGINT UNSIGNED,  
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
  Quantity BIGINT UNSIGNED NOT NULL,  
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

-- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Answers
( 
  Content TEXT,  
  Answer_Id INT NOT NULL AUTO_INCREMENT, 
  Hunter_Id INT NOT NULL,
  Question_Id INT NOT NULL,
  PRIMARY KEY (Answer_Id),
  FOREIGN KEY (Hunter_Id) REFERENCES Hunters (Hunter_Id) ON DELETE CASCADE,
  FOREIGN KEY (Question_Id) REFERENCES Questions (Question_Id) ON DELETE CASCADE
);

-- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Card_Challenge 
( 
  Card_Challenge_Id INT NOT NULL AUTO_INCREMENT,  
  Card_Id INT NOT NULL,  
  PRIMARY KEY (Card_Challenge_Id),
  FOREIGN KEY (Card_Id) REFERENCES Cards (Card_Id) ON DELETE CASCADE
); 

-- Criar no sistema (flask)
CREATE TABLE IF NOT EXISTS Card_Challenge_Answer 
( 
  Card_Challenge_Id INT NOT NULL,  
  Answer_Id INT NOT NULL,
  PRIMARY KEY (Card_Challenge_Id, Answer_Id),
  FOREIGN KEY (Card_Challenge_Id) REFERENCES Card_Challenge (Card_Challenge_Id) ON DELETE CASCADE,
  FOREIGN KEY (Answer_Id) REFERENCES Answers (Answer_Id) ON DELETE CASCADE
); 
---------------------------------------------- Views
-- View com todas as informações necessárias sobre o Hunter
CREATE OR REPLACE VIEW All_Hunter_Info AS
SELECT h.Hunter_Id, h.Type_Hunter_Id, h.Location_Id, h.Type_Question_Id AS Type_Question,
hs.Jenny_Qtd, hs.Cards_Qtd, b.Book_Id
FROM Hunters h
INNER JOIN Types_Hunter th ON th.Type_Hunter_Id = h.Type_Hunter_Id
INNER JOIN Hunter_Stats hs ON hs.Hunter_Id = h.Hunter_Id
INNER JOIN Locations l ON l.Location_Id = h.Location_Id
INNER JOIN Types_Question tq ON tq.Type_Question_Id = h.Type_Question_Id
INNER JOIN Books b ON b.Hunter_Id = h.Hunter_Id;

-- View com todas as informações necessárias sobre uma solicitação
-- de desafio de um Hunter
CREATE OR REPLACE VIEW All_Hunter_Answer AS
SELECT h.Hunter_Id, h.Username, q.Statement, a.Content AS Answer, 
a.Answer_Id, c.Card_Id, c.Description, cc.Card_Challenge_Id, b.Book_Id
FROM Hunters h
INNER JOIN Books b ON b.Hunter_Id = h.Hunter_Id
INNER JOIN Answers a ON a.Hunter_Id = h.Hunter_Id
INNER JOIN Card_Challenge_Answer cca ON cca.Answer_Id = a.Answer_Id
INNER JOIN Questions q ON q.Question_Id = a.Question_Id
INNER JOIN Card_Challenge cc ON cc.Card_Challenge_Id = cca.Card_Challenge_Id
INNER JOIN Cards c ON c.Card_Id = cc.Card_Id;

---------------------------------------------- Procedures
-- Procedure para conceder uma carta a um Hunter
-- em caso de desafio vencido
CREATE OR REPLACE PROCEDURE GrantCardToHunterByChallenge(
  IN cardId INT,
  IN bookId INT,
  IN hunterId INT,
  IN answerId INT,
  IN cardChallengeId INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION 
  BEGIN
    ROLLBACK;
  END;
  START TRANSACTION;
  INSERT INTO Books_Cards (Card_Id, Book_Id) VALUES (cardId, bookId);
  UPDATE Hunter_Stats 
  SET Cards_Qtd = (
    SELECT COUNT(DISTINCT Card_Id) FROM Books_Cards
    WHERE Book_Id = bookId
  )
  WHERE Hunter_Id = hunterId;
  UPDATE Cards SET Quantity = Quantity - 1 WHERE Card_Id = cardId;
  DELETE FROM Answers WHERE Answer_Id = answerId;
  DELETE FROM Card_Challenge WHERE Card_Challenge_Id = cardChallengeId;
  COMMIT;
END   

-- Procedure para conceder uma carta a um Hunter
-- em caso de compra de outro hunter
CREATE OR REPLACE PROCEDURE GrantCardToHunterByBuying(
  IN ownerHunterId INT,
  IN buyerHunterId INT,
  IN cardId INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;
  START TRANSACTION;

  INSERT INTO Books_Cards (Card_Id, Book_Id) VALUES (cardId,
  (SELECT Book_Id FROM Books WHERE Hunter_Id = buyerHunterId));

  UPDATE Hunter_Stats SET Jenny_Qtd = Jenny_Qtd - (
    SELECT (20000000 - (Difficulty_Code * 1000)) FROM Cards WHERE Card_Id = cardId
  ) WHERE Hunter_Id = buyerHunterId;

  DELETE FROM Books_Cards WHERE (Card_Id = cardId AND Book_Id = (
    SELECT Book_Id FROM Books WHERE Hunter_Id = ownerHunterId)
  );

  UPDATE Hunter_Stats 
  SET Cards_Qtd = (
    SELECT COUNT(DISTINCT Card_Id) FROM Books_Cards
    WHERE Book_Id = (SELECT Book_Id FROM Books WHERE Hunter_Id = buyerHunterId)
  )
  WHERE Hunter_Id = buyerHunterId;

  UPDATE Hunter_Stats 
  SET Cards_Qtd = (
    SELECT COUNT(DISTINCT Card_Id) FROM Books_Cards
    WHERE Book_Id = (SELECT Book_Id FROM Books WHERE Hunter_Id = ownerHunterId)
  )
  WHERE Hunter_Id = ownerHunterId;
  COMMIT;
END

-- Procedure para retomar a quantidade de cartas
-- caso o Hunter apague a conta
CREATE OR REPLACE PROCEDURE BanOrRemoveHunter (
  IN hunterId INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION 
  BEGIN
    ROLLBACK;
  END;
  START TRANSACTION;
  
  UPDATE Cards c SET c.Quantity = c.Quantity + (
  SELECT COUNT(bc.Card_Id) FROM Books_Cards bc
  WHERE bc.Book_Id = (SELECT b.Book_Id FROM Books b WHERE Hunter_Id = hunterId)
  AND bc.Card_Id = c.Card_Id);

  DELETE FROM Books_Cards WHERE Book_Id = (SELECT Book_Id FROM Books WHERE Hunter_Id = hunterId);
  DELETE FROM Hunter_Stats WHERE Hunter_Id = hunterId;
  DELETE FROM Books WHERE Hunter_Id = hunterId;
  DELETE FROM Answers WHERE Hunter_Id = hunterId;
  DELETE FROM Hunters WHERE Hunter_Id = hunterId;

  COMMIT;
END 