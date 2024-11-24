create database RegistroDeVoto
go

use RegistroDeVoto
go

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
  voto_id INT IDENTITY PRIMARY KEY NOT NULL,
  Candidato_id INT DEFAULT NULL,
  Provincia VARCHAR(30) DEFAULT NULL,
) 

ALTER TABLE votos
  ADD CONSTRAINT votos_ibfk_2 FOREIGN KEY (candidato_id) REFERENCES candidatos (candidato_id);

    --inserts de votos 
  INSERT INTO votos (Candidato_id, Provincia) VALUES
(1, 'Panamá'),
(2, 'Chiriquí'),
(3, 'Colón'),
(1, 'Panamá'),
(2, 'Chiriquí'),
(3, 'Colón'),
(1, 'Coclé'),
(2, 'Veraguas'),
(3, 'Bocas del Toro'),
(1, 'Panamá'),
(2, 'Chiriquí'),
(3, 'Colón'),
(1, 'Los Santos'),
(2, 'Herrera'),
(3, 'Darién'),
(1, 'Veraguas'),
(2, 'Coclé'),
(3, 'Bocas del Toro'),
(1, 'Panamá'),
(2, 'Chiriquí'),
(3, 'Colón'),
(1, 'Darién'),
(2, 'Veraguas'),
(3, 'Los Santos'),
(1, 'Panamá'),
(2, 'Chiriquí'),
(3, 'Colón'),
(1, 'Herrera'),
(2, 'Coclé'),
(3, 'Bocas del Toro'),
(1, 'Panamá'),
(1, 'Panamá'),
(2, 'Chiriquí'),
(3, 'Colón'),
(1, 'Bocas del Toro'),
(2, 'Los Santos'),
(3, 'Veraguas'),
(1, 'Chiriquí'),
(2, 'Coclé'),
(3, 'Herrera'),
(1, 'Panamá'),
(2, 'Darién'),
(3, 'Los Santos'),
(1, 'Colón'),
(2, 'Veraguas'),
(3, 'Bocas del Toro'),
(1, 'Coclé'),
(2, 'Panamá'),
(3, 'Chiriquí'),
(1, 'Veraguas'),
(2, 'Los Santos');
go

--Procedimiento para almacenar votos
CREATE PROCEDURE RegistrarVoto
  @CandidatoId INT,
  @Provincia VARCHAR(30)
AS
BEGIN
  -- Insertar directamente el voto en la tabla votos
  INSERT INTO votos (Candidato_id, Provincia)
  VALUES (@CandidatoId, @Provincia);

  PRINT 'Voto registrado exitosamente.';
END;
go

--Llamada de ejemplo 
EXEC RegistrarVoto 
  @CandidatoId = 1, 
  @Provincia = 'Panamá';
  go

  --Procedimiento para Ver el Total de Votos
  CREATE PROCEDURE VerTotalVotos
AS
BEGIN
  -- Consulta para obtener el total de votos
  SELECT 
      COUNT(voto_id) AS Total_Votos
  FROM 
      votos;
END;
go
--Llamada de ejemplo 
EXEC VerTotalVotos;
go

--Procedimiento para ver votos por candidatos
CREATE PROCEDURE VerVotosPorCandidato
AS
BEGIN
  -- Consulta para obtener el número total de votos por cada candidato
  SELECT 
      c.nombre AS Candidato, 
      COUNT(v.voto_id) AS Total_Votos
  FROM 
      votos v
  INNER JOIN 
      candidatos c ON v.Candidato_id = c.candidato_id
  GROUP BY 
      c.candidato_id, c.nombre
  ORDER BY 
      Total_Votos DESC;
END;
go

--Llamada de ejemplo 
EXEC VerVotosPorCandidato;
go

--Procedimiento para ver votos por candidato especifico 
CREATE PROCEDURE VerVotosPorCandidatoId
  @CandidatoId INT
AS
BEGIN
  -- Consulta para obtener el número de votos por un candidato específico
  SELECT 
      c.nombre AS Candidato, 
      COUNT(v.voto_id) AS Total_Votos
  FROM 
      votos v
  INNER JOIN 
      candidatos c ON v.Candidato_id = c.candidato_id
  WHERE 
      c.candidato_id = @CandidatoId
  GROUP BY 
      c.candidato_id, c.nombre;
END;
go

--Llamada de ejemplo 
EXEC VerVotosPorCandidatoId @CandidatoId = 1;
go

--Procedimientos para ver votos por provincia 
CREATE PROCEDURE VerVotosPorProvincia
AS
BEGIN
  -- Consulta para obtener el número total de votos por provincia
  SELECT 
      v.Provincia, 
      COUNT(v.voto_id) AS Total_Votos
  FROM 
      votos v
  GROUP BY 
      v.Provincia
  ORDER BY 
      Total_Votos DESC;
END;
go
--Llamada de ejemplo
EXEC VerVotosPorProvincia;
go
--Procedimiento para ver los votos por provincia especifica
CREATE PROCEDURE VerVotosPorProvinciaId
  @IdProvincia INT
AS
BEGIN
  -- Consulta para obtener el número de votos por una provincia específica (usando id_provincia)
  SELECT 
      p.nombre AS Provincia, 
      COUNT(v.voto_id) AS Total_Votos
  FROM 
      votos v
  INNER JOIN 
      provincias p ON v.Provincia = p.nombre
  WHERE 
      p.id_provincia = @IdProvincia
  GROUP BY 
      p.id_provincia, p.nombre;
END;
go
--Llamada de ejemplo 
EXEC VerVotosPorProvinciaId @IdProvincia = 8;
go
