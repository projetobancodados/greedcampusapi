-- Drop generated tables to start again (development)
-- DROP TABLE Books;
-- DROP TABLE Hunter_Stats;
-- DROP TABLE Hunters;
-- DROP TABLE Locations;
-- DROP TABLE Types_Hunter;
-- DROP TABLE Question;
-- DROP TABLE Types_Question;
-- DROP TABLE Cards;

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
INSERT INTO Cards_Difficulty (Difficulty_Description) VALUES ("S");
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

-- 1  - 10  : Difficulty 1
-- 11 - 20  : Difficulty 2
-- 21 - 30  : Difficulty 3
-- 31 - 40  : Difficulty 4
-- 41 - 50  : Difficulty 5
-- 51 - 60  : Difficulty 6
-- 61 - 70  : Difficulty 7
-- 71 - 80  : Difficulty 8
-- 81 - 90  : Difficulty 9
-- 91 - 100 : Difficulty 10

-- Anime Questions - Type_Question_Id (1)
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o verdadeiro nome de L em "Death Note"?', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Neon Genesis Evangelion", qual é a razão pela qual os Eva-01 podem se mover sem energia por 5 minutos?', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da espada usada por Guts em "Berserk"?', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "One Piece", qual é a recompensa atual de Monkey D. Luffy? (Depois de Wano)', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o verdadeiro autor dos mangás dentro do anime "Bakuman"?', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Naruto", qual é o nome completo do Quarto Hokage?', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Your Lie in April" (Shigatsu wa Kimi no Uso)?', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Attack on Titan", qual é a verdadeira identidade do Titã Colossal?', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do jogo jogado em "Sword Art Online"?', 1, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a habilidade do Stand "The World" em "JoJos Bizarre Adventure: Stardust Crusaders"?', 1, 1);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do líder dos Cavaleiros do Zodíaco de Bronze em "Saint Seiya"?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Fullmetal Alchemist", qual é o nome da substância que os alquimistas querem criar?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do Digimon parceiro de Tai em "Digimon Adventure"?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da organização terrorista em "Akira"?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o principal antagonista em "Yu Yu Hakusho"?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Dragon Ball Z", qual é o verdadeiro nome de Piccolo?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do notebook usado para matar pessoas em "Death Note"?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da cidade onde se passa "Cowboy Bebop"?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do shinigami que acompanha Light em "Death Note"?', 1, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da escola em que Ichigo Kurosaki estuda em "Bleach"?', 1, 2);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "One Piece", qual é a fruta do diabo que Luffy comeu?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da irmã de Edward Elric em "Fullmetal Alchemist"?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do principal antagonista em "Dragon Ball Z"?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a habilidade especial de Gon Freecss em "Hunter x Hunter"?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do cachorro de Inuyasha em "Inuyasha"?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista em "Trigun"?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a profissão de Migi em "Parasyte"?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do líder da guilda Fairy Tail em "Fairy Tail"?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a profissão de Tatsu em "The Way of the Househusband"?', 1, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Samurai Champloo"?', 1, 3);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do demônio dentro de Naruto?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Attack on Titan"?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a habilidade de Natsu Dragneel em "Fairy Tail"?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "My Hero Academia"?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do irmão mais novo de Edward Elric em "Fullmetal Alchemist"?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Tokyo Ghoul"?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a habilidade especial de Killua Zoldyck em "Hunter x Hunter"?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Sword Art Online"?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do demônio que acompanha Allen Walker em "D.Gray-man"?', 1, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Blue Exorcist"?', 1, 4);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Black Clover"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "One Punch Man"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a habilidade especial de Meliodas em "The Seven Deadly Sins"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Assassination Classroom"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "The Promised Neverland"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Demon Slayer: Kimetsu no Yaiba"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Dr. Stone"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Fire Force"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Re:Zero"?', 1, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Kaguya-sama: Love Is War"?', 1, 5);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Mob Psycho 100"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Vinland Saga"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Jujutsu Kaisen"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Beastars"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Attack on Titan"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "The Rising of the Shield Hero"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "That Time I Got Reincarnated as a Slime"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Food Wars!"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "The Quintessential Quintuplets"?', 1, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Rent-A-Girlfriend"?', 1, 6);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Your Name"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "A Silent Voice"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Weathering With You"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Promare"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Children of the Whales"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "The Garden of Words"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "A Place Further than the Universe"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Anohana: The Flower We Saw That Day"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "March Comes in Like a Lion"?', 1, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Charlotte"?', 1, 7);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Orange"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Erased"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "ReLife"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Your Lie in April"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Toradora!"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Clannad"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Angel Beats!"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Sword Art Online"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "No Game No Life"?', 1, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "KonoSuba"?', 1, 8);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Steins;Gate"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Re:Zero"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "The Rising of the Shield Hero"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "That Time I Got Reincarnated as a Slime"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Overlord"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Goblin Slayer"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "The Saga of Tanya the Evil"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Log Horizon"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "The Devil Is a Part-Timer!"?', 1, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Miss Kobayashis Dragon Maid"?', 1, 9);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Attack on Titan"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Naruto"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "One Piece"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Dragon Ball Z"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Bleach"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "My Hero Academia"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Demon Slayer: Kimetsu no Yaiba"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Sword Art Online"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Death Note"?', 1, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista de "Fullmetal Alchemist"?', 1, 10);

