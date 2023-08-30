-- vista de estudiantes y su informacion
CREATE VIEW VistaEstudiantes AS
SELECT
    e.ID AS EstudianteID,
    CONCAT(e.Nombre, ' ', e.Apellido) AS NombreCompleto,
    u.CorreoElectronico,
    u.UniversidadID
FROM Estudiante e
INNER JOIN Usuario u ON e.UsuarioID = u.ID;

-- vistas de pasantias disponibles
CREATE VIEW VistaPasantiasDisponibles AS
SELECT
    p.ID AS PasantiaID,
    p.Titulo,
    p.Descripcion,
    p.Requisitos,
    p.Duracion,
    p.CarreraID,
    e.Nombre AS Empresa,
    p.Estado
FROM Pasantia p
INNER JOIN Empresa e ON p.EmpresaID = e.ID;

-- vista de solicitud de pasantias

CREATE VIEW VistaSolicitudesPasantias AS
SELECT
    sp.ID AS SolicitudID,
    CONCAT(est.Nombre, ' ', est.Apellido) AS Estudiante,
    p.Titulo AS Pasantia,
    sp.FechaSolicitud,
    sp.Estado
FROM SolicitudPasantia sp
INNER JOIN Estudiante est ON sp.EstudianteID = est.ID
INNER JOIN Pasantia p ON sp.PasantiaID = p.ID;


-- vistas de actividades de usuarios

CREATE VIEW VistaActividadesUsuarios AS
SELECT
    l.ID AS LogID,
    CONCAT(u.CorreoElectronico, ' (', r.Nombre, ')') AS UsuarioRol,
    l.FechaHora,
    l.Actividad
FROM Logs l
INNER JOIN Usuario u ON l.UsuarioID = u.ID
INNER JOIN Rol r ON u.RolID = r.ID;


-- vistas de empresas de pasantias

CREATE VIEW VistaEmpresasPasantias AS
SELECT
    e.ID AS EmpresaID,
    e.Nombre,
    e.Ubicacion,
    e.Estado
FROM Empresa e;

-- vista de resumen de estudiantes por carrera

CREATE VIEW VistaResumenEstudiantesCarrera AS
SELECT
    r.Nombre AS Recinto,
    c.Nombre AS Carrera,
    COUNT(e.ID) AS CantidadEstudiantes
FROM Estudiante e
INNER JOIN Recinto r ON e.RecintoID = r.ID
INNER JOIN Carrera c ON e.CarreraID = c.ID
GROUP BY r.Nombre, c.Nombre;

-- vista de recintos y carreras por universidad

CREATE VIEW VistaRecintosCarrerasUniversidad AS
SELECT
    u.Nombre AS Universidad,
    r.Nombre AS Recinto,
    GROUP_CONCAT(c.Nombre ORDER BY c.Nombre ASC SEPARATOR ', ') AS Carreras
FROM Recinto r
INNER JOIN Universidad u ON r.UniversidadID = u.ID
LEFT JOIN CarreraRecinto cr ON r.ID = cr.RecintoID
LEFT JOIN Carrera c ON cr.CarreraID = c.ID
GROUP BY u.Nombre, r.Nombre;

-- vista de estudiante por recintos y carreras
CREATE VIEW VistaEstudiantesRecintoCarrera AS
SELECT
    r.Nombre AS Recinto,
    c.Nombre AS Carrera,
    COUNT(e.ID) AS CantidadEstudiantes
FROM Estudiante e
INNER JOIN Recinto r ON e.RecintoID = r.ID
INNER JOIN Carrera c ON e.CarreraID = c.ID
GROUP BY r.Nombre, c.Nombre;


-- vista de pasantias por carreras

CREATE VIEW VistaPasantiasCarrera AS
SELECT
    c.Nombre AS Carrera,
    p.Titulo,
    p.Descripcion,
    p.Requisitos,
    p.Duracion,
    e.Nombre AS Empresa,
    p.Estado
FROM Pasantia p
INNER JOIN Carrera c ON p.CarreraID = c.ID
INNER JOIN Empresa e ON p.EmpresaID = e.ID;


-- vista de estudiante aprovados en pasantias
CREATE VIEW VistaEstudiantesAprobadosPasantias AS
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

