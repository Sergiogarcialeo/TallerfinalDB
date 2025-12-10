DELIMITER $$

CREATE PROCEDURE sp_agendar_cirugia (
    IN p_mascota_id INT,
    IN p_veterinario_id INT,
    IN p_quirofano_id INT,
    IN p_fecha DATE,
    IN p_hora_inicio TIME,
    IN p_hora_fin TIME
)
BEGIN
    -- Inicio de la transacción
    START TRANSACTION;

    -- Verificación de traslape de horarios
    IF EXISTS (
        SELECT 1
        FROM Programacion_Cirugia
        WHERE quirofano_id = p_quirofano_id
          AND fecha = p_fecha
          AND p_hora_inicio < hora_fin
          AND p_hora_fin > hora_inicio
    ) THEN
        
        -- cancela la operación
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: El quirófano ya está ocupado en ese horario.';
    
    ELSE
        -- inserta la cirugía
        INSERT INTO Programacion_Cirugia 
        (mascota_id, veterinario_id, quirofano_id, fecha, hora_inicio, hora_fin)
        VALUES (p_mascota_id, p_veterinario_id, p_quirofano_id, p_fecha, p_hora_inicio, p_hora_fin);

        
        COMMIT;
    END IF;

END$$

DELIMITER ;