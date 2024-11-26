create database RegistroDeVoto

CREATE TABLE candidatos (
  candidato_id int  PRIMARY KEY NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  partido VARCHAR(35) NOT NULL,
  provincia VARCHAR(20) NOT NULL,
) 

INSERT INTO candidatos(candidato_id, nombre, partido, provincia) VALUES
(1, 'Yasiel Gomez', 'Patria', 'Panamá'),
(2, 'Francisco Herrera', 'Democrático', 'Chiriquí'),
(3, 'Ivan Wu', 'Comunista', 'Colón');


CREATE TABLE provincias (
  id_provincia int  PRIMARY KEY NOT NULL,
  nombre varchar(20) NOT NULL
  )

INSERT INTO provincias (id_provincia, nombre) VALUES
(1, 'Bocas del Toro'),
(2, 'Coclé'),
(3, 'Colón'),
(4, 'Chiriquí'),
(5, 'Darién'),
(6, 'Herrera'),
(7, 'Los Santos'),
(8, 'Panamá'),
(9, 'Veraguas')

CREATE TABLE votos (
  voto_id int PRIMARY KEY NOT NULL,
  Candidato_id INT DEFAULT NULL,
  Provincia VARCHAR(30) DEFAULT NULL,
) 

ALTER TABLE votos
  ADD CONSTRAINT votos_ibfk_2 FOREIGN KEY (candidato_id) REFERENCES candidatos (candidato_id);
