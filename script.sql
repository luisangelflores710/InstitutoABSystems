USE [master];
GO

-- Crear base de datos
IF DB_ID('ABSystems') IS NOT NULL
    DROP DATABASE ABSystems;
GO

CREATE DATABASE ABSystems;
GO

USE ABSystems;
GO

-- =====================================
-- Tabla: usuarios
-- =====================================
CREATE TABLE dbo.usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    email NVARCHAR(100) NOT NULL,
    contrase�a NVARCHAR(256) NOT NULL,
    fecharegistro DATETIME NULL CONSTRAINT DF_usuarios_fecharegistro DEFAULT GETDATE()
);
GO

CREATE UNIQUE INDEX UX_usuarios_email ON dbo.usuarios(email);
GO

-- =====================================
-- Tabla: examenes
-- =====================================
CREATE TABLE dbo.examenes (
    id INT IDENTITY(11,1) PRIMARY KEY, -- ID autoincremental desde 11
    nombre NVARCHAR(50) NOT NULL
);
GO

-- Insertar solo los valores que me diste
INSERT INTO dbo.examenes (nombre) VALUES
(N'Ingenier�a en Sistemas'),
(N'Biolog�a'),
(N'Derecho'),
(N'Comercio'),
(N'Educaci�n'),
(N'Psicolog�a'),
(N'Matem�ticas'),
(N'Qu�mica'),
(N'Econom�a'),
(N'Administraci�n y Mercadotecnia');
GO

-- =====================================
-- Tabla: estudiantes
-- =====================================
CREATE TABLE dbo.estudiantes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idusuario INT NOT NULL,
    nombres NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    fechanacimiento DATE NOT NULL,
    direccion NVARCHAR(200) NOT NULL,
    sexo NVARCHAR(20) NULL,
    curp NVARCHAR(18) NOT NULL,
    telefono NVARCHAR(15) NOT NULL,
    modalidad NVARCHAR(20) NULL,
    horariopreferencia NVARCHAR(50) NULL,
    Email NVARCHAR(100) NOT NULL,
    RequiereAsistencia BIT NOT NULL,
    DescripcionPersonal NVARCHAR(MAX) NULL,
    VariosExamenes NVARCHAR(MAX) NULL,
    VariosExamenesBool BIT NULL CONSTRAINT DF_estudiantes_VariosExamenesBool DEFAULT ((0)),
    CONSTRAINT FK_estudiantes_usuario FOREIGN KEY(idusuario) REFERENCES dbo.usuarios(id)
);
GO

-- =====================================
-- Tabla: inscripciones
-- =====================================
CREATE TABLE dbo.inscripciones (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idusuario INT NOT NULL,
    idexamen INT NOT NULL,
    fechaexamen DATE NOT NULL,
    horaexamen TIME(7) NOT NULL,
    codigoparticipacion NVARCHAR(20) NOT NULL,
    estado NVARCHAR(20) NULL CONSTRAINT DF_inscripciones_estado DEFAULT ('Inscrito'),
    CONSTRAINT FK_inscripciones_usuario FOREIGN KEY(idusuario) REFERENCES dbo.usuarios(id),
    CONSTRAINT FK_inscripciones_examen FOREIGN KEY(idexamen) REFERENCES dbo.examenes(id)
);
GO
