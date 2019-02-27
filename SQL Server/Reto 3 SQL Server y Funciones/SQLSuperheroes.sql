/* Marvel Heroes and Villains
 Based on the website http://marvel.wikia.com/Main_Page
 with popularity data from http://observationdeck.io9.com/something-i-found-marvel-character-popularity-poll-cb-1568108064 
 and power grid data from http://marvel.wikia.com/Power_Grid#Power
 Collected by: https://www.khanacademy.org/profile/Mentrasto/
 Adaptado por CK
 */

CREATE TABLE Marvels (ID INT NOT NULL,
    nombre varchar(50),
    popularidad INT,
    alignment [varchar](50),
    genero [varchar](50), 
    altura_m [decimal](18, 2),
    peso_kg [decimal](18, 2),
    pais varchar(50),
    inteligencia INTEGER,
    fuerza INTEGER,
    velocidad INTEGER,
    durabilidad INTEGER,
    energia INTEGER,
    habilidades_de_combate INTEGER, 

	 CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO marvels VALUES(1, 'Spider Man', 1, 'Bueno', 'Masculino', 1.78, 75.75, 'USA', 4, 4, 3, 3, 1, 4); 
INSERT INTO marvels VALUES(2, 'Iron Man', 20, 'Neutral', 'Masculino', 1.98, 102.58, 'USA', 6, 6, 5, 6, 6, 4); 
INSERT INTO marvels VALUES(3, 'Hulk', 18, 'Neutral', 'Masculino', 2.44, 635.29, 'USA', 6, 7, 3, 7, 5, 4); 
INSERT INTO marvels VALUES(4, 'Wolverine', 3, 'Bueno', 'Masculino', 1.6, 88.46, 'Canada', 2, 4, 2, 4, 1, 7);
INSERT INTO marvels VALUES(5, 'Thor', 5, 'Bueno', 'Masculino', 1.98, 290.3, 'Norway', 2, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(6, 'Green Goblin', 91, 'Malo', 'Masculino', 1.93, 174.63, 'USA', 4, 4, 3, 4, 3, 3);
INSERT INTO marvels VALUES(7, 'Magneto', 11, 'Neutral', 'Masculino', 1.88, 86.18, 'Germany', 6, 3, 5, 4, 6, 4);
INSERT INTO marvels VALUES(8, 'Thanos', 47, 'Malo', 'Masculino', 2.01, 446.79, 'Titan', 6, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(9, 'Loki', 32, 'Malo', 'Masculino', 1.93, 238.14, 'Jotunheim', 5, 5, 7, 6, 6, 3);
INSERT INTO marvels VALUES(10, 'Doctor Doom', 19, 'Malo', 'Masculino', 2.01, 188.24, 'Latveria', 6, 4, 5, 6, 6, 4);
INSERT INTO marvels VALUES(11, 'Jean Greay', 8, 'Bueno', 'Feminino', 1.68, 52.16, 'USA', 3, 2, 7, 7, 7, 4);
INSERT INTO marvels VALUES(12, 'Rogue', 4, 'Bueno', 'Feminino', 1.73, 54.43, 'USA', 7, 7, 7, 7, 7, 7);
    