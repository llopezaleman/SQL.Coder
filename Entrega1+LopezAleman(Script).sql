create database elearning;
Use elearning;
#CREACIÓN DE TABLAS - 1° Pre-Entrega
#Primero las que no tienen foreign key
CREATE TABLE `paises`  (
  `pais_id` int NOT NULL AUTO_INCREMENT,
  `pais_nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`pais_id`) 
);
CREATE TABLE `curso_estado`  (
  `curso_estado_id` smallint NOT NULL AUTO_INCREMENT,
  `estado_curso` varchar(30) NOT NULL,
  PRIMARY KEY (`curso_estado_id`)
);
CREATE TABLE `tematica`  (
  `tematica_id` int NOT NULL AUTO_INCREMENT,
  `tematica_especifica` varchar(30) NOT NULL,
  PRIMARY KEY (`tematica_id`)
);

CREATE TABLE `horarios`  (
  `horario_id` int NOT NULL AUTO_INCREMENT,
  `horario_detalle` varchar(30) NOT NULL,
  PRIMARY KEY (`horario_id`)
);
CREATE TABLE `profesores`  (
  `profesor_id` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(50) NOT NULL,
  PRIMARY KEY (`profesor_id`)
);
#Luego, las que si tienen FK
CREATE TABLE `ciudad`  (
  `ciudad_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `pais_id` int NOT NULL,
  PRIMARY KEY (`ciudad_id`),
  FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`)
);
CREATE TABLE `alumnos`  (
  `alumno_id` int NOT NULL AUTO_INCREMENT,
  `ciudad_id` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(320)  NOT NULL,
  `nombre_completo` varchar(80) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
    PRIMARY KEY (`alumno_id`) ,
    FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`ciudad_id`) 
);

CREATE TABLE `cursos`  (
  `curso_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `tematica_id` int NOT NULL,
  `horario_id` int NOT NULL,
  PRIMARY KEY (`curso_id`),
	FOREIGN KEY (`tematica_id`) REFERENCES `tematica` (`tematica_id`), 
    FOREIGN KEY (`horario_id`) REFERENCES `horarios`  (`horario_id`)
);

