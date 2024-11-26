CREATE DATABASE PadronElectoral

CREATE TABLE provincia(
id_provincia INT PRIMARY KEY NOT NULL,
nombre VARCHAR(25) NOT NULL
);

INSERT INTO provincias (id_provincia, nombre) VALUES
(1, 'Bocas del Toro'),
(2, 'Cocl�'),
(3, 'Col�n'),
(4, 'Chiriqu�'),
(5, 'Dari�n'),
(6, 'Herrera'),
(7, 'Los Santos'),
(8, 'Panam�'),
(9, 'Veraguas')

CREATE TABLE Padron (
id_padron INT IDENTITY PRIMARY KEY NOT NULL,
cedula_hash VARBINARY(64) NOT NULL,
pin_hash VARBINARY(64) NOT NULL,
link VARCHAR (255),
provincia INT NOT NULL,
FOREIGN KEY (provincia) REFERENCES provincia(id_provincia)
);

