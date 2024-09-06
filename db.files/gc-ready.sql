-- Drop generated tables to start again (development)
-- DROP TABLE Books;
-- DROP TABLE Hunter_Stats;
-- DROP TABLE Hunters;
-- DROP TABLE Locations;
-- DROP TABLE Types_Hunter;
-- DROP TABLE Question;
-- DROP TABLE Types_Question;
-- DROP TABLE Cards;

-- Select all hunters and sort descending by cards number, then jenny count
-- SELECT h.Hunter_Id, h.Username,
-- CAST(h.Avatar AS CHAR) AS Avatar, hs.Jenny_Qtd, hs.Cards_Qtd
-- From Hunters h
-- INNER JOIN Hunter_Stats hs ON hs.Hunter_Id = h.Hunter_Id
-- ORDER BY hs.Cards_Qtd DESC, hs.Jenny_Qtd DESC;

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
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Plot of Beach", 3, "The entrance to a cave called Posseidon's Cavern. The cave changes its path at each visit, confusing intruders." , "002", 1);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Pitcher of Eternal Water", 17, "A jar from which pure, clean water (1440 liters per day) continually flows." , "003", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Skin Care Hot Springs", 15, "A hot spring that cures you of any skin condition. Bathing in it for half an hour a day gives you skin as soft and smooth as a baby's." , "004", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Spirited Away Hollow",8 , "Enter and then exit this hollow and you wil be transported to a desolate location within the country. Circumstances will allow you to return to where you started without you having to spend any money." , "005", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Liquor spring", 15, "Draw some of this spring's water and one hour later it will become a random alcoholic drink of exquisite taste and extraordinary quality." , "006", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Pregnancy Stone", 10, "Carry a stone (Weighing 7 pounds each) for one month and you will get pregnant, even if you are male. You may chose the sex of the baby by the female or male stone." , "007", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Mystery Pond", 10, "Release one fish into this pond, and there will be one more fish of that type the next day. You can keep any combination of fish in this pond, even saltwater and freshwater fish together!" , "008", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Tree of Plenty",10 , "A tree that bears all sorts of fruit. No matter how much you harvest, it will be full again the next day. The type and number of fruit are random." , "009", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Golden Guidebook", 20, "A travel guide that lists where and when you can meet people of the opposite sex who are your type." , "010", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Golden Scales", 30, "When faced with a two-opition choice, these scales will tell you wich is better for your future." , "011", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Golden Dictionary", 10, "Each day you will find a word glowing gold. You should learn those words because they will come in handy the next day." , "012", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Luck Bankbook", 20, "Refrain from using the little things of good luck in your daily life, and you can accumulate and convert them into cash." , "013", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Connection Servering Scissors", 22, "Cut a picture of someone you don't want to see with these scissors, and you will never see them again. Caution: It will take effect on everyone in the picture (except yourself)." , "014", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fickle Genie", 10, "This genie will grant you there wishes, but you need to suggest 1000 potential, significantly different wishes and he will choose three from among them. No cheating by asking for diffrent increments of money." , "015", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fairy king's advice", 6, "The Fairy King offers you gentle, apt advice on what you lack or what you lack or what you should fix. The annoying thing is he appears when he wants to." , "016", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Angels's Breath", 3, "She cures one person of all wounds and ills, restoring them to perfect health. She will only appear once." , "017", 1);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Imp's Wink", 18, "You will experience the most amazing ecstasy when she winks at you. She can appear multiple times. Be warned, it can get addictive." , "018", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Poltergeist Pillow", 13, "Sleep on this pillow and your astral form will be able to wander at will, but you will turn into a real ghost if you do not return to your body within 24 hours." , "019", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Mood Clock", 30, "This clock sets your current state of mind. Turn it to noon and you will maintain perfect serenity. This you can adjust your emotions according to the situation." , "020", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("X-ray Goggles", 27, "You can see through things. an adjustment dial allows you to set the x-ray depth. The only thing it cannot see through is a pack of spell cards from masadora." , "021", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Toraemon", 22, "A beast on the verge of extinction, it has a habit of stuffing things in its 4-d pocket. You never know what kind of treasures it could have picked up." , "022", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Tome of a Thousand Tales", 30, "A Book that shows you a different story each time you open it. If you want to stay on the same story when you put it down, use the special included bookmark." , "023", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Hypothetical T.V.", 20, "Input a hypothetical situation with the included remote, and this tv will show you a 30-hour documentary of the possibilities. You are also able to record." , "024", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Risky Dice", 30, "A twenty-sided dice with one skull face and 19 star faces. Great thins happen when you roll a star, but rolling the skull will be bad enough to cancel out all the previous great events." , "025", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Night Shift Dwarves", 20, "They can do any work you can do, and they will work as long as you are asleep. They cannot do anything beyond your abilities." , "026", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Book of V.I.P Passes", 25, "You can go anywhere with these passes. Book of 1000." , "027", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Capricious Remote", 27, "A remote control to manipulate ten emotions someone feels toward someone else, on an intensity scale of 1-10. You cannot control how people feel toward you." , "028", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Pre-order Vouchers", 20, "Write the name of any commercially available product on a voucher and you'll be guaranteed to get it regardless of its scarcity (you still have to pay). A book of 1000." , "029", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Favor Cushion", 21, "seat someone on this cushion and he will do one thing for you, so long as it is within his capabilities." , "030", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Double postcard to the dead", 13, "Address and mail this return postagepaid postcard to a deceased person, and you will get a reply the next day. A book of 1000." , "031", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Parrot Candy", 30, "This candy allows for whoever consumes it, to perfectly mimic any voice they can think of. The effects last until the next time something is eaten. Provides 10 packs, each pack containing 50 candies." , "032", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Hormone cookies", 13, "After eating this candy, your sex will temporarily change for 24 hours. A set of 10 boxes, 20 cookies per box." , "033", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Universal Survey", 30, "Write a set of questions about yourself, and whoever you give it to, will answer all of the questions honestly. This is reusable." , "034", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Charmeleon Cat", 6, "An endangered species. Once tamed, it can transform into any animal. However, its mass remains constant, so it will be a tiny elephant or a large hamster, for example. " , "035", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Recycling Room", 10, "Put something broken in this room and it will be repaired as good as new 24 hours later. The door must not be opened until time is up" , "036", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledgling Athlete", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top athlete when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "037", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledgling Artist", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top artist when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "038", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledglin Politician", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a Renowned politician when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "039", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledgling Musician", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top musician when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "040", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledgling Pilot", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a professional pilot when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "041", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledgling Novelist", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a superb writer when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "042", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledgling Gambler", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top gambler when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "043", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledgling Actor", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top actor when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "044", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Fledgling CEO", 30, "Warm this magic egg in your hand for three hours a day for one to ten years, and you will become a top CEO when it hatches. The stronger your desire during incubations, the sooner it will hatch." , "045", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Gold Dust Girl", 13, "A girl who sheds gold dust from her body, 500 grams of gold can be harvested from her daily bath. Very shy, she rarely leaves the house." , "046", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Sleeping girl", 11, "A girl who sleeps in your stead. You can be active for 24 hours without sleeping while she sleeps for you." , "047", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Aromatherapy Girl", 15, "A girl who emits the most comfortable aroma for you. While she's by your side, you will be free of stress." , "048", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Miniature Mermaid", 23, "A mermaid small enough to fit in your hand. A comfortable living enviroment puts her in a good mood, and she will sing with her." , "049", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Miniature Dino", 11, "A dinosaur small enough to fit in your hand. This creature produces a different species of tiny dinosaurs with each new generation." , "050", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Miniature Dragon", 10, "A dragon small enough to fit in your hand. It will obey your comands, and will eventually learn to talk if raised with love." , "051", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Pearl Locusts", 30, "Each of these locusts has a pearl in its abdomen. An outbreack occurs once every dozen years or so." , "052", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("King White Stag Beetle", 30, "It uses special pheromones to lure other insects to build a huge colony. It leaves the colony once a day for an evening stroll." , "053", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Millennium Butterfly", 25, "A legendary insect named from the fact that the family of anyone who captures it will prosper for generations." , "054", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Revenge Shop", 20, "Report your grudges to the manager and he will retaliate for you in proportion to your grievance. Pay extra to request a more severe retaliation." , "055", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Perfect Memory Studio", 25, "Specify a time and date to get a picture of yourself in the past. You may also request a sequence of  fotographs." , "056", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Hideout Realtor", 11, "The agent will build a secret room just for you at a place of your choosing. However, you must not tell anyone about it or bring anybody to it." , "057", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Secrets Video Rental", 13, "Rent videos of other peoples secrets. You must not show the video or discuss its contents with anyone." , "058", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Instant Foreign Language school", 20, "Spend time studying a language at this school, and you will accrue time on a timer (included). while the timer is activated and counting down, you will be fluent." , "059", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Long Lost Delivery", 30, "Call the number and describe the item you lost, and it will be delivered to you the next day. It must be lost for longer than a month." , "060", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Vending check-up", 20, "A full-body medical scan for just 500 jenny. However, the only results are 'all clear' or 'anomaly detected', in which case it is recommended you see a doctor. " , "061", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Club 'You rule'", 20, "Everyone in the club will do your bidding while you are there. However, one hour in the club equals a day outside." , "062", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Virtual Restaurant", 30, "You can order any food you want. You will feel full, but it is only an illusion. You will be given a multivitamin as you leave." , "063", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Witch's Love Potion", 30, "Kiss a pill and have your intended drink it, and he or she will fall in love with you. One pill lasts one week. One vial contains 500 pills." , "064", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Witch's Rejuvenation Potion", 10, "Each pill makes you physically younger by one year. You will retain all knowledge and memories. Beware, as you will die if you take more than your age. One vial contains 100 pills." , "065", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Witch's Diet Pills", 28, "Each pill makes you lose one kg. One vial contains 200 pills. Beware, as you will die if you take more than you weigh." , "066", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Doyen's Growth Pills", 30, "Each pill makes you grow one cm taller. Not recommended for people under 20 years of age. One vial contains 100 pills." , "067", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Doien's Virility Pills", 20, "A certain part of your anatomy will get very frisky. Both endurance and frequency are enhanced. One vial contains 500 pills." , "068", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Doien's hair Restorer", 30, "Luxurious hair will grow wherever it is applied. Use gloves, or hair will grow on fingers and palms. One vial contains 200 ml (enough to cover ten heads)." , "069", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Mad scientist's Steroids", 16, "Get all the muscles you want without exercise. You must drink a litter a day for a week, and it tastes horrible. A seven-box set, with ten one liter bottles per box." , "070", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Mad scientist's Pheromones", 20, "Spray on your body to attract the opposite sex. However, you cannot adjust the strength of its effect, so be careful as it may cause a proliferation of stalkers." , "071", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Mad scientist's Plastic Surgery", 15, "Scan a picture of the face you want and you will end up an exact likeness. Each surgery carries a 5% chance of failure, and a 1% chance the machine itself will break." , "072", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Night Jade", 15, "A jewel 'blessed' by the devil. When danger is about to befall its owner, it will deflect it to someone else." , "073", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Sage's aquamarine", 11, "Its owner will have many intelligent friends and keep those friendships for their entire lives." , "074", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Wild Luck Alexandrite", 20, "Its owner will get to have once-in-a-lifetime experiences, though you cannot choose whether they are for better or for worse..." , "075", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Roaming Ruby", 30, "The owner of this ruby will gain immense wealth, but will never be able to remain in the same place fot more than a week." , "076", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Bealty Magnet Emerald", 10, "Specialists offering bealty services will flock to its owner, who will shine with heretofore unrecognized bealty." , "077", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Lonely Sapphire", 30, "The owner of this saphire will acquire vast wealth, but in exchange will spend a lifetime alone, forsaken by friends, family, and significant others." , "078", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Rainbow Diamond", 20, "A diamond that shines in a rainbow of collors. Propose with this diamond and she is guaranteed to say 'yes'." , "079", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Levitation Stone", 7, "A stone about one carat in size that levitates. It can levitate one person, and receives energy from sunlight." , "080", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Blue Planet", 5, "A unique blue jewel. Its composition does not correspond to any know mineral, so it was given this name to mean 'a gift from space'." , "081", 1);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Staff of Judgement", 15, "Raise this staf in the air while calling out the name of someone you want to punish, and calamity will befall the one of you who has committed more bad deeds, the target or tourself." , "082", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Sword of Truth", 22, "Splits in two anyting and anyone deceitful. In trials, it's a criminal's worst nightmare. The sword will shatter when used to cut something true, but will regenerate if stored in its scabbard for one day." , "083", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Paladin's necklace", 60, "A player wearing this will reflect curses cast upon him, and be able to undo curses placed on cards he touches." , "084", 6);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Sacrifice Armor", 8, "Renders ineffective any attack by a weapon reverted from a card. Beware, as it will randomly break sometime within the first 100 attacks." , "085", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Quiver of Frustation", 11, "You will be able to cast as many 'leave' cards as you have arrows. It comes with 10 arrows, and one will be used each time you cast 'leave'." , "086", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Shield of Faith", 15, "The spells 'relegate', 'return', 'drift', and 'collision' will be rended ineffective within a radius of 20 meters of the player armed with this shield." , "087", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Eternal Hammer", 15, "Anyone hit with this hammer will be afflicted with one random attack spell, and cannot defend him or herself with a defensive spell. However, it will not work on someone using 'paladin's necklace' or spell card 'fortress'." , "088", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Tax Collector's Gauntlet", 20, "Grants you the ability to cast 'levy'. However, it will destroy one random specified slot card from your binder every time. You cannot cast it if your specified slots are empty." , "089", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Memory Helmet", 20, "You will never forget thingd you see or hear while wearing this helmet. Unfortunately, it's extremely large and heavy." , "090", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Plastic King", 20, "Recombine the parts of this 1:1 scale model kit to build any kind of vehicle. Fully functional, fuel not included." , "091", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Swap Ticket", 7, "Rip the ticket and give it to someone you want to switch with, and you can live his/her life for 24 hours. Book of 1000." , "092", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Book of Life", 28, "An encyclopedia of everyone who's been in your life sinse your birth, with records of conversations and memorable incidents. It may end up being tens of thousands of pages long." , "093", 4);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Bandit's Blade", 10, "A successful attack with this weapon will cast 'mug','pickpoket', or 'thief' on the target. Not effective on someone using 'Paladin's Necklace' or spell card 'Fortress'." , "094", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Secret Cape", 20, "You will be under the effect of 'Blackout Curtain' while wearing this cape." , "095", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Claivoryant", 12, "Feed it card rank C or above, and it will spit up a 'Claivoryant'." , "096", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("3-D Camera", 20, "Pictures taken with this will be developed as 3-D objects, with all textures reproduced. Make Enlargements as needed." , "097", 3);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Silver Dog", 8, "An endangered species with silver fur. Mix five grams of gold into its food everyday and it will excrete one kilogram of solid silver feces." , "098", 2);
INSERT INTO Cards (Title, Quantity, Description, Slot_Number, Difficulty_Code) VALUES ("Panda Maid", 6, "An endangered species. Very neat and loves to cook, and each has a hobby such as sewing or gardening. They are excellent at taking care of human children." , "099", 2);
-- Type Question : Movies, Animes, Música

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
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o verdadeiro nome de L em "Death Note"?', 1, 1);

-- Music Questions - Type_Question_Id (2)
-- INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ("", 2, 1);

-- Movie Questions - Type_Question_Id (3)
-- INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ("", 3, 1);

---------------------- MOCK DATA ------------------------
-- Insert some cards on someone's Book
-- INSERT INTO Books_Cards (Book_Id, Card_Id) VALUES ();