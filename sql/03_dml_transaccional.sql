-- =============================================
-- 03_DML_TRANSACCIONAL.SQL
-- Sistema de Control de Acceso - Biblioteca UTS
-- Sentencias transaccionales usadas en Windows Forms


USE Biblioteca_DB;
GO

-- INSERT: Registrar entrada de un alumno (HU1)
INSERT INTO REGISTRO_ACCESO (Matricula_Alumnos)
VALUES ('A12345678');

-- INSERT: Agregar un nuevo alumno al sistema
INSERT INTO Alumnos (Matricula, Nombre, Carrera)
VALUES ('K12345678', 'Pedro Nuevo Alumno', 'Ingenieria en TI e Innovacion Digital');

-- SELECT: Validar si una matricula existe (HU1)
-- Pregunta: La matricula ingresada pertenece a un alumno registrado?
SELECT COUNT(*)
FROM Alumnos
WHERE Matricula = 'A12345678';

-- SELECT: Iniciar sesion del bibliotecario (HU2)
-- Pregunta: Las credenciales ingresadas son correctas?
SELECT COUNT(*)
FROM Bibliotecarios
WHERE [Usuario]    = 'admin_biblioteca'
AND   [Contrasena] = 'biblioteca123';

-- SELECT: Buscar registros por matricula (HU4)
-- Pregunta: Cuantas veces ha ingresado un alumno especifico?
SELECT r.IdRegistro,
       a.Nombre,
       r.Matricula_Alumnos,
       r.FechaHora
FROM REGISTRO_ACCESO r
INNER JOIN Alumnos a ON r.Matricula_Alumnos = a.Matricula
WHERE r.Matricula_Alumnos = 'A12345678'
ORDER BY r.FechaHora DESC;

-- SELECT: Consultar todos los registros (HU3)
-- Pregunta: Quienes han ingresado a la biblioteca y cuando?
SELECT r.IdRegistro,
       a.Nombre,
       r.Matricula_Alumnos,
       r.FechaHora
FROM REGISTRO_ACCESO r
INNER JOIN Alumnos a ON r.Matricula_Alumnos = a.Matricula
ORDER BY r.FechaHora DESC;

-- SELECT: Filtrar registros por mes (HU5)
-- Pregunta: Cuantos alumnos ingresaron en agosto 2026?
SELECT r.IdRegistro,
       a.Nombre,
       r.Matricula_Alumnos,
       r.FechaHora
FROM REGISTRO_ACCESO r
INNER JOIN Alumnos a ON r.Matricula_Alumnos = a.Matricula
WHERE MONTH(r.FechaHora) = 8
ORDER BY r.FechaHora DESC;