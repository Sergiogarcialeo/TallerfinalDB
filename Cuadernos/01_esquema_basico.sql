CREATE TABLE Dueno_mascota (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

CREATE TABLE Telefono (
    telefono_id INT AUTO_INCREMENT PRIMARY KEY,
    telefono VARCHAR(20) NOT NULL,
    cedula_dueno VARCHAR(20) NOT NULL,
    FOREIGN KEY (cedula_dueno) REFERENCES Dueno_mascota(cedula)
);

CREATE TABLE Mascota (
    mascota_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50),
    fecha_nacimiento DATE,
    cedula_dueno VARCHAR(20) NOT NULL,
    FOREIGN KEY (cedula_dueno) REFERENCES Dueno_mascota(cedula)
);

CREATE TABLE Veterinario (
    veterinario_id INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Especialidad (
    especialidad_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_especialidad VARCHAR(50) NOT NULL,
    veterinario_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (veterinario_id) REFERENCES Veterinario(veterinario_id)
);

CREATE TABLE Cita (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_cita DATE NOT NULL,
    hora_cita TIME NOT NULL,
    motivo VARCHAR(200),
    veterinario_id VARCHAR(20) NOT NULL,
    mascota_id INT NOT NULL,
    FOREIGN KEY (veterinario_id) REFERENCES Veterinario(veterinario_id),
    FOREIGN KEY (mascota_id) REFERENCES Mascota(mascota_id),
);

CREATE TABLE Medicamento (
    medicamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Diagnostico (
    diagnostico_id INT AUTO_INCREMENT PRIMARY KEY,
    medicamento_id INT NOT NULL,
    cita_id INT NOT NULL,
    detalle TEXT NOT NULL,
    FOREIGN KEY (medicamento_id) REFERENCES Medicamento(medicamento_id)
    FOREIGN KEY (cita_id) REFERENCES Cita(cita_id)
);

CREATE TABLE Vacuna (
    vacuna_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Historial_Vacunacion (
    historial_id INT AUTO_INCREMENT PRIMARY KEY,
    mascota_id INT NOT NULL,
    vacuna_id INT NOT NULL,
    fecha_vacunacion DATE NOT NULL,
    FOREIGN KEY (mascota_id) REFERENCES Mascota(mascota_id),
    FOREIGN KEY (vacuna_id) REFERENCES Vacuna(vacuna_id)
);