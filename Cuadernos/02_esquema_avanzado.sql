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

-- Trigger para evitar overbooking en quirófano
CREATE TRIGGER IF NOT EXISTS validar_overbooking
BEFORE INSERT ON Programacion_Cirugia
FOR EACH ROW
BEGIN
    SELECT
    CASE
        WHEN EXISTS (
            SELECT 1 FROM Programacion_Cirugia
            WHERE quirofano_id = NEW.quirofano_id
              AND fecha = NEW.fecha
              AND NEW.hora_inicio < hora_fin
              AND NEW.hora_fin > hora_inicio
        )
        THEN
            RAISE(ABORT, 'ERROR: Quirófano ocupado en ese horario')
    END;
END;