USE ABSystems;
GO

-- =====================================
-- Datos de prueba para usuarios
-- =====================================
INSERT INTO dbo.usuarios (email, contraseña) VALUES
(N'juan.perez@example.com', N'1234'),
(N'maria.lopez@example.com', N'5678'),
(N'carlos.ramirez@example.com', N'pass123'),
(N'ana.gomez@example.com', N'qwerty'),
(N'pedro.hernandez@example.com', N'admin');
GO

-- =====================================
-- Datos de prueba para estudiantes
-- =====================================
INSERT INTO dbo.estudiantes
(idusuario, nombres, apellidos, fechanacimiento, direccion, sexo, curp, telefono, modalidad, horariopreferencia, Email, RequiereAsistencia, DescripcionPersonal, VariosExamenes)
VALUES
(1, N'Juan', N'Pérez', '2000-05-10', N'Calle Falsa 123', N'Masculino', N'PEPJ000510HDFRRN01', N'5551112233', N'Presencial', N'08:00', N'juan.perez@example.com', 0, N'Estudiante dedicado a la tecnología.', NULL),
(2, N'María', N'López', '1999-09-21', N'Av. Central 456', N'Femenino', N'LOPM990921MDFRRN02', N'5552223344', N'En línea', N'10:00', N'maria.lopez@example.com', 1, N'Interesada en ciencias biológicas.', N'12,18'),
(3, N'Carlos', N'Ramírez', '2001-01-15', N'Calle Reforma 789', N'Masculino', N'RAMC010115HDFRRN03', N'5553334455', N'Presencial', N'09:00', N'carlos.ramirez@example.com', 0, N'Le gusta el derecho y la política.', NULL),
(4, N'Ana', N'Gómez', '2002-07-30', N'Col. Las Flores 321', N'Femenino', N'GOZA020730MDFRRN04', N'5554445566', N'Mixto', N'11:00', N'ana.gomez@example.com', 0, N'Apasionada por la educación.', N'15'),
(5, N'Pedro', N'Hernández', '1998-03-05', N'Boulevard Sur 654', N'Masculino', N'HERP980305HDFRRN05', N'5555556677', N'Presencial', N'14:00', N'pedro.hernandez@example.com', 1, N'Quiere combinar negocios y mercadotecnia.', NULL);
GO

-- =====================================
-- Datos de prueba para inscripciones
-- =====================================
INSERT INTO dbo.inscripciones (idusuario, idexamen, fechaexamen, horaexamen, codigoparticipacion)
VALUES
(1, 11, '2025-09-15', '08:00', N'ABC123'),
(2, 12, '2025-09-16', '10:00', N'DEF456'),
(3, 13, '2025-09-17', '09:00', N'GHI789'),
(4, 15, '2025-09-18', '11:00', N'JKL012'),
(5, 20, '2025-09-19', '14:00', N'MNO345');
GO
