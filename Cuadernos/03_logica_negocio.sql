BEGIN TRANSACTION;

-- Verificar si el quirófano está ocupado
SELECT COUNT(*) AS conflictos
FROM Programacion_Cirugia
WHERE quirofano_id = ?       -- reemplazar por el id de quirófano
  AND fecha = ?              -- reemplazar por la fecha 'YYYY-MM-DD'
  AND ? < hora_fin           -- hora_inicio de la nueva cirugía
  AND ? > hora_inicio;       -- hora_fin de la nueva cirugía

-- Si conflictos = 0, insertar la cirugía:
INSERT INTO Programacion_Cirugia
(mascota_id, veterinario_id, quirofano_id, fecha, hora_inicio, hora_fin)
VALUES (?, ?, ?, ?, ?, ?);

COMMIT;



