-- Active: 1722044619852@@127.0.0.1@3306
CREATE DATABASE base_militar
    DEFAULT CHARACTER SET = 'utf8mb4';

    USE base_militar;

    CREATE TABLE Servicio(    
        codigo_servicio INT(5) AUTO_INCREMENT PRIMARY KEY,
        servicio_actividad VARCHAR(25)
    );

    CREATE TABLE Compania(
        codigo_compania INT(5) AUTO_INCREMENT PRIMARY KEY,
        actividad VARCHAR(40)
    );

    CREATE TABLE Cuerpo_Ejercito(
        codigo_cuerpo INT(5) AUTO_INCREMENT PRIMARY KEY,
        cuerpo_denominacion VARCHAR(40)
    );

    CREATE TABLE Ubicacion(
        id_ubicacion INT(5) AUTO_INCREMENT PRIMARY KEY,
        ubicacion_ciudad VARCHAR(40),
        ubicacion_departamento VARCHAR(40),
        ubicacion_barrio VARCHAR(40),
        ubicacion_direccion VARCHAR(40)
    );

    CREATE TABLE Cuartel(
        codigo_cuartel INT(5) AUTO_INCREMENT PRIMARY KEY,
        cuartel_nombre VARCHAR(40),
        ubicacion_id INT NOT NULL,
        FOREIGN KEY fk_ubicacion(ubicacion_id) REFERENCES Ubicacion(id_ubicacion)
    );

    CREATE TABLE Soldado(
        codigo_soldado INT(5) AUTO_INCREMENT PRIMARY KEY,
        primer_nombre VARCHAR(40),
        segundo_nombre VARCHAR(40),
        primer_apellido VARCHAR(40),
        segundo_apellido VARCHAR(40),
        compania_id INT NOT NULL,
        cuerpo_id INT NOT NULL,
        cuartel_id INT NOT NULL,
        FOREIGN KEY fk_compania(compania_id) REFERENCES Compania(codigo_compania),
        FOREIGN KEY fk_cuerpo(cuerpo_id) REFERENCES Cuerpo_Ejercito(codigo_cuerpo),
        FOREIGN KEY fk_cuartel(cuartel_id) REFERENCES Cuartel(codigo_cuartel)
    );

    CREATE TABLE Soldado_Servicio(
        soldado_codigo INT NOT NULL,
        servicio_codigo INT NOT NULL,
        FOREIGN KEY fk_soldado_servicio(soldado_codigo) REFERENCES Soldado(codigo_soldado),
        FOREIGN KEY fk_codigo_servicio(servicio_codigo) REFERENCES Servicio(codigo_servicio)
    );

    CREATE TABLE Compania_Cuartel(
        compania_codigo INT NOT NULL,
        cuartel_codigo INT NOT NULL,
        FOREIGN KEY fk_codigo_compania(compania_codigo) REFERENCES Compania(codigo_compania),
        FOREIGN KEY fk_codigo_cuartel(cuartel_codigo) REFERENCES Cuartel(codigo_cuartel)
    );

    ALTER TABLE Soldado_Servicio ADD COLUMN fecha_realizacion DATETIME;