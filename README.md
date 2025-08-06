# BBDD_Clinica_odontologica_PrimeraParte
Realice este proyecto para poner en práctica todo lo que voy aprendiendo y mostrar las diferentes tecnologías que manejo.

# Proyecto: Diseño e Implementación de Base de Datos para Clínica Odontológica. 
## (Primera parte)


## 1.	Objetivo del Proyecto:

Diseñar y desarrollar una base de datos relacional que permita gestionar de manera eficiente la información del personal administrativo, profesionales, pacientes y prestaciones de una clínica odontológica, facilitando el almacenamiento, consulta y análisis de los datos.

## 2.	Alcance:

El proyecto se divide en dos etapas:
•	Parte 1: Registro y gestión del personal administrativo y profesional.
•	Parte 2: Registro de pacientes y prestaciones realizadas.

## 3.	 Relevamiento de Requerimientos
En la primera etapa se requiere tener un registro de todo el personal de la clínica con sus respectivos sectores y jefes.
La clínica consta de varios departamentos, entre ellos, finanzas, marketing, recursos humanos, auditoría, asistencial y profesional, cada uno con un “jefe” a cargo y a su vez los departamentos “asistencial” y “profesional” se dividen en sectores, cada uno, con su coordinador. La empresa tiene empleados en relación de dependencia, y otros, monotributistas que son los profesionales que prestan sus servicios. 
Los profesionales tienen diferentes especialidades y cada especialidad tiene sus “asistentes dentales” que se repiten en algunas de ellas. La clínica dental tiene una dirección en la que trabajan el director general y dos secretarios. 


## 4.	Metodología de Trabajo
•	Análisis de requerimientos: interpretación de las necesidades identificadas en el relevamiento.

•	Diseño conceptual: elaboración del modelo entidad-relación.

•	Modelo lógico: transformación del modelo E-R en un esquema relacional normalizado.

•	Implementación: creación de la base de datos en MySQL.

•	Validación: carga de datos de prueba y consultas de uso común.


## 5.	Modelado de Datos:
#### 1.	Diseño del modelo conceptual.
Diagrama E-R con entidades como Empleado, Sector, Departamento, Especialidad, Profesional, y relaciones “trabaja”, “responde”, “supervisa, “coordina”, etc. 


<img width="640" height="693" alt="image" src="https://github.com/user-attachments/assets/4d6ef6f3-0a15-461c-adb3-67fa3171bb6f" />



#### 2.	Modelo lógico.
Tablas normalizadas con sus relaciones.

<img width="886" height="558" alt="image" src="https://github.com/user-attachments/assets/38cb0a93-8bd1-4524-99f2-08f50bce30b6" />

<img width="783" height="543" alt="image" src="https://github.com/user-attachments/assets/6f180b51-e698-4280-8d29-bacef9b54be0" />

## 6.	 Implementación en sistema gestor de bases de datos.
Se utilizó PostgreSQL para la implementación de la base de datos. Se crearon tablas normalizadas con claves primarias y foráneas, y se incorporaron restricciones de integridad referencial.


Código SQL completo en: <a href="https://github.com/MSoledadGarcia/BBDD_Clinica_odontologica_PrimeraParte/blob/main/Creacion%20de%20Base%20de%20datos.sql">Base de datos</a>

<img width="710" height="448" alt="image" src="https://github.com/user-attachments/assets/36fcbc80-2563-4ba5-afe9-a4ae07c4bfae" />



## 7.	 Pruebas de carga de datos y consultas de uso real.
Se cargaron datos sintéticos de empleados por medio de código creado con Python para las tablas empleado, profesional y cronograma, y datos reales en la tabla departamento, sector, especialidad para realizar la prueba de la base de datos. 


Código Python en: <a href="https://github.com/MSoledadGarcia/BBDD_Clinica_odontologica_PrimeraParte/blob/main/Creaci%C3%B3n%20de%20datos%20sint%C3%A9ticos.py">Datos sint&eacute;ticos</a>

•	¿Cómo se dividen las especialidades por sector y departamento?

<img width="548" height="578" alt="image" src="https://github.com/user-attachments/assets/d3be5a5f-06fb-42b3-94b7-af55f43c721b" />


•	¿Quién es el coordinador de Guillermina Herrera?


<img width="713" height="440" alt="image" src="https://github.com/user-attachments/assets/6bb7333a-a881-42aa-b4cb-cda4be12464c" />

## 8.	Caso de Uso: Análisis de Datos
Ejemplos de uso de la base de datos para obtener información útil.
Se utilizó el lenguaje R para el análisis y la realización de gráficos.


Código en <a href="https://github.com/MSoledadGarcia/BBDD_Clinica_odontologica_PrimeraParte/blob/main/Gr%C3%A1ficos%20ejemplo.R">An&aacute;lisis de datos</a>

<img width="698" height="448" alt="image" src="https://github.com/user-attachments/assets/7bbb4c0f-020a-4af7-8edc-f95ebdda1c42" />

<img width="537" height="346" alt="image" src="https://github.com/user-attachments/assets/49000857-427c-4845-8e64-48b62a5cf01f" />

<img width="880" height="565" alt="image" src="https://github.com/user-attachments/assets/e7654d43-6fa1-4fa2-94ad-f424602b969c" />


## 9.	Conclusiones

El diseño e implementación de esta base de datos permite centralizar la información de la clínica, mejorar el acceso a datos clave y facilitar la toma de decisiones administrativas. 









