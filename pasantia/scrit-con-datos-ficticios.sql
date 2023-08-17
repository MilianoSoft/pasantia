-- ejecute en el mismo orden de arriba hacia abajo cada comando --

use pasantia;
-- Insertar datos en las tablas sin dependencias
INSERT INTO Universidad (ID, Nombre) VALUES (1, 'UAPA');

INSERT INTO Carrera (ID, Nombre) VALUES
    (1, 'Ingeniería'),
    (2, 'Medicina'),
    (3, 'Derecho');

INSERT INTO Empresa (ID, Nombre, Descripcion, Ubicacion, CorreoContacto, Estado) VALUES
    (1, 'TechCorp', 'Empresa de desarrollo de software', 'Santiago, RD', 'info@techcorp.com', 'Aprobada'),
    (2, 'SaludTotal', 'Centro médico', 'Nagua, RD', 'info@saludtotal.com', 'Pendiente'),
    (3, 'LegalConsult', 'Firma de abogados', 'Santo Domingo, RD', 'info@legalconsult.com', 'Aprobada');

-- Insertar datos en las tablas con dependencias
INSERT INTO Recinto (ID, Nombre, UniversidadID) VALUES
    (1, 'UAPA Santiago', 1),
    (2, 'UAPA Nagua', 1),
    (3, 'UAPA SantoDomingo', 1);

INSERT INTO CarreraUniversidad (ID, CarreraID, UniversidadID) VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1);

INSERT INTO CarreraRecinto (ID, CarreraID, RecintoID) VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

INSERT INTO Usuario (ID, CorreoElectronico, Contrasena, Rol) VALUES
    (1, 'estudiante1@gmail.com', 'password1', 'estudiante'),
    (2, 'estudiante2@gmail.com', 'password2', 'estudiante'),
    (3, 'estudiante3@gmail.com', 'password3', 'estudiante');

INSERT INTO Estudiante (ID, UsuarioID, Nombre, Apellido, CarreraUniversidadID, RecintoID, TrimestreActual, EmpresaPreferidaID, Matricula) VALUES
    (1, 1, 'Juan', 'Pérez', 1, 1, 5, NULL, '202301'),
    (2, 2, 'Ana', 'Rodríguez', 2, 2, 4, NULL, '202302'),
    (3, 3, 'Carlos', 'Martínez', 3, 3, 6, NULL, '202303');

INSERT INTO Pasantia (ID, Titulo, Descripcion, Requisitos, FechaInicio, Duracion, CarreraUniversidadID, EmpresaID, Estado) VALUES
    (1, 'Desarrollador Junior', 'Pasantía en desarrollo de software', 'Estudiantes de Ingeniería', '2023-09-01', 3, 1, 1, 'Pendiente'),
    (2, 'Asistente Médico', 'Pasantía en el área de salud', 'Estudiantes de Medicina', '2023-10-15', 6, 2, 2, 'Aprobada'),
    (3, 'Pasante Legal', 'Pasantía en firma de abogados', 'Estudiantes de Derecho', '2023-11-01', 4, 3, 3, 'Pendiente');

INSERT INTO SolicitudPasantia (ID, EstudianteID, PasantiaID, EmpresaSugeridaID, EmpresaAsignadaID, FechaSolicitud, Estado) VALUES
    (1, 1, 1, NULL, NULL, '2023-08-10', 'Pendiente'),
    (2, 2, 2, NULL, 2, '2023-08-11', 'Aprobada'),
    (3, 3, 3, NULL, NULL, '2023-08-12', 'Pendiente');

INSERT INTO AsignaturaOptativa (ID, Nombre, InformacionAdicional, CarreraUniversidadID) VALUES
    (1, 'Desarrollo Web Avanzado', 'HTML5, CSS3, JavaScript, etc.', 1),
    (2, 'Anatomía Humana', 'Estudio del cuerpo humano', 2),
    (3, 'Derecho de Contratos', 'Leyes y contratos legales', 3);
