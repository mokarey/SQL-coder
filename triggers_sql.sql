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

-- FUNCION 1 - CALCULAR PROMEDIOS

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

-- FUNCION 2 - CONTAR NIVELES

USE torneo;

DELIMITER $$

CREATE FUNCTION contarEquiposDiamante()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidadEquiposDiamante INT;

    SELECT COUNT(DISTINCT id_equipos) INTO cantidadEquiposDiamante
    FROM equipo_categoria
    WHERE niveles = 'Diamante';

    RETURN cantidadEquiposDiamante;
END $$

DELIMITER ;

SELECT contarEquiposDiamante() AS CantidadEquiposDiamante;

-- TRIGER NUMERO 1
-- TABLA LOG
SELECT CURRENT_USER();

USE torneo;
DESCRIBE equipos_categoria_log;

CREATE TABLE equipos_categoria_log (
    id_equipos_categoria_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_equipos INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    niveles VARCHAR(30) NOT NULL,
    posiciones INT NOT NULL,
    usuario_log VARCHAR(50),
    fecha_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRIGGER

USE torneo;
INSERT INTO equipos_categoria_log (id_equipos, nombre, niveles, posiciones)  
VALUES ('2', 'Equipo 2', 'Diamante', 2);

USE torneo;
SELECT * FROM equipos_categoria_log;

USE torneo;
DELIMITER $$

CREATE TRIGGER after_insert_equipos_categoria
AFTER INSERT ON equipos_categoria
FOR EACH ROW
BEGIN
    INSERT INTO equipos_categoria_log (id_equipos, nombre, niveles, posiciones, usuario_log, fecha_log)
    VALUES (NEW.id_equipos, NEW.nombre, NEW.niveles, NEW.posiciones, CURRENT_USER(), CURRENT_TIMESTAMP);
END //

DELIMITER ;

-- TRIGGER NUMERO 2
-- TABLA LOG 2

USE torneo;
CREATE TABLE jugadores_log (
    id_jugadores_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_jugadores INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    nivel INT NOT NULL,
    equipamiento VARCHAR(150) NOT NULL,
    usuario_log VARCHAR(50),
    fecha_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE torneo;
select * from jugadores_log;

INSERT INTO jugadores_log (id_jugadores, nombre, nivel, equipamiento)  
VALUES ('2', 'Juan', 14, 'Hacha');

-- TRIGGER 2
USE torneo;
DELIMITER $$

CREATE TRIGGER after_insert_jugadores
AFTER INSERT ON jugadores
FOR EACH ROW
BEGIN
    INSERT INTO jugadores_log (id_jugadores, nombre, nivel, equipamiento, usuario_log, fecha_log)
    VALUES (NEW.id_jugadores, NEW.nombre, NEW.nivel, NEW.equipamiento, CURRENT_USER(), CURRENT_TIMESTAMP);
END $$

DELIMITER ;

-- VISTAS 
-- VISTA 1

CREATE VIEW niveles_mayores_a_5 AS
SELECT nombre, nivel FROM jugadores WHERE nivel > 5;

USE torneo;
SELECT * FROM niveles_mayores_a_5;

-- VISTA 2

CREATE VIEW equipos_diamante AS
SELECT nombre FROM torneo.equipo_categoria WHERE niveles = 'Diamante';
    
USE torneo;
SELECT * FROM equipos_diamante;

--