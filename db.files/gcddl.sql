CREATE TABLE IF NOT EXISTS Hunters 
( 
 Hunter_Id INT NOT NULL AUTO_INCREMENT,  
 Avatar BLOB,  
 Username VARCHAR(255) NOT NULL,  
 Password VARCHAR(255) NOT NULL,  
 Email VARCHAR(255) NOT NULL,  
 Book_Id INT,  
 Location_Id INT,  
 Type_Hunter_Id INT, 
 UNIQUE (Username),
 UNIQUE(Email),
 PRIMARY KEY (HunterId)
); 

CREATE TABLE book 
( 
 id INT PRIMARY KEY,  
); 

CREATE TABLE Card 
( 
 Title varchar(100),  
 quantity INT,  
 description varchar(500),  
 id INT PRIMARY KEY,  
 card_img image,  
 slot_number INT,  
); 

CREATE TABLE question 
( 
 statement text,  
 id INT PRIMARY KEY,  
 difficulty_code int,  
 idcard INT,  
 idtype_question INT,  
); 

CREATE TABLE type_question 
( 
 type_description varchar(30),  
 id INT PRIMARY KEY,  
); 

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

CREATE TABLE hunter_stats 
( 
 jenny_qtd INT,  
 cards_qtd INT,  
 id INT PRIMARY KEY,  
 idhunter INT,  
); 

CREATE TABLE card_difficulty 
( 
 difficulty_code INT PRIMARY KEY,  
 difficulty_description varchar(5),  
 idcard INT,  
); 

CREATE TABLE location 
( 
 description varchar(500),  
 id INT PRIMARY KEY,  
); 

CREATE TABLE type_hunter 
( 
 description varchar(30),  
 id INT PRIMARY KEY,  
); 

CREATE TABLE book_cards 
( 
 idcard INT PRIMARY KEY,  
 idbook INT,  
); 

CREATE TABLE card_challenge_answer 
( 
 idcard_challenge INT PRIMARY KEY,  
 idanswer INT,  
); 

ALTER TABLE hunter ADD FOREIGN KEY(idbook) REFERENCES book (id);
ALTER TABLE hunter ADD FOREIGN KEY(idlocation) REFERENCES location (id);
ALTER TABLE hunter ADD FOREIGN KEY(idtype_hunter) REFERENCES type_hunter (id);
ALTER TABLE question ADD FOREIGN KEY(difficulty_code) REFERENCES card_difficulty (difficulty_code);
ALTER TABLE question ADD FOREIGN KEY(idcard) REFERENCES card (id);
ALTER TABLE question ADD FOREIGN KEY(idtype_question) REFERENCES type_question (id);
ALTER TABLE card_challenge ADD FOREIGN KEY(idcard) REFERENCES card (id);
ALTER TABLE hunter_stats ADD FOREIGN KEY(idhunter) REFERENCES hunter (id);
ALTER TABLE card_difficulty ADD FOREIGN KEY(idcard) REFERENCES card (id);
ALTER TABLE book_cards ADD FOREIGN KEY(idcard) REFERENCES card (id);
ALTER TABLE book_cards ADD FOREIGN KEY(idbook) REFERENCES book (id);
ALTER TABLE card_challenge_answer ADD FOREIGN KEY(idcard_challenge) REFERENCES card_challenge (id);
ALTER TABLE card_challenge_answer ADD FOREIGN KEY(idanswer) REFERENCES answer (id);