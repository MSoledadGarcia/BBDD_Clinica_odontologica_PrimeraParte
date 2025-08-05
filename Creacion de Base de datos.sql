
DROP DATABASE IF EXISTS Clinica_dental; 
CREATE DATABASE IF NOT EXISTS Clinica_dental;
use Clinica_dental;

DROP TABLE IF EXISTS Departamento;
CREATE TABLE IF NOT EXISTS Departamento(
Codigo			INTEGER PRIMARY KEY,
nombreDpto		TEXT
);


DROP TABLE IF EXISTS Sector;
CREATE TABLE IF NOT EXISTS Sector(
Codigo			INTEGER PRIMARY KEY,
nombre			TEXT,
codDpto	INTEGER,
FOREIGN KEY (codDpto) REFERENCES Departamento(Codigo) ON DELETE SET NULL ON UPDATE RESTRICT
);

DROP TABLE IF EXISTS Especialidad;
CREATE TABLE IF NOT EXISTS Especialidad(
Codigo			INTEGER PRIMARY KEY,
nombre			TEXT,
codSector		INTEGER,
FOREIGN KEY (codSector) REFERENCES Sector(Codigo) ON DELETE SET NULL ON UPDATE RESTRICT
);

DROP TABLE IF EXISTS Empleado;

CREATE TABLE IF NOT EXISTS Empleado
(
dni			INTEGER PRIMARY KEY,
nombre		TEXT,
fechaNac	DATE,
fechaAlta 	DATE,
telefono	VARCHAR (20),
domicilio	VARCHAR,
condLab		TEXT,
codDpto		integer,
FOREIGN KEY (codDpto) REFERENCES Departamento(Codigo) ON DELETE SET NULL ON UPDATE RESTRICT
);

DROP TABLE IF EXISTS Profesional;
CREATE TABLE IF NOT EXISTS Profesional(
dni				INTEGER PRIMARY KEY,
matricula		INT,
especialidad	INTEGER,
FOREIGN KEY (Especialidad) REFERENCES Especialidad(Codigo)ON DELETE SET NULL ON UPDATE RESTRICT
);

