-- =============================================
-- 02_SEED_DATA.SQL
-- Sistema de Control de Acceso - Biblioteca UTS
-- Datos de prueba: minimo 5-10 registros por tabla

USE Biblioteca_DB;
GO

-- Datos de Alumnos (tabla padre primero)
INSERT INTO Alumnos (Matricula, Nombre, Carrera) VALUES
('A12345678', 'Irving Miranda Garcia',    'Ingenieria en TI e Innovacion Digital'),
('B12345678', 'Estrella Lopez Ramirez',   'Ingenieria en TI e Innovacion Digital'),
('C12345678', 'Juan Perez Sanchez',       'Ingenieria Industrial'),
('D12345678', 'Maria Torres Mendoza',     'Administracion de Empresas'),
('E12345678', 'Carlos Ruiz Flores',       'Ingenieria en TI e Innovacion Digital'),
('F12345678', 'Ana Gonzalez Herrera',     'Contabilidad'),
('G12345678', 'Luis Martinez Castillo',   'Ingenieria Industrial'),
('H12345678', 'Sofia Ramos Gutierrez',    'Administracion de Empresas'),
('I12345678', 'Pedro Alvarez Diaz',       'Ingenieria en TI e Innovacion Digital'),
('J12345678', 'Laura Vega Morales',       'Contabilidad');
GO

-- Datos de Bibliotecarios
INSERT INTO Bibliotecarios (Usuario, Contrasena) VALUES
('admin_biblioteca', 'biblioteca123'),
('bibliotecario1',   'pass123'),
('bibliotecario2',   'pass456'),
('bibliotecario3',   'pass789'),
('supervisor',       'super123');
GO

-- Datos de Registro de Acceso (tabla hija al final)
INSERT INTO REGISTRO_ACCESO (Matricula_Alumnos, FechaHora) VALUES
('A12345678', '2026-06-01 08:00:00'),
('B12345678', '2026-06-01 08:30:00'),
('C12345678', '2026-06-02 09:00:00'),
('D12345678', '2026-06-02 10:00:00'),
('E12345678', '2026-06-03 08:15:00'),
('A12345678', '2026-06-15 09:30:00'),
('F12345678', '2026-06-20 10:00:00'),
('A12345678', '2026-07-01 09:00:00'),
('B12345678', '2026-07-02 08:45:00'),
('G12345678', '2026-07-03 10:30:00'),
('H12345678', '2026-07-04 11:00:00'),
('I12345678', '2026-07-05 08:00:00'),
('A12345678', '2026-07-10 09:15:00'),
('C12345678', '2026-07-15 10:00:00'),
('B12345678', '2026-08-01 08:00:00'),
('J12345678', '2026-08-02 09:30:00'),
('A12345678', '2026-08-05 08:45:00'),
('D12345678', '2026-08-09 06:30:00'),
('E12345678', '2026-08-10 09:00:00'),
('F12345678', '2026-08-15 10:30:00');
GO