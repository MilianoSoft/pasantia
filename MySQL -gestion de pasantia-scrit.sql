-- crea la base de datos pasantia
create database gestionPasantia;

-- Tabla Universidad
CREATE TABLE Universidad (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla Recinto
CREATE TABLE Recinto (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    UniversidadID INT,
    FOREIGN KEY (UniversidadID) REFERENCES Universidad(ID)
);

-- Tabla Carrera
CREATE TABLE Carrera (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla CarreraRecinto
CREATE TABLE CarreraRecinto (
    ID INT PRIMARY KEY,
    CarreraID INT,
    RecintoID INT,
    FOREIGN KEY (CarreraID) REFERENCES Carrera(ID),
    FOREIGN KEY (RecintoID) REFERENCES Recinto(ID)
);

-- Tabla Empresa
CREATE TABLE Empresa (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    Ubicacion VARCHAR(255),
    CorreoContacto VARCHAR(255),
    TelefonoContacto VARCHAR(20),
    Estado VARCHAR(255)
);

-- Tabla Rol
CREATE TABLE Rol (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla Usuario
CREATE TABLE Usuario (
    ID INT PRIMARY KEY,
    CorreoElectronico VARCHAR(255),
    Contrasena VARCHAR(255),
    RolID INT,
    UniversidadID INT,
    FOREIGN KEY (RolID) REFERENCES Rol(ID),
    FOREIGN KEY (UniversidadID) REFERENCES Universidad(ID)
);

-- Tabla Estudiante
CREATE TABLE Estudiante (
    ID INT PRIMARY KEY,
    UsuarioID INT,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    RecintoID INT,
    TrimestreActual INT,
    EmpresaPreferidaID INT,
    Matricula VARCHAR(255),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID),
    FOREIGN KEY (RecintoID) REFERENCES Recinto(ID),
    FOREIGN KEY (EmpresaPreferidaID) REFERENCES Empresa(ID)
);

-- Tabla Pasantia
CREATE TABLE Pasantia (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Descripcion TEXT,
    Requisitos TEXT,
    FechaInicio DATE,
    Duracion INT,
    CarreraID INT,
    EmpresaID INT,
    Estado VARCHAR(255),
    FOREIGN KEY (CarreraID) REFERENCES Carrera(ID),
    FOREIGN KEY (EmpresaID) REFERENCES Empresa(ID)
);

-- Tabla SolicitudPasantia
CREATE TABLE SolicitudPasantia (
    ID INT PRIMARY KEY,
    EstudianteID INT,
    PasantiaID INT,
    EmpresaSugeridaID INT,
    FechaSolicitud DATE,
    Estado VARCHAR(255),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiante(ID),
    FOREIGN KEY (PasantiaID) REFERENCES Pasantia(ID),
    FOREIGN KEY (EmpresaSugeridaID) REFERENCES Empresa(ID)
);

-- Tabla AsignaturaOptativa
CREATE TABLE AsignaturaOptativa (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    InformacionAdicional TEXT,
    CarreraID INT,
    FOREIGN KEY (CarreraID) REFERENCES Carrera(ID)
);

-- Tabla Logs
CREATE TABLE Logs (
    ID INT PRIMARY KEY,
    UsuarioID INT,
    FechaHora TIMESTAMP,
    Actividad TEXT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID)
);