DROP TABLE IF EXISTS Cronograma;
CREATE TABLE IF NOT EXISTS Cronograma (
  dni          INTEGER,
  diaSemana    VARCHAR,
  horaIngreso  TIME,
  horaSalida   TIME,
  PRIMARY KEY (dni, diaSemana, horaIngreso),
  FOREIGN KEY (dni) REFERENCES Profesional(dni) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Director;
CREATE TABLE IF NOT EXISTS Director(
dni			INTEGER PRIMARY KEY,
codigoDpto		INTEGER,
FOREIGN KEY (codigoDpto) REFERENCES Departamento(Codigo) ON DELETE SET NULL ON UPDATE RESTRICT
);

DROP TABLE IF EXISTS Coordinador;
CREATE TABLE IF NOT EXISTS Coordinador(
dni			INTEGER PRIMARY KEY,
codigoSector		INTEGER,
FOREIGN KEY (codigoSector) REFERENCES Sector(Codigo) ON DELETE SET NULL ON UPDATE RESTRICT
);



--  INSERCION DE DATOS: departamento, sector, especialidad

INSERT INTO departamento VALUES (1001, 'Finanzas');
INSERT INTO departamento VALUES (1002, 'Recursos humanos');
INSERT INTO departamento VALUES (1003, 'Marketing');
INSERT INTO departamento VALUES (1004, 'Dirección');
INSERT INTO departamento VALUES (1005, 'Auditoría');
INSERT INTO departamento VALUES (1006, 'Asistencial');
INSERT INTO departamento VALUES (1007, 'Profesional');


INSERT INTO sector VALUES (2101, 'Atención al público', 1006);
INSERT INTO sector VALUES (2102, 'Asistentes dentales', 1006);
INSERT INTO sector VALUES (2103, 'Esterilización', 1006);
INSERT INTO sector VALUES (2104, 'Laboratorio', 1006);
INSERT INTO sector VALUES (2105, 'Adultos', 1007);
INSERT INTO sector VALUES (2106, 'Infantil y ortodoncia', 1007);
INSERT INTO sector VALUES (2107, 'Cirugía', 1007);
INSERT INTO sector VALUES (2108, 'Protesis e implantologia', 1006);

UPDATE sector
SET codDpto = 1007
WHERE nombre = 'Protesis e implantologia';

INSERT INTO especialidad VALUES (0201, 'Odontopediatra', 2106);
INSERT INTO especialidad VALUES (0202, 'Ortodoncia', 2106);
INSERT INTO especialidad VALUES (0203, 'Periodoncia', 2105);
INSERT INTO especialidad VALUES (0204, 'Endodoncia', 2105);
INSERT INTO especialidad VALUES (0205, 'Odontología General', 2105);
INSERT INTO especialidad VALUES (0206, 'Cirugía general', 2107);
INSERT INTO especialidad VALUES (0207, 'Cirugía ortognática', 2107);
INSERT INTO especialidad VALUES (0208, 'Protesis', 2108);
INSERT INTO especialidad VALUES (0209, 'Implantología', 2108);
INSERT INTO especialidad VALUES (0210, 'Estomatología', 2105);
INSERT INTO especialidad VALUES (0211, 'ATM', 2106);
INSERT INTO especialidad VALUES (0212, 'Fisurados', 2106);



select * from especialidad;

select e.nombre, s.nombre, d.nombredpto from especialidad e
join sector s on e.codsector= s.codigo
join departamento d on d.codigo = s.coddpto

select * from empleado
order by condlab;


UPDATE empleado
SET codDpto = 1007
WHERE condlab = 'Monotributista';*/



INSERT INTO coordinador VALUES (22601461, 2101);
INSERT INTO coordinador VALUES (29883978, 2102);
INSERT INTO coordinador VALUES (26774570, 2103);
INSERT INTO coordinador VALUES (43623465, 2104);
INSERT INTO coordinador VALUES (34387262, 2105);
INSERT INTO coordinador VALUES (39694845, 2106);
INSERT INTO coordinador VALUES (40756767, 2107);
INSERT INTO coordinador VALUES (38968966, 2108);


INSERT INTO director VALUES (25273887, 1001);
INSERT INTO director VALUES (20777391, 1002);
INSERT INTO director VALUES (33038155, 1003);
INSERT INTO director VALUES (27520850, 1004);
INSERT INTO director VALUES (39296359, 1005);
INSERT INTO director VALUES (32166157, 1006);
INSERT INTO director VALUES (43623465, 1007);



select p.dni, em.nombre, e.nombre as especialidad, s.nombre as sector, ec.nombre as coordinador
from profesional p
join especialidad e on p.especialidad = e.codigo
join empleado em on p.dni = em.dni
join sector s on e.codsector = s.codigo
join coordinador c on c.codigosector= s.codigo
JOIN empleado ec ON c.dni = ec.dni

select distinct em.nombre, c.diasemana as dias, e.nombre as especialidad, s.nombre as sector
from profesional p
join especialidad e on p.especialidad = e.codigo
join empleado em on p.dni = em.dni
join sector s on e.codsector = s.codigo
join cronograma c on c.dni= em.dni



select * from cronograma;

select count(*) from empleado
where condlab like 'Relacion dependencia';

select em.nombre, e.nombre, s.nombre, d.nombredpto from empleado em
join departamento d on em.coddpto = d.codigo
join sector s on s.coddpto= d.codigo
join especialidad e on s.codigo = e.codsector;


SELECT em.nombre AS empleado,
       d.nombredpto AS departamento,
       ed.nombre AS director
FROM empleado em
JOIN departamento d ON em.coddpto = d.codigo
JOIN director di ON di.codigodpto = d.codigo
JOIN empleado ed ON ed.dni = di.dni
ORDER BY departamento;


select p.dni, em.nombre, e.nombre as especialidad,
s.nombre as sector, ec.nombre as coordinador
from profesional p
join especialidad e on p.especialidad = e.codigo
join empleado em on p.dni = em.dni
join sector s on e.codsector = s.codigo
join coordinador c on c.codigosector= s.codigo
JOIN empleado ec ON c.dni = ec.dni
where em.nombre like '%Guillermina%';

