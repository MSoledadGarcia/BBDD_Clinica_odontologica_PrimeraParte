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


<img width="746" height="725" alt="image" src="https://github.com/user-attachments/assets/8fe66bfb-f63f-445d-814a-aeeff4aa3187" />

