-- =============================================
-- 01_DDL_SCHEMA.SQL
-- Sistema de Control de Acceso - Biblioteca UTS
-- Definicion de tablas, PKs, FKs y restricciones

CREATE DATABASE Biblioteca_DB;
GO

USE Biblioteca_DB;
GO

-- Tabla padre: Alumnos

CREATE TABLE Alumnos (
    Matricula   VARCHAR(10)  NOT NULL,
    Nombre      VARCHAR(100) NOT NULL,
    Carrera     VARCHAR(80)  NOT NULL,
    CONSTRAINT PK_Alumnos PRIMARY KEY (Matricula)
);


-- Tabla padre: Bibliotecarios

CREATE TABLE Bibliotecarios (
    IdBibliotecario INT          NOT NULL IDENTITY(1,1),
    Usuario         VARCHAR(50)  NOT NULL,
    Contrasena      VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Bibliotecarios PRIMARY KEY (IdBibliotecario),
    CONSTRAINT UQ_Bibliotecarios_Usuario UNIQUE (Usuario)
);


-- Tabla hija: REGISTRO_ACCESO
-- Depende de Alumnos (FK)

CREATE TABLE REGISTRO_ACCESO (
    IdRegistro       INT         NOT NULL IDENTITY(1,1),
    Matricula_Alumnos VARCHAR(10) NOT NULL,
    FechaHora        DATETIME    NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_REGISTRO_ACCESO    PRIMARY KEY (IdRegistro),
    CONSTRAINT FK_REGISTRO_Alumnos   FOREIGN KEY (Matricula_Alumnos)
        REFERENCES Alumnos(Matricula)
);
GO