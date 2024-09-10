-- Give lots of Jenny for everyone
UPDATE Hunter_Stats SET Jenny_Qtd = 100000000;

-- Grant Game Master role to AndersonGM
UPDATE Hunters SET Type_Hunter_Id = 1 WHERE Username = 'AndersonGM';