CREATE TABLE `inscripciones`  (
  `inscripcion_id` int NOT NULL AUTO_INCREMENT,
  `curso_id` int NOT NULL,
  `alumno_id` int NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `pago_realizado` tinyint NOT NULL DEFAULT 0,
  `curso_estado_id` smallint NOT NULL,
  PRIMARY KEY (`inscripcion_id`),
   FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`),
   FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`),
   FOREIGN KEY (`curso_estado_id`) REFERENCES `curso_estado` (`curso_estado_id`)
);
CREATE TABLE `profesores_cursos`  (
  `profesor_id` int NOT NULL,
  `curso_id` int NOT NULL,
  PRIMARY KEY (`profesor_id`,`curso_id`),  
   FOREIGN KEY (`profesor_id`) REFERENCES `profesores` (`profesor_id`),
   FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`)
);


#SCRIPT INCRESIÓN DE DATOS Entrega Miércoles 23-Feb

#Tabla Países
INSERT INTO `paises` VALUES (1, 'Argentina');
INSERT INTO `paises` VALUES (2, 'Brazil');
INSERT INTO `paises` VALUES (3, 'España');
INSERT INTO `paises` VALUES (4, 'Italia');
INSERT INTO `paises` VALUES (5, 'Australia');

#Tabla temáticas
INSERT INTO `tematica` VALUES (1, 'INGLES');
INSERT INTO `tematica` VALUES (2, 'FRANCES');
INSERT INTO `tematica` VALUES (3, 'BASES DE DATOS');
INSERT INTO `tematica` VALUES (4, 'DESARROLLO');
INSERT INTO `tematica` VALUES (5, 'DEV OPS');
INSERT INTO `tematica` VALUES (6, 'DATA SCIENCE');
INSERT INTO `tematica` VALUES (7, 'MARKETING DIGITAL');
INSERT INTO `tematica` VALUES (8, 'DISEÑO');

#Tabla curso_estado
INSERT INTO `curso_estado` VALUES (1, 'INSCRIPTO');
INSERT INTO `curso_estado` VALUES (2, 'CANCELADO');
INSERT INTO `curso_estado` VALUES (3, 'APROBADO');

#Tabla horarios
INSERT INTO `horarios` VALUES (1, 'MAÑANA');
INSERT INTO `horarios` VALUES (2, 'TARDE');
INSERT INTO `horarios` VALUES (3, 'NOCHE');


#Tabla cursos
INSERT INTO `cursos` VALUES (1, 'INGLES NIVEL 1',15000,1,2);
INSERT INTO `cursos` VALUES (2, 'INGLES NIVEL 2', 10000, 1,3);
INSERT INTO `cursos` VALUES (3, 'FRANCES NIVEL 1',  12500,2,1);
INSERT INTO `cursos` VALUES (4, 'FRANCES NIVEL 2',  14750.5,2,2);
INSERT INTO `cursos` VALUES (5, 'DESARROLLO BACKEND',  25780, 4,2);
INSERT INTO `cursos` VALUES (6, 'SQL BASICO', 14700, 3,2);
INSERT INTO `cursos` VALUES (7, 'SQL AVANZADO', 14700, 3,1);
INSERT INTO `cursos` VALUES (8, 'DESARROLLO FRONTEND',  26000,4,1);
INSERT INTO `cursos` VALUES (9, 'DATA SCIENCE INTRODUCTORIO', 12400,5,1);
INSERT INTO `cursos` VALUES (10, 'DISEÑO PARA E-COMMERCE', 12500, 8,3);
#para borrarlo utilizaría--> DELETE FROM `elearning`.`cursos` WHERE (`curso_id` = '5');

#Tabla ciudad
INSERT INTO `ciudad` VALUES (1, 'Rosario,',1);
INSERT INTO `ciudad` VALUES (2, 'Buenos Aires',1);
INSERT INTO `ciudad` VALUES (3, 'Cordoba',1);
INSERT INTO `ciudad` VALUES (4, 'San Pablo',2);




#Tabla alumnos
INSERT INTO `alumnos` VALUES (1, 1, '#23#asauh81377722nnsd', 'jose_gonzalez@gmail.com', 'JOSE GONZALEZ', '2001-02-13');
INSERT INTO `alumnos` VALUES (2, 4, '$2a$10$g5AKRpCW0iEXJCxK0sl24O7S5XWAo/Fnhsb9ShFyz.8HWXxIRo.JG', 'mealmeida1@yahoo.com.ar', 'MARTIN EDUARDO ALMEIDA', '1976-02-26');
INSERT INTO `alumnos` VALUES (3, 3, '$2a$10$j0tDnBH6UG6YUbw7ZOTFeeKngnGuOTMGANCruW3AJJfago5D8QkZW', 'boninivaleria@hotmail.com', 'VALERIA SOLEDAD BONINI', '1989-10-07');
INSERT INTO `alumnos` VALUES (4, 2, '$2a$10$g4Rfk6QNdYbdlIjJg1B0MugMHD2FZGNEdbxP.xp71D5XzHWI/IbqG', 'lucilaamunoz@gmail.com', 'LUCILA MUNOZ', '1994-05-24');
INSERT INTO `alumnos` VALUES (5, 1, '$2a$10$ETn1hq62OrkCI6IsBjAdAeOAjZyVigC6q5vOEjqYLX/Wf2L6YmI.q', 'camila_vecchi@uca.edu.ar', 'CAMILA FLORENCIA VECCHI', '1993-11-05');
INSERT INTO `alumnos` VALUES (6, 2, '$2a$10$fBQ9uTyWWUFu5c/zJpYHG.JzxPCJLle2Y5eAzk10Uosk4W3b555eS', 'vivianarimauro@hotmail.com', 'VIVIANA RITA RIMAURO', '1975-03-20');
INSERT INTO `alumnos` VALUES (7, 4, '$2a$10$6qMgBSC2OlvmLKllsEhkyO3QLZkYlKt6OpbINgKGE.WHb4ze/ssxq', 'felinagonz_93@yahoo.com.ar', 'FELICITAS MARIA GONZALEZ CALVO', '1993-12-01');
INSERT INTO `alumnos` VALUES (8, 2, '$2a$10$c5MLacIIRI9RBSM5Nj5oIevnpV50XtezbuWjPBWxBlUw5TTi/0gZK', 'gabrieljclerico@gmail.com', 'GABRIEL JOSÉ CLÉRICO', '1991-03-15');
INSERT INTO `alumnos` VALUES (9, 1, '$2a$10$Y.Brl1/lVLwD1TbE1xwnd.bUtX8gAIvNueqdEfYW4HW7gxbAWSusq', 'joseagrieco@gmail.com', 'JOSE ANTONIO GRIECO', '1981-12-21');
INSERT INTO `alumnos` VALUES (10, 1, '$2a$10$eWZAT4.PnPbF4nl8GjpFFuL.NPb1TSJmpMG7yEdGvAdKBrF3o3oeK', 'williamsbecker@gmail.com', 'ALEJANDRO EDUARDO WILLIAMS BECKER', '1988-12-13');
INSERT INTO `alumnos` VALUES (11, 1, '$2a$10$aydsGEY/nVROs8c6QtNfLuNikgl8jzugaslk14.HzbU/HCLoewmY.', 'mar_951@live.com.ar', 'MARINA ELIZABETH GONZALEZ SEGOVIA', '1995-11-06');
INSERT INTO `alumnos` VALUES (12, 3, '$2a$10$HQmYWWmCufTVaxdbC.bdK.dKAFNT8Vb/GsCk4zLA0K/qg6X83zM1u', 'flor.fontana2@hotmail.es', 'FLORENCIA SOFÍA FONTANA ESTEVEZ', '2018-08-28');
INSERT INTO `alumnos` VALUES (13, 2, '$2a$10$UtExC.BU6YuJpnKdEo99BOxZPq4ImbMYDCEdZxQjDARcAeJzD3cce', 'jbello@gmail.com.ar', 'JUAN PABLO BELLO', '1990-04-24');
INSERT INTO `alumnos` VALUES (14, 4, '$2a$10$KhRhYT.JgIVnxv.1Zkkp5uinKg8vIGjZBhJ0Ctb2uzELe/yP.myW.', 'javieralberici@hotmail.com', 'JAVIER ANDRÉS ALBERICI', '1985-04-23');
INSERT INTO `alumnos` VALUES (15, 1, '$2a$10$cOig4.zln4llncuHrEFlcehwZFioN7YZUWBln8jMMTjX2gDZ.n2Hm', 'PSCi@gmail.com', 'PABLO CATTONI', '1978-06-23');
INSERT INTO `alumnos` VALUES (16, 1, '$2a$10$QLoHeVjx1GYVBKCrByLvKeEOk5yVBTaqds82ejPG4qisDSxKhGI9i', 'vdipietromica@gmail.com', 'VIVIANA DI PIETROMICA', '2018-08-29');
INSERT INTO `alumnos` VALUES (17, 3, '$2a$10$vNxk4QQPDG7A6NitWg3EJOsBofs68qrc1eklslE.dXZQy6BifwRSS', 'danielamechetti@hotmail.com', 'PAULA DANIELA MECHETTI', '2018-08-29');
INSERT INTO `alumnos` VALUES (18, 2, '$2a$10$Rfv/yQDvhgEhh/TPtMcw9uWe7KORbYLhlWj4LyPRkJ0vzn.Tuqh9S', 'ivana.m.alvarez@hotmail.com', 'IVANA MELISSA ALVAREZ', '1994-05-29');
INSERT INTO `alumnos` VALUES (19, 2, '$2a$10$jrD6dACENAPma5xShkP9l.0fvHQTyIGtI86qmdkt6Q12rzTSmLKg.', 'matiasszapiro@gmail.com', 'MATIAS DOMINGO  SZAPIRO', '1975-07-30');
INSERT INTO `alumnos` VALUES (20, 1, '$2a$10$zHNmEMhhPR.dHrxclhTBYeVCTivNgn4HO9ir8dykDmFuClSpdvm3e', 'genosposetti@hotmail.com', 'GENOVEVA SPOSETTI', '1974-02-16');


#Tabla inscripciones
INSERT INTO `inscripciones` VALUES (1, 1, 1, '2022-02-06 22:02:11', 1, 2);
INSERT INTO `inscripciones` VALUES (2, 6, 2, '2022-02-06 22:02:11', 1, 1);
INSERT INTO `inscripciones` VALUES (3, 4, 3, '2022-02-06 22:02:11', 0, 3);
INSERT INTO `inscripciones` VALUES (4, 2, 4, '2022-01-13 22:02:11', 1, 2);
INSERT INTO `inscripciones` VALUES (5, 1, 5, '2022-02-01 22:02:11', 1, 1);
INSERT INTO `inscripciones` VALUES (6, 5, 6, '2022-02-06 22:02:11', 0, 1);
INSERT INTO `inscripciones` VALUES (7, 8, 7, '2022-02-08 22:02:11', 0, 1);
INSERT INTO `inscripciones` VALUES (8, 9, 8, '2022-01-12 22:02:11', 1, 1);
INSERT INTO `inscripciones` VALUES (10, 2, 9, '2022-02-06 22:02:11', 1, 1);

#tabla profesores
Insert into `Profesores` VALUES (1,"A. Lopez");
Insert into `Profesores` VALUES (2,"B. Perez");
Insert into `Profesores` VALUES (3,"C. Martínez");
Insert into `Profesores` VALUES (4,"D. Dominguez");
Insert into `Profesores` VALUES (5,"G. Gonzalez");
Insert into `Profesores` VALUES (6,"B. Lopez");
Insert into `Profesores` VALUES (7,"C. Lopez");
Insert into `Profesores` VALUES (8,"A. Ramirez");
Insert into `Profesores` VALUES (9,"A. Sanzhez");
Insert into `Profesores` VALUES (10,"F. Perez");

#tabla profesores_cursos
Insert into `Profesores_cursos` VALUES (1,10);
Insert into `Profesores_cursos` VALUES (2,9);
Insert into `Profesores_cursos` VALUES (3,8);
Insert into `Profesores_cursos` VALUES (4,7);
Insert into `Profesores_cursos` VALUES (5,6);
Insert into `Profesores_cursos` VALUES (6,5);
Insert into `Profesores_cursos` VALUES (7,4);
Insert into `Profesores_cursos` VALUES (8,3);
Insert into `Profesores_cursos` VALUES (9,2);
Insert into `Profesores_cursos` VALUES (10,1);

#Consigna: Presentar en formato .sql el script de creación de 5 vistas con base en los datos de la base de datos del proyecto final. 
#1 vista: Cantidad de alumnos de Argentina
use elearning;
CREATE OR REPLACE VIEW alumnos_arg_view
AS
SELECT a.alumno_id, a.nombre_completo, a.mail, c.ciudad_id, c.nombre AS ciudad_nombre, p.pais_id, p.pais_nombre  
FROM  alumnos AS a 
LEFT JOIN ciudad AS c ON (a.ciudad_id = c.ciudad_id)
LEFT JOIN paises AS p ON (c.pais_id = p.pais_id)
WHERE p.pais_id = 1;

#2 Vista (Seguridad) - Tabla de alumnos sin password
CREATE OR REPLACE VIEW alumnos_vista_admin
AS 
SELECT a.alumno_id, a.ciudad_id, a.mail, a.nombre_completo, a.fecha_nacimiento
FROM alumnos AS a;

#Modificación de vista anterior
ALTER VIEW alumnos_vista_admin
AS 
SELECT a.alumno_id, a.ciudad_id, a.mail, a.nombre_completo
FROM alumnos AS a;

#3° VISTA recuento de alumnos por curso
CREATE OR REPLACE VIEW alumnos_curso_view
AS
SELECT i.curso_id, c.titulo, COUNT(i.alumno_id) AS alumnos_cantidad
FROM  inscripciones AS i 
LEFT JOIN cursos AS c ON (i.curso_id = c.curso_id) 
GROUP BY i.curso_id;


#4° VISTA recuento de cursos abiertos por horario (horario_detalle)
CREATE OR REPLACE VIEW insc_hor_view
AS
SELECT  h.horario_detalle, COUNT(c.curso_id) AS tot_horario
FROM  cursos as c
LEFT JOIN horarios AS h ON (c.horario_id = h.horario_id) 
GROUP BY c.horario_id;

#4.1 detalle de horarios disponibles por cada curso
CREATE OR REPLACE VIEW hor_curso_view
AS
SELECT  c.titulo, h.horario_detalle
FROM  cursos as c
LEFT JOIN horarios AS h ON (c.horario_id = h.horario_id);

#5° Vista de conteo total de cursos Arprobados (estado_curso =1) por tematica
CREATE OR REPLACE VIEW cursos_tema_view
AS
SELECT  t.tematica_especifica, COUNT(c.curso_id) AS tot_tema
FROM  tematica as t
LEFT JOIN cursos AS c ON (c.tematica_id = t.tematica_id)
LEFT JOIN curso_estado as ce ON (c.curso_estado_id = ce.curso_estado_id)
WHERE ce.curso_estado_id= 1
GROUP BY t.tematica_especifica;

#6 ingresos por profesor (precio de curso) 
CREATE OR REPLACE VIEW profe_sumprecio_view
AS 
SELECT p.nombre_completo, SUM(c.precio)
FROM profesores as p
LEFT JOIN profesores_cursos as pc ON (p.profesor_id = pc.profesor_id)
LEFT JOIN cursos as c ON (c.curso_id = pc.curso_ID)
GROUP BY p.nombre_completo;


#Llamamos funciones del script de funciones link: 
SELECT elearning.f_get_cantidad_alumnos_curso(3)
SELECT elearning.promedio_costo_cursos_por_tematica(2);

