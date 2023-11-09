INSERT INTO jugadores (nombre, nivel, equipamiento)
VALUES 
    ('Juan Pérez', 15, 'Espada de Fuego'),
    ('María López', 10, 'Arco de Cristal'),
    ('Carlos Martínez', 8, 'Vara Magica'),
    ('Luis Rodríguez', 12, 'Escudo de Hierro'),
    ('Ana Gómez', 18, 'Dagas Envenenadas'),
    ('Miguel Sánchez', 20, 'Espada Legendaria'),
    ('Sofía Hernández', 9, 'Armadura de Cuero'),
    ('David González', 13, 'Martillo de Guerra'),
    ('Laura Pérez', 7, 'Baculo Arcano'),
    ('Diego Martín', 11, 'Arco de Plata');
    
INSERT INTO torneo.jugadores_categoria (id_jugadores, nombre, niveles, posiciones)
VALUES 
    (1, 'Juan Pérez', 'Diamante', 1),
    (2, 'María López', 'Diamante', 2),
    (3, 'Carlos Martínez', 'Diamante', 3),
    (4, 'Luis Rodríguez', 'Diamante', 2),
    (5, 'Ana Gómez', 'Plata', 1),
    (6, 'Miguel Sánchez', 'Plata', 2),
    (7, 'Sofía Hernández', 'Plata', 3),
    (8, 'David González', 'Bronce', 1),
    (9, 'Laura Pérez', 'Bronce', 2),
    (10, 'Diego Martín', 'Bronce', 3);

    
INSERT INTO equipo (nombre, equipamiento, integrantes)
VALUES 
    ('Equipo A', 'Espadas y Escudos', 'Juan, María, Carlos'),
    ('Equipo B', 'Arcos y Flechas', 'Luis, Ana, Miguel'),
    ('Equipo C', 'Varas Magicas', 'Sofía, David, Laura'),
    ('Equipo D', 'Hachas y Armaduras', 'Diego, Marta, Elena'),
    ('Equipo E', 'Dagas y Capas', 'José, Ana, Pedro'),
    ('Equipo F', 'Lanzas y Armaduras de Placas', 'Isabel, Jorge, Elena'),
    ('Equipo G', 'Mazos y Escudos de Madera', 'Luisa, Daniel, Marcos'),
	('Equipo H', 'Armas Místicas', 'Isabella, Santiago, Valentina'),
    ('Equipo I', 'Espadas Luminosas', 'Lucas, Martina, Nicolás');

    
INSERT INTO equipo_categoria (id_equipos, nombre, niveles, posiciones)
VALUES 
    (1, 'Equipo A', 'Diamante', 1),
    (2, 'Equipo B', 'Diamante', 2),
	(3, 'Equipo C', 'Diamante', 3),
    (4, 'Equipo D', 'Plata', 1),
    (5, 'Equipo E', 'Plata', 2),
    (6, 'Equipo F', 'Plata', 3),
    (7, 'Equipo G', 'Bronce', 1),
    (8, 'Equipo H', 'Bronce', 2),
    (9, 'Equipo I', 'Bronce', 3);
