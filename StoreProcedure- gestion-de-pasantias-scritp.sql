
-- registrar usuario
DELIMITER //
CREATE PROCEDURE RegistrarUsuario(
    IN correo VARCHAR(255),
    IN contrasena VARCHAR(255),
    IN rolID INT,
    IN universidadID INT
)
BEGIN
    INSERT INTO Usuario (CorreoElectronico, Contrasena, RolID, UniversidadID)
    VALUES (correo, contrasena, rolID, universidadID);
END //
DELIMITER ;

-- registrar estudiante
DELIMITER //
CREATE PROCEDURE RegistrarEstudiante(
    IN usuarioID INT,
    IN nombre VARCHAR(255),
    IN apellido VARCHAR(255),
    IN recintoID INT,
    IN trimestre INT,
    IN empresaPreferidaID INT,
    IN matricula VARCHAR(255)
)
BEGIN
    INSERT INTO Estudiante (UsuarioID, Nombre, Apellido, RecintoID, TrimestreActual, EmpresaPreferidaID, Matricula)
    VALUES (usuarioID, nombre, apellido, recintoID, trimestre, empresaPreferidaID, matricula);
END //
DELIMITER ;


-- registrar pasantia
DELIMITER //
CREATE PROCEDURE RegistrarPasantia(
    IN titulo VARCHAR(255),
    IN descripcion TEXT,
    IN requisitos TEXT,
    IN fechaInicio DATE,
    IN duracion INT,
    IN carreraID INT,
    IN empresaID INT
)
BEGIN
    INSERT INTO Pasantia (Titulo, Descripcion, Requisitos, FechaInicio, Duracion, CarreraID, EmpresaID, Estado)
    VALUES (titulo, descripcion, requisitos, fechaInicio, duracion, carreraID, empresaID, 'Pendiente');
END //
DELIMITER ;

-- registrar solicitud de pasantia
DELIMITER //
CREATE PROCEDURE RegistrarSolicitudPasantia(
    IN estudianteID INT,
    IN pasantiaID INT,
    IN empresaSugeridaID INT,
    IN fechaSolicitud DATE
)
BEGIN
    INSERT INTO SolicitudPasantia (EstudianteID, PasantiaID, EmpresaSugeridaID, FechaSolicitud, Estado)
    VALUES (estudianteID, pasantiaID, empresaSugeridaID, fechaSolicitud, 'Pendiente');
END //
DELIMITER ;

-- aprovar o rechazar solicitud de pasantia
DELIMITER //
CREATE PROCEDURE AprobarRechazarSolicitudPasantia(
    IN solicitudID INT,
    IN nuevoEstado VARCHAR(255)
)
BEGIN
    UPDATE SolicitudPasantia
    SET Estado = nuevoEstado
    WHERE ID = solicitudID;
END //
DELIMITER ;

-- actualizar informacion de estudiante
DELIMITER //
CREATE PROCEDURE ActualizarInformacionEstudiante(
    IN estudianteID INT,
    IN nombre VARCHAR(255),
    IN apellido VARCHAR(255),
    IN recintoID INT,
    IN trimestre INT,
    IN empresaPreferidaID INT,
    IN matricula VARCHAR(255)
)
BEGIN
    UPDATE Estudiante
    SET Nombre = nombre,
        Apellido = apellido,
        RecintoID = recintoID,
        TrimestreActual = trimestre,
        EmpresaPreferidaID = empresaPreferidaID,
        Matricula = matricula
    WHERE ID = estudianteID;
END //
DELIMITER ;

-- actualizar informacion de pasantia
DELIMITER //
CREATE PROCEDURE ActualizarInformacionPasantia(
    IN pasantiaID INT,
    IN titulo VARCHAR(255),
    IN descripcion TEXT,
    IN requisitos TEXT,
    IN fechaInicio DATE,
    IN duracion INT,
    IN empresaID INT
)
BEGIN
    UPDATE Pasantia
    SET Titulo = titulo,
        Descripcion = descripcion,
        Requisitos = requisitos,
        FechaInicio = fechaInicio,
        Duracion = duracion,
        EmpresaID = empresaID
    WHERE ID = pasantiaID;
END //
DELIMITER ;

-- listar pasantias disponibles

DELIMITER //
CREATE PROCEDURE ListarPasantiasDisponibles()
BEGIN
    SELECT
        p.ID AS PasantiaID,
        p.Titulo,
        p.Descripcion,
        p.Requisitos,
        p.FechaInicio,
        p.Duracion,
        p.CarreraID,
        e.Nombre AS Empresa,
        p.Estado
    FROM Pasantia p
    INNER JOIN Empresa e ON p.EmpresaID = e.ID;
END //
DELIMITER ;

-- generar reporte de estudiantes por carrera
DELIMITER //
CREATE PROCEDURE GenerarReporteEstudiantesCarrera()
BEGIN
    SELECT
        r.Nombre AS Recinto,
        c.Nombre AS Carrera,
        COUNT(e.ID) AS CantidadEstudiantes
    FROM Estudiante e
    INNER JOIN Recinto r ON e.RecintoID = r.ID
    INNER JOIN Carrera c ON e.CarreraID = c.ID
    GROUP BY r.Nombre, c.Nombre;
END //
DELIMITER ;

-- generar reporte de actividades de usuarios logs
DELIMITER //
CREATE PROCEDURE GenerarReporteActividadesUsuarios()
BEGIN
    SELECT
        l.ID AS LogID,
        CONCAT(u.CorreoElectronico, ' (', r.Nombre, ')') AS UsuarioRol,
        l.FechaHora,
        l.Actividad
    FROM Logs l
    INNER JOIN Usuario u ON l.UsuarioID = u.ID
    INNER JOIN Rol r ON u.RolID = r.ID;
END //
DELIMITER ;

-- generar reporte de pasantias aprobadas
DELIMITER //
CREATE PROCEDURE GenerarReportePasantiasAprobadas()
BEGIN
    SELECT
        CONCAT(est.Nombre, ' ', est.Apellido) AS Estudiante,
        p.Titulo AS Pasantia,
        e.Nombre AS Empresa,
        sp.Estado
    FROM SolicitudPasantia sp
    INNER JOIN Estudiante est ON sp.EstudianteID = est.ID
    INNER JOIN Pasantia p ON sp.PasantiaID = p.ID
    INNER JOIN Empresa e ON p.EmpresaID = e.ID
    WHERE sp.Estado = 'Aprobada';
END //
DELIMITER ;

-- listar universidades y recintos
DELIMITER //
CREATE PROCEDURE ListarUniversidadesRecintos()
BEGIN
    SELECT
        u.Nombre AS Universidad,
        r.Nombre AS Recinto
    FROM Universidad u
    INNER JOIN Recinto r ON u.ID = r.UniversidadID;
END //
DELIMITER ;

--