-- Music Questions - Type_Question_Id (2)
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é conhecido como o "Rei do Rock and Roll"?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora é famosa pela canção "Que Sera, Sera"?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica foi pioneira no rock and roll, influenciando várias bandas futuras?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual canção de Chuck Berry é considerada uma das primeiras músicas de rock and roll?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor popularizou a música "Blueberry Hill"?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica é conhecida como "The Fab Four"?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora de soul foi apelidada de "Queen of Soul"?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda californiana é conhecida pelo sucesso "Good Vibrations"?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica lançou o álbum "Their Satanic Majesties Request"?', 2, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor é famoso por "Sittin" on the Dock of the Bay"?', 2, 1);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica é conhecida pelo álbum "The Dark Side of the Moon"', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual artista jamaicano popularizou o reggae mundialmente?', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda sueca ganhou o Eurovision Song Contest com "Waterloo"?', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou o álbum "Born to Run" em 1975?', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica lançou o álbum "Led Zeppelin IV"?', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor é conhecido como o "Rei do Pop"?', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora é famosa pelo álbum "Like a Virgin"?', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica lançou "The Joshua Tree"?', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda americana de heavy metal lançou "Master of Puppets"?', 2, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou "Purple Rain" e estrelou um filme com o mesmo nome?', 2, 2);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de Seattle é considerada uma das principais do movimento grunge?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora canadense é conhecida pelo álbum "Jagged Little Pill"?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual grupo britânico feminino popularizou músicas como "Wannabe"?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock alternativo lançou o álbum "OK Computer"?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper é famoso pela canção "California Love"?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou o álbum "The Fame" em 2008?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica é conhecida pelo álbum "A Rush of Blood to the Head"?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora americana lançou o álbum "Teenage Dream" em 2010?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou o álbum "The Marshall Mathers LP"?', 2, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock alternativo lançou "American Idiot"?', 2, 3);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou o álbum "25" em 2015?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual grupo de K-pop lançou o álbum "Love Yourself: Tear"?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou o álbum "DAMN." em 2017?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "Bad Guy" em 2019?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock alternativo lançou "Tranquility Base Hotel & Casino"?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou o álbum "After Hours" com o hit "Blinding Lights"?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "Folklore" em 2020?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual grupo lançou a música "Dynamite" que se tornou um sucesso mundial?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou "Montero (Call Me By Your Name)" em 2021?', 2, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou o álbum "Future Nostalgia" em 2020?', 2, 4);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor é famoso pela canção "Blue Suede Shoes"?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual foi o primeiro álbum dos Beatles a ser lançado nos Estados Unidos?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual foi o último álbum de estúdio dos Beatles?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda lançou o álbum "Rumours" em 1977?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor é conhecido pela canção "Great Balls of Fire"?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora é famosa pelo hit "Respect"?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor jamaicano lançou o álbum "Legend" em 1984?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de hard rock é conhecida por "Back in Black"?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor é famoso por "Rocket Man" e "Tiny Dancer"?', 2, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica é conhecida por "Bohemian Rhapsody"?', 2, 5);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda é famosa pelo álbum "Appetite for Destruction"?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda grunge lançou o álbum "Ten"?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "What is the 411?" em 1992?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica lançou "Definitely Maybe" em 1994?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper é famoso pelo álbum "Illmatic"?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda é conhecida pela música "Sweet Child O Mine"?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou "Life After Death" postumamente em 1997?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual grupo feminino lançou "CrazySexyCool" em 1994?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou o álbum "Confessions" em 2004?', 2, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de pop punk é conhecida por "Enema of the State"?', 2, 6);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda britânica lançou "Parachutes" em 2000?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou o álbum "Back to Black" em 2006?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock alternativo lançou "Elephant" em 2003?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou o álbum "Graduation" em 2007?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora é famosa pelo hit "Single Ladies (Put a Ring on It)"?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock é conhecida pelo álbum "Hot Fuss"?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou o álbum "÷" (Divide) em 2017?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock lançou "AM" em 2013?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper é famoso pela música "Sicko Mode"?', 2, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "When We All Fall Asleep, Where Do We Go?" em 2019?', 2, 7);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock alternativo é conhecida pelo álbum "Blurryface"?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor é famoso pela música "Old Town Road"?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual grupo lançou o álbum "After Hours" em 2020?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou o álbum "SOUR" em 2021?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock lançou "Humbug" em 2009?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou o álbum "Astroworld" em 2018?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou o álbum "Hollywood is Bleeding" em 2019?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "Wrecking Ball" em 2013?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de rock alternativo lançou "Tranquility Base Hotel & Casino"?', 2, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou "Good Kid, M.A.A.D City" em 2012?', 2, 8);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda de pop rock é conhecida pelo álbum "Overexposed"?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor é famoso pela música "Shape of You"?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou o álbum "1989" em 2014?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou o álbum "The Life of Pablo" em 2016?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda lançou "Viva La Vida or Death and All His Friends" em 2008?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou "Purpose" em 2015?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual grupo lançou "Blinding Lights" em 2020?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou "YHLQMDLG" em 2020?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "Future Nostalgia" em 2020?', 2, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou "Call Me If You Get Lost" em 2021?', 2, 9);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual grupo lançou o hit "Butter" em 2021?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "Happier Than Ever" em 2021?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor é famoso pela música "Levitating"?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda lançou "Californication" em 1999?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantor lançou "24K Magic" em 2016?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual rapper lançou "Donda" em 2021?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual grupo lançou "My Universe" com Coldplay em 2021?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "Easy On Me" em 2021?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual banda lançou o álbum "Medicine at Midnight" em 2021?', 2, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual cantora lançou "Plastic Hearts" em 2020?', 2, 10);


