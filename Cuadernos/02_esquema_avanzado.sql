--Creación tabla quirófano y progración de cirugías
PRAGMA foreign_keys = ON;

CREATE TABLE Quirofano (
    quirofano_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(200) NOT NULL
);

CREATE TABLE Programacion_Cirugia (
    cirugia_id INTEGER PRIMARY KEY AUTOINCREMENT,
    mascota_id INTEGER NOT NULL,
    veterinario_id INTEGER NOT NULL,
    quirofano_id INTEGER NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    
    FOREIGN KEY (mascota_id) REFERENCES Mascota(mascota_id),
    FOREIGN KEY (veterinario_id) REFERENCES Veterinario(veterinario_id),
    FOREIGN KEY (quirofano_id) REFERENCES Quirofano(quirofano_id),

    CHECK (hora_inicio < hora_fin)
);

CREATE TRIGGER trg_valida_quirofano_insert
BEFORE INSERT ON Programacion_Cirugia
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN EXISTS (
            SELECT 1
            FROM Programacion_Cirugia pc
            WHERE pc.id_quirofano = NEW.id_quirofano
              AND pc.fecha = NEW.fecha
              AND NEW.hora_inicio < pc.hora_fin
              AND NEW.hora_fin > pc.hora_inicio
        )
        THEN RAISE(ABORT, 'Error: Quirófano ocupado en ese horario')
    END;
END;

-- TRIGGER ANTES DEL UPDATE
CREATE TRIGGER trg_valida_quirofano_update
BEFORE UPDATE ON Programacion_Cirugia
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN EXISTS (
            SELECT 1
            FROM Programacion_Cirugia pc
            WHERE pc.id_quirofano = NEW.id_quirofano
              AND pc.fecha = NEW.fecha
              AND pc.id_programacion <> OLD.id_programacion
              AND NEW.hora_inicio < pc.hora_fin
              AND NEW.hora_fin > pc.hora_inicio
        )
        THEN RAISE(ABORT, 'Error: Actualización inválida, quirófano ocupado')
    END;
END;