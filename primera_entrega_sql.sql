CREATE DATABASE IF NOT EXISTS torneo;

USE torneo;

CREATE TABLE IF NOT EXISTS torneo(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_jugador INT NOT NULL,
	id_categoria INT NOT NULL,
	id_equipo INT NOT NULL,
	ganador INT NOT NULL
);

CREATE TABLE IF NOT EXISTS torneo.jugadores(
	id_jugadores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	nivel INT NOT NULL,
	equipamiento VARCHAR (150) NOT NULL
);

CREATE TABLE IF NOT EXISTS torneo.jugadores_categoria(
	id_jugadores_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	id_jugadores INT NOT NULL,
	niveles VARCHAR(30) NOT NULL,
	posiciones INT NOT NULL
);

CREATE TABLE IF NOT EXISTS torneo.equipo(
	id_equipos INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	nombre VARCHAR(50) NOT NULL,
	equipamiento VARCHAR (150) NOT NULL,
	integrantes VARCHAR (200) NOT NULL
	);
    
    CREATE TABLE IF NOT EXISTS torneo.equipo_categoria(
    id_equipo_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_equipos INT NOT NULL,
	niveles VARCHAR(30) NOT NULL,
	posiciones INT NOT NULL
);

USE torneo;

DELIMITER $$
CREATE FUNCTION calcularPromedioNivel()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalNiveles INT;
    DECLARE cantidadJugadores INT;
    DECLARE promedio INT;

    SELECT SUM(nivel) INTO totalNiveles FROM jugadores;
    SELECT COUNT(*) INTO cantidadJugadores FROM jugadores;

    IF cantidadJugadores > 0 THEN
        SET promedio = totalNiveles / cantidadJugadores;
    ELSE
        SET promedio = 0;
    END IF;
    RETURN promedio;
END $$
DELIMITER ;

SELECT calcularPromedioNivel() AS ResultadoPromedio;


