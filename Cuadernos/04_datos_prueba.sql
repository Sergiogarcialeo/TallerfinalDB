    INSERT INTO Dueno_mascota (cedula, nombre, direccion)
    VALUES ('1033713446', 'Claudia Alejandra Leon' , 'calle 39 # 41 - 75');

    INSERT INTO Dueno_mascota (cedula, nombre, direccion)
    VALUES ('1033713447', 'Jair Alberto Garcia' , 'carrera 13 # 26a - 59');

    INSERT INTO Mascota (nombre, especie, raza, fecha_nacimiento, cedula_dueno)
    VALUES ('Nala', 'Perro', 'Mestizo', '2024-10-02', '1033713446');

    INSERT INTO Mascota (nombre, especie, raza, fecha_nacimiento, cedula_dueno)
    VALUES ('Bruno', 'Perro', 'Schnauzer', '2024-11-01', '1033713446');

    INSERT INTO Mascota (nombre, especie, raza, fecha_nacimiento, cedula_dueno)
    VALUES ('Shrek', 'Gato', 'Mestizo', '2025-07-01', '1033713447');

    INSERT INTO Telefono (telefono, cedula_dueno)
    VALUES ('3112349090', '1033713447');

    INSERT INTO Telefono (telefono, cedula_dueno)
    VALUES ('3218123245', '1033713446');

    INSERT INTO Telefono (telefono, cedula_dueno)
    VALUES ('3168056980', '1033713446');

    INSERT INTO Veterinario (cedula, nombre)
    VALUES ('51909612', 'Henrique Gonzalez');

    INSERT INTO Veterinario (cedula, nombre)
    VALUES ('1028860940', 'Harlem Yaneth Aguas');

    INSERT INTO Veterinario (cedula, nombre)
    VALUES ('1028860120', 'Andrea Fernanda Lopez');

    INSERT INTO Especialidad (nombre_especialidad, veterinario_id)
    VALUES ('Veterinario cirujano', 1);

    INSERT INTO Especialidad (nombre_especialidad, veterinario_id)
    VALUES ('Especialista en equinos', 2);

    INSERT INTO Medicamento (nombre)
    VALUES ('cefalexina');

    INSERT INTO Cita (fecha_cita, hora_cita, motivo, veterinario_id, mascota_id)
    VALUES ('01/12/2025', '10:00', 'Consulta general', 1, 1);

    INSERT INTO Cita (fecha_cita, hora_cita, motivo, veterinario_id, mascota_id)
    VALUES ('01/12/2025', '12:00', 'Consulta general', 2, 2);

    INSERT INTO Cita (fecha_cita, hora_cita, motivo, veterinario_id, mascota_id)
    VALUES ('01/12/2025', '13:00', 'Consulta general', 2, 3);

    INSERT INTO Cita (fecha_cita, hora_cita, motivo, veterinario_id, mascota_id)
    VALUES ('02/12/2025', '08:00', 'Consulta general', 2, 1);

    INSERT INTO Diagnostico (medicamento_id, cita_id, detalle)
    VALUES (1, 1, 'Infección leve, administrar cada 8 horas por 7 días');

    INSERT INTO Diagnostico (medicamento_id, cita_id, detalle)
    VALUES (1, 2, 'Infección leve, administrar cada 8 horas por 7 días');

    INSERT INTO Diagnostico (medicamento_id, cita_id, detalle)
    VALUES (2, 2, 'Diarrea con presencia de gusanos, administrar cada 12 horas por 3 días');

    INSERT INTO Vacuna (nombre)
    VALUES ('Rabia');

    INSERT INTO Historial_Vacunacion (mascota_id, vacuna_id, fecha_vacunacion)
    VALUES (1,2, '2025-12-10');


    INSERT INTO Quirofano (nombre, ubicacion)
    VALUES ('Quirófano 1A', 'Piso 1');

    INSERT INTO Quirofano (nombre, ubicacion)
    VALUES ('Quirófano 1A2', 'Piso 1');

    INSERT INTO Quirofano (nombre, ubicacion)
    VALUES ('Quirófano 2A1', 'Piso 2');

    INSERT INTO Quirofano (nombre, ubicacion)
    VALUES ('Quirófano 2A2', 'Piso 2');

    INSERT INTO Programacion_Cirugia
    (mascota_id, veterinario_id, quirofano_id, fecha, hora_inicio, hora_fin)
    VALUES (2, 2, 1, '2025-06-01', '10:00', '11:00');

    INSERT INTO Programacion_Cirugia
    (mascota_id, veterinario_id, quirofano_id, fecha, hora_inicio, hora_fin)
    VALUES (2, 2, 1, '2025-06-01', '09:30', '10:30');


DELETE FROM Programacion_Cirugia;
DROP TABLE Quirofano;

