-- ejecute en el mismo orden de arriba hacia abajo cada tabla --

  -- se crea la base de datos--
create database pasantia;

-- Tabla para las Universidades
CREATE TABLE Universidad (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla para los Recintos
CREATE TABLE Recinto (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    UniversidadID INT,
    FOREIGN KEY (UniversidadID) REFERENCES Universidad(ID)
);

-- Tabla para las Carreras
CREATE TABLE Carrera (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla para la relación entre Carreras y Universidades
CREATE TABLE CarreraUniversidad (
    ID INT PRIMARY KEY,
    CarreraID INT,
    UniversidadID INT,
    FOREIGN KEY (CarreraID) REFERENCES Carrera(ID),
    FOREIGN KEY (UniversidadID) REFERENCES Universidad(ID)
);

-- Tabla para la relación entre Carreras y Recintos
CREATE TABLE CarreraRecinto (
    ID INT PRIMARY KEY,
    CarreraID INT,
    RecintoID INT,
    FOREIGN KEY (CarreraID) REFERENCES Carrera(ID),
    FOREIGN KEY (RecintoID) REFERENCES Recinto(ID)
);

-- Tabla para los Usuarios
CREATE TABLE Usuario (
    ID INT PRIMARY KEY,
    CorreoElectronico VARCHAR(255),
    Contrasena VARCHAR(255),
    Rol VARCHAR(255)
);

-- Tabla para los Estudiantes
CREATE TABLE Estudiante (
    ID INT PRIMARY KEY,
    UsuarioID INT,
    matricula int,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    CarreraUniversidadID INT,
    RecintoID INT,
    TrimestreActual INT,
    EmpresaPreferidaID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID),
    FOREIGN KEY (CarreraUniversidadID) REFERENCES CarreraUniversidad(ID),
    FOREIGN KEY (RecintoID) REFERENCES Recinto(ID),
    FOREIGN KEY (EmpresaPreferidaID) REFERENCES Empresa(ID)
);

-- Tabla para las Empresas
CREATE TABLE Empresa (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    Ubicacion VARCHAR(255),
    CorreoContacto VARCHAR(255),
    Estado VARCHAR(255)
);

-- Tabla para las Pasantías
CREATE TABLE Pasantia (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Descripcion TEXT,
    Requisitos TEXT,
    FechaInicio DATE,
    Duracion INT,
    CarreraUniversidadID INT,
    EmpresaID INT,
    Estado VARCHAR(255),
    FOREIGN KEY (CarreraUniversidadID) REFERENCES CarreraUniversidad(ID),
    FOREIGN KEY (EmpresaID) REFERENCES Empresa(ID)
);

-- Tabla para las Solicitudes de Pasantía
CREATE TABLE SolicitudPasantia (
    ID INT PRIMARY KEY,
    EstudianteID INT,
    PasantiaID INT,
    EmpresaSugeridaID INT,
    EmpresaAsignadaID INT,
    FechaSolicitud DATE,
    Estado VARCHAR(255),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiante(ID),
    FOREIGN KEY (PasantiaID) REFERENCES Pasantia(ID),
    FOREIGN KEY (EmpresaSugeridaID) REFERENCES Empresa(ID),
    FOREIGN KEY (EmpresaAsignadaID) REFERENCES Empresa(ID)
);

-- Tabla para las Asignaturas Optativas
CREATE TABLE AsignaturaOptativa (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    InformacionAdicional TEXT,
    CarreraUniversidadID INT,
    FOREIGN KEY (CarreraUniversidadID) REFERENCES CarreraUniversidad(ID)
);

