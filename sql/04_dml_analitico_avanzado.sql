-- =============================================
-- 04_DML_ANALITICO_AVANZADO.SQL
-- Sistema de Control de Acceso - Biblioteca UTS
-- Consultas de reporteria y agregacion
-- Cada consulta incluye pregunta de negocio que responde


USE Biblioteca_DB;
GO

-- =============================================
-- SECCION 1: INNER JOIN (3 consultas)


-- JOIN 1
-- Pregunta de negocio: Quienes han ingresado a la biblioteca
--                      y en que fecha y hora lo hicieron?
SELECT r.IdRegistro,
       a.Nombre,
       a.Matricula,
       a.Carrera,
       r.FechaHora
FROM REGISTRO_ACCESO r
INNER JOIN Alumnos a ON r.Matricula_Alumnos = a.Matricula
ORDER BY r.FechaHora DESC;

-- JOIN 2
-- Pregunta de negocio: Que alumnos ingresaron a la biblioteca
--                      durante el mes de agosto?
SELECT a.Nombre,
       a.Matricula,
       a.Carrera,
       r.FechaHora
FROM REGISTRO_ACCESO r
INNER JOIN Alumnos a ON r.Matricula_Alumnos = a.Matricula
WHERE MONTH(r.FechaHora) = 8
ORDER BY r.FechaHora DESC;

-- JOIN 3
-- Pregunta de negocio: Cuantas veces y en que fechas
--                      ha ingresado un alumno determinado?
SELECT a.Nombre,
       a.Matricula,
       a.Carrera,
       r.IdRegistro,
       r.FechaHora
FROM REGISTRO_ACCESO r
INNER JOIN Alumnos a ON r.Matricula_Alumnos = a.Matricula
WHERE r.Matricula_Alumnos = 'A12345678'
ORDER BY r.FechaHora DESC;

-- =============================================
-- SECCION 2: AGREGACION Y AGRUPACION (3 consultas)


-- AGR 1
-- Pregunta de negocio: En que mes del anio hay mas
--                      entradas de alumnos en la biblioteca?
SELECT YEAR(FechaHora)  AS Anio,
       MONTH(FechaHora) AS Mes,
       COUNT(*)         AS TotalIngresos
FROM REGISTRO_ACCESO
GROUP BY YEAR(FechaHora), MONTH(FechaHora)
ORDER BY Anio, Mes;

-- AGR 2
-- Pregunta de negocio: Cual es la carrera con mas
--                      alumnos registrados en el sistema?
SELECT Carrera,
       COUNT(*) AS TotalAlumnos
FROM Alumnos
GROUP BY Carrera
ORDER BY TotalAlumnos DESC;

-- AGR 3
-- Pregunta de negocio: Cual es el rango de fechas de visita
--                      de cada alumno a la biblioteca?
SELECT a.Nombre,
       a.Matricula,
       MIN(r.FechaHora) AS PrimerIngreso,
       MAX(r.FechaHora) AS UltimoIngreso,
       COUNT(*)         AS TotalIngresos
FROM REGISTRO_ACCESO r
INNER JOIN Alumnos a ON r.Matricula_Alumnos = a.Matricula
GROUP BY a.Nombre, a.Matricula
ORDER BY TotalIngresos DESC;

-- =============================================
-- SECCION 3: HAVING - FILTRO DE GRUPOS (2 consultas)


-- HAVING 1
-- Pregunta de negocio: Que alumnos son los usuarios
--                      mas frecuentes de la biblioteca?
SELECT a.Nombre,
       a.Matricula,
       a.Carrera,
       COUNT(r.IdRegistro) AS TotalIngresos
FROM REGISTRO_ACCESO r
INNER JOIN Alumnos a ON r.Matricula_Alumnos = a.Matricula
GROUP BY a.Nombre, a.Matricula, a.Carrera
HAVING COUNT(r.IdRegistro) > 2
ORDER BY TotalIngresos DESC;

-- HAVING 2
-- Pregunta de negocio: En que meses la biblioteca
--                      tuvo mayor demanda de acceso?
SELECT YEAR(FechaHora)  AS Anio,
       MONTH(FechaHora) AS Mes,
       COUNT(*)         AS TotalIngresos
FROM REGISTRO_ACCESO
GROUP BY YEAR(FechaHora), MONTH(FechaHora)
HAVING COUNT(*) > 5
ORDER BY TotalIngresos DESC;
GO