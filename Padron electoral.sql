CREATE DATABASE PadronElectoral

CREATE TABLE provincia(
id_provincia INT PRIMARY KEY NOT NULL,
nombre VARCHAR(25) NOT NULL
);

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

CREATE TABLE Padron (
id_padron INT IDENTITY PRIMARY KEY NOT NULL,
cedula_hash VARBINARY(MAX) NOT NULL,
pin_hash VARBINARY(MAX) NOT NULL,
link VARCHAR (255),
provincia INT NOT NULL,
FOREIGN KEY (provincia) REFERENCES provincia(id_provincia)
);

