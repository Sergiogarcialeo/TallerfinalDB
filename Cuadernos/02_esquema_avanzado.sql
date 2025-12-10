--Creación tabla quirófano y progración de cirugías

CREATE TABLE Quirofano (
    quirofano_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(200) NOT NULL
);

CREATE TABLE Programacion_Cirugia (
    cirugia_id INT AUTO_INCREMENT PRIMARY KEY,
    mascota_id INT NOT NULL,
    veterinario_id INT NOT NULL,
    quirofano_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    
    FOREIGN KEY (mascota_id) REFERENCES Mascota(mascota_id),
    FOREIGN KEY (veterinario_id) REFERENCES Veterinario(veterinario_id),
    FOREIGN KEY (quirofano_id) REFERENCES Quirofano(quirofano_id),

    CHECK (hora_inicio < hora_fin)
);