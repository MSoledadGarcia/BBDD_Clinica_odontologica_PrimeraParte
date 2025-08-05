# -*- coding: utf-8 -*-
"""
Created on Tue Jul 29 21:56:36 2025

@author: maria
"""
import os
print(os.getcwd())



import csv
from faker import Faker
import random
#import re

fake = Faker('es_AR')  # Para generar datos en español de Argentina

# Simulamos 20 empleados
empleados = []

departamentos = [1001, 1002, 1003, 1004, 1005, 1006, 1007 ]  # codDpb posibles
condicion_laboral = ['Relacion dependencia', 'Monotributista']     





for _ in range(30):
    dni = fake.unique.random_int(min=20000000, max=45000000)
    nombre = fake.name()
    fechaNac = fake.date_of_birth(minimum_age=25, maximum_age=60).strftime('%Y-%m-%d')
    fechaAlta = fake.date_between(start_date='-10y', end_date='today').strftime('%d-%m-%y')
    telefono= fake.phone_number()
    #telefono = re.sub(r'\D', '', telefono_original)  # solo números
    calle = fake.street_address()
    domicilio = f"{calle}. Buenos Aires"
    condLab = random.choice(condicion_laboral)
    codDpto = random.choice(departamentos)


    empleados.append([
        dni, nombre, fechaNac, fechaAlta, telefono, domicilio, condLab, codDpto
    ])
    


# Nombres de columnas según el modelo lógico
columnas = ['dni', 'nombre', 'fechaNac', 'fechaAlta', 'telefono', 'domicilio', 'condLab', 'codDpto']

#%%
# Guardar como CSV
'''with open('empleado.csv', mode='w', newline='', encoding='utf-8') as archivo_csv:
    writer = csv.writer(archivo_csv)
    writer.writerow(columnas)
    writer.writerows(empleados)'''

print("Archivo 'empleado.csv' creado con éxito.")


#%%

#Tabla PROFESIONAL

import pandas as pd
import random


profesionales = pd.read_csv('empleados.csv')

# Lista de especialidades posibles
esp = [i for i in range(201, 213)]

# Crear listas para almacenar datos
dni_list = []
matricula_list = []
esp_list = []

# Iterar por las filas del DataFrame
for _, row in profesionales.iterrows():
    if row['condlab'] == 'Monotributista':
        dni_list.append(row['dni'])  # asumimos que hay una columna 'dni'
        matricula_list.append(random.randint(10000, 99999))
        esp_list.append(random.choice(esp))

# Crear un nuevo DataFrame con la información
profesional= pd.DataFrame({
    'dni': dni_list,
    'matricula': matricula_list,
    'especialidad': esp_list
})

print(profesional)


#profesional.to_csv('profesional.csv', index=False)

#%%


# Cargar archivo original
profesionales = pd.read_csv('profesional.csv')

# Listas de días y franjas horarias
dias = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes']
franjas = [
    ('08:00', '12:00'),
    ('14:00', '19:00')
]


# Crear listas para el nuevo DataFrame
dni_list = []
dia_list = []
entrada_list = []
salida_list = []

for dni in profesionales['dni']:
    combinaciones = set()
    
    # Evitar combinaciones repetidas para el mismo profesional
    while len(combinaciones) < 4:
        dia = random.choice(dias)
        franja = random.choice(franjas)
        combinaciones.add((dia, franja))
    
    for dia, (entrada, salida) in combinaciones:
        dni_list.append(dni)
        dia_list.append(dia)
        entrada_list.append(entrada)
        salida_list.append(salida)

# Crear el DataFrame
agenda = pd.DataFrame({
    'dni': dni_list,
    'dia': dia_list,
    'horaEntrada': entrada_list,
    'horaSalida': salida_list
})


# Mostrar ejemplo
print(agenda.head(10))

# Guardar
#agenda.to_csv('agenda_profesionales.csv', index=False)