-- Movie Questions - Type_Question_Id (3)
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('*Em "O Iluminado" (1980), de Stanley Kubrick, qual é a frase que Jack Torrance digita repetidamente na máquina de escrever?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome verdadeiro do protagonista de "O Clube da Luta" (1999), interpretado por Edward Norton?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Donnie Darko" (2001), qual é o nome do coelho que aparece para Donnie?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a última linha dita por Deckard no "Blade Runner" (1982) original?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('No filme "Cidade de Deus" (2002), quem é o autor do livro no qual o filme é baseado?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "O Grande Lebowski" (1998), qual é a bebida preferida do "Dude"?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da inteligência artificial em "2001: Uma Odisseia no Espaço" (1968)?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o título original do filme "A Vida é Bela" (1997) de Roberto Benigni?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "O Silêncio dos Inocentes" (1991), qual é a profissão de Clarice Starling?', 3, 1);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem dirigiu "O Sexto Sentido" (1999)?', 3, 1);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Matrix" (1999), qual é o nome do personagem interpretado por Keanu Reeves?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do vilão em "No Country for Old Men" (2007)?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem interpretou a personagem de Clarice Starling em "O Silêncio dos Inocentes" (1991)?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual filme de 1994 é conhecido pela frase "Run, Forrest, Run!"?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Clube dos Cinco" (1985), quantos estudantes estão em detenção?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "De Volta para o Futuro" (1985), qual é o nome do cientista amigo de Marty McFly?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o diretor de "Titanic" (1997)?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é a cidade natal de Rocky Balboa na franquia "Rocky"?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual filme de 1984 popularizou a frase "I wll be back"?', 3, 2);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o protagonista de "O Grande Truque" (2006)?', 3, 2);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do robô protagonista em "Wall-E" (2008)?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Toy Story" (1995), qual é o nome do cowboy de brinquedo?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual filme da Pixar tem uma sequência intitulada "Procurando Dory" (2016)?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem interpretou Jack Dawson em "Titanic" (1997)?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do planeta natal de Superman?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Jurassic Park" (1993), quem dirige o parque?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do primeiro filme da série "Piratas do Caribe"?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem dirigiu "O Senhor dos Anéis: A Sociedade do Anel" (2001)?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Os Vingadores" (2012), quem é o vilão principal?', 3, 3);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da princesa em "A Bela e a Fera" (1991)?', 3, 3);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do herói em "Homem-Aranha" (2002)?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "O Rei Leão" (1994), quem é o pai de Simba?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do brinquedo astronauta em "Toy Story"?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da franquia de filmes sobre robôs alienígenas que se transformam em veículos?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do personagem principal de "Harry Potter"?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o vilão principal em "Star Wars: Episódio IV - Uma Nova Esperança" (1977)?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Os Incríveis" (2004), qual é o superpoder do Sr. Incrível?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do personagem azul em "Avatar" (2009)?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Shrek" (2001), qual é o nome do burro que é amigo de Shrek?', 3, 4);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da vilã em "101 Dálmatas" (1961)?', 3, 4);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o protagonista de "Indiana Jones"?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do parque temático com dinossauros em "Jurassic Park"?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do panda em "Kung Fu Panda" (2008)?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do brinquedo cowboy em "Toy Story"?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do personagem principal de "Ratatouille" (2007)?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o herói de "Homem de Ferro" (2008)?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do robô no filme "Big Hero 6" (2014)?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Frozen" (2013), quem canta "Let It Go"?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do filme onde um peixe-palhaço busca seu filho?', 3, 5);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o melhor amigo do Homem-Aranha?', 3, 5);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "O Senhor dos Anéis", quem é o portador do anel?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do monstro gigante que destrói cidades no Japão?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Star Wars", quem é o pai de Luke Skywalker?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o vilão em "O Cavaleiro das Trevas" (2008)?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do mago em "O Senhor dos Anéis"?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem dirigiu "E.T. - O Extraterrestre" (1982)?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do herói em "Batman Begins" (2005)?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Harry Potter", qual é o nome da escola de magia?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da princesa em "Aladdin" (1992)?', 3, 6);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "A Pequena Sereia", qual é o nome da sereia principal?', 3, 6);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o protagonista de "Madagascar" (2005)?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do brinquedo astronauta em "Toy Story"?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Shrek", qual é o nome do ogro protagonista?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do ratinho chef em "Ratatouille"?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o personagem principal em "O Rei Leão"?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Star Wars", quem é o mestre de Obi-Wan Kenobi?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do dragão em "Como Treinar o Seu Dragão" (2010)?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Os Incríveis", qual é o poder de Violeta?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do herói em "Capitão América: O Primeiro Vingador" (2011)?', 3, 7);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Toy Story", qual é o nome do dono dos brinquedos?', 3, 7);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do planeta natal de Superman?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o vilão principal em "Os Vingadores" (2012)?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Batman", qual é o nome do mordomo de Bruce Wayne?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da heroína em "Mulher-Maravilha" (2017)?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Frozen", qual é o nome da irmã de Elsa?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do protagonista em "O Hobbit"?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o protagonista de "Guardiões da Galáxia" (2014)?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Toy Story", qual é o nome do dinossauro de brinquedo?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o vilão em "Pantera Negra" (2018)?', 3, 8);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do robô em "Wall-E"?', 3, 8);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do carro de corrida em "Carros" (2006)?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Toy Story", qual é o nome do porquinho cofrinho?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do peixe-palhaço em "Procurando Nemo"?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Os Incríveis", qual é o poder do Flecha?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do vilão em "Thor: Ragnarok" (2017)?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o melhor amigo de Buzz Lightyear em "Toy Story"?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Os Vingadores", qual é o nome do deus do trovão?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da heroína em "Mulher-Maravilha"?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o protagonista de "O Senhor dos Anéis"?', 3, 9);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do cavaleiro negro em "Star Wars"?', 3, 9);

INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "Harry Potter", qual é o nome do diretor de Hogwarts?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do super-herói que tem uma armadura de ferro?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o vilão em "O Rei Leão"?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome da mãe de Nemo em "Procurando Nemo"?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Em "O Rei Leão", quem é o melhor amigo de Simba?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do vilão em "Os Incríveis"?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o protagonista de "A Pequena Sereia"?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do brinquedo cowboy em "Toy Story"?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Quem é o herói de "Homem-Aranha"?', 3, 10);
INSERT INTO Questions (Statement, Type_Question_Id, Difficulty_Code) VALUES ('Qual é o nome do filme onde um brinquedo astronauta e um cowboy são amigos?', 3, 10);
