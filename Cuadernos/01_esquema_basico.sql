PRAGMA foreign_keys = ON;

CREATE TABLE Dueno_mascota (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

CREATE TABLE Telefono (
    telefono_id INTEGER PRIMARY KEY AUTOINCREMENT,
    telefono VARCHAR(20) NOT NULL,
    cedula_dueno VARCHAR(20) NOT NULL,
    FOREIGN KEY (cedula_dueno) REFERENCES Dueno_mascota(cedula)
);

CREATE TABLE Mascota (
    mascota_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50),
    fecha_nacimiento DATE,
    cedula_dueno VARCHAR(20) NOT NULL,
    FOREIGN KEY (cedula_dueno) REFERENCES Dueno_mascota(cedula)
);

CREATE TABLE Veterinario (
    veterinario_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Especialidad (
    especialidad_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_especialidad VARCHAR(50) NOT NULL,
    veterinario_id INTEGER NOT NULL,
    FOREIGN KEY (veterinario_id) REFERENCES Veterinario(veterinario_id)
);

CREATE TABLE Cita (
    cita_id INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha_cita DATE NOT NULL,
    hora_cita TIME NOT NULL,
    motivo VARCHAR(200),
    veterinario_id INTEGER NOT NULL,
    mascota_id INTEGER NOT NULL,
    FOREIGN KEY (veterinario_id) REFERENCES Veterinario(veterinario_id),
    FOREIGN KEY (mascota_id) REFERENCES Mascota(mascota_id)
);

CREATE TABLE Medicamento (
    medicamento_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Diagnostico (
    diagnostico_id INTEGER PRIMARY KEY AUTOINCREMENT,
    medicamento_id INTEGER NOT NULL,
    cita_id INTEGER NOT NULL,
    detalle TEXT NOT NULL,
    FOREIGN KEY (medicamento_id) REFERENCES Medicamento(medicamento_id),
    FOREIGN KEY (cita_id) REFERENCES Cita(cita_id)
);

CREATE TABLE Vacuna (
    vacuna_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Historial_Vacunacion (
    historial_id INTEGER PRIMARY KEY AUTOINCREMENT,
    mascota_id INTEGER NOT NULL,
    vacuna_id INTEGER NOT NULL,
    fecha_vacunacion DATE NOT NULL,
    FOREIGN KEY (mascota_id) REFERENCES Mascota(mascota_id),
    FOREIGN KEY (vacuna_id) REFERENCES Vacuna(vacuna_id)
);