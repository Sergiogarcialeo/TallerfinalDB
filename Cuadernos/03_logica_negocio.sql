BEGIN TRANSACTION;

SELECT CASE
    WHEN EXISTS (
        SELECT 1
        FROM PROGRAMACION_CIRUGIA pc
        WHERE pc.quirofano_id = :p_quirofano
          AND pc.fecha = :p_fecha
          AND :p_hora_inicio < pc.hora_fin
          AND :p_hora_fin > pc.hora_inicio
    )
    THEN RAISE(ABORT, 'Quirófano ocupado (validación SP)')
END;

INSERT INTO Programacion_Cirugia (
    mascota_id, veterinario_id, quirofano_id,
    fecha, hora_inicio, hora_fin
) VALUES (
    :p_mascota, :p_veterinario, :p_quirofano,
    :p_fecha, :p_hora_inicio, :p_hora_fin
);

COMMIT;
