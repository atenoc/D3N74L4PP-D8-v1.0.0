--CREATE DATABASE IF NOT EXISTS dentaldb
CREATE DATABASE IF NOT EXISTS dentaldb DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;

USE dentaldb;

CREATE TABLE usuarios (
  id BINARY(16) NOT NULL,
  correo VARCHAR(30) NOT NULL,
  llave VARCHAR(30) NOT NULL,
  id_rol BINARY(16) NOT NULL,
  id_titulo BINARY(16) DEFAULT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellidop VARCHAR(20) NOT NULL,  
  apellidom VARCHAR(20) DEFAULT NULL,
  id_especialidad BINARY(16) DEFAULT NULL,
  telefono VARCHAR(10) DEFAULT NULL,
  fecha_creacion DATETIME NOT NULL,
  llave_status INT NOT NULL,
  id_usuario BINARY(16) NOT NULL,
  id_clinica BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE clinicas (
  id BINARY(16) NOT NULL,
  nombre VARCHAR(100) NOT NULL, 
  telefono VARCHAR(10) NOT NULL,
  correo VARCHAR(30) DEFAULT NULL,
  direccion VARCHAR(130) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  id_usuario BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE cat_roles (
  id BINARY(16) NOT NULL,
  descripcion VARCHAR(20) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_roles(id, descripcion) values ( UUID_TO_BIN('f7ffc7b5-7297-11ee-88de-00090ffe0001'), 'sop');
INSERT INTO cat_roles(id, descripcion) values ( UUID_TO_BIN(UUID()), 'admin');
INSERT INTO cat_roles(id, descripcion) values ( UUID_TO_BIN(UUID()), 'caja');
INSERT INTO cat_roles(id, descripcion) values ( UUID_TO_BIN(UUID()), 'asistente');
INSERT INTO cat_roles(id, descripcion) values ( UUID_TO_BIN(UUID()), 'recepcion');
INSERT INTO cat_roles(id, descripcion) values ( UUID_TO_BIN(UUID()), 'invitado');

CREATE TABLE cat_titulos (
  id BINARY(16) NOT NULL,
  descripcion VARCHAR(8) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_titulos(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Odont.');
INSERT INTO cat_titulos(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Dr.');
INSERT INTO cat_titulos(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Dra.');
INSERT INTO cat_titulos(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Aux.');
INSERT INTO cat_titulos(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Asist.');
INSERT INTO cat_titulos(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Enf.');

CREATE TABLE cat_especialidades (
  id BINARY(16) NOT NULL,
  descripcion VARCHAR(100) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Odontología general');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Cirugía oral y maxilofacial');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Endodoncia');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Odontología estética');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Odontopediatría');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Ortodoncia');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Patología bucal');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Periodoncia');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Prostodoncia y rehabilitación oral');
INSERT INTO cat_especialidades(id, descripcion) values ( UUID_TO_BIN(UUID()), 'Radiología oral y maxilofacial');

INSERT INTO usuarios(id, correo, llave, id_rol, id_titulo, nombre, apellidop, apellidom, id_especialidad, telefono, fecha_creacion, llave_status, id_usuario, id_clinica) 
values ( UUID_TO_BIN(UUID()) , 'example@gmail.com','123456', UUID_TO_BIN('f7ffc7b5-7297-11ee-88de-00090ffe0001'), 'Ing.', 'Car', 'Atn', 'T', 'Full', '5512345678', NOW(), 0, UUID_TO_BIN(UUID()), UUID_TO_BIN(UUID()) );

/*
CREATE TABLE personal (
  id BINARY(16) NOT NULL,
  titulo VARCHAR(5) NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellidop VARCHAR(20) NOT NULL,  
  apellidom VARCHAR(20) DEFAULT NULL,
  especialidad VARCHAR(25) NOT NULL,
  telefono VARCHAR(10) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  id_usuario BINARY(16) NOT NULL,
  id_centro BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);
*/


-- Querys de Ejemplo

-- Usuarios

/*
	use dentaldb;
	SELECT BIN_TO_UUID(id) id, correo, llave, rol, fecha_creacion, BIN_TO_UUID(id_usuario)id_usuario FROM usuarios;
	
	SELECT BIN_TO_UUID(id) id, correo, llave, rol, fecha_creacion, BIN_TO_UUID(id_usuario)id_usuario FROM usuarios WHERE BIN_TO_UUID(id_usuario) = '5ae55892-b9f9-11ed-9f1d-00090ffe0001';
	
	INSERT INTO usuarios(id, correo, llave, rol, fecha_creacion, id_usuario) values ( UUID_TO_BIN(UUID()) , 'atenoc@g.com','123456','sop', '2023-02-23 16:40:40', UUID_TO_BIN(UUID()) );
	
	UPDATE usuarios SET correo = 'otro@gmail.com', llave = '123', rol = 'asistente2' WHERE id = UUID_TO_BIN('d39dc997-ba20-11ed-9f1d-00090ffe0001');
	
	DELETE FROM usuarios WHERE id = uuid_to_bin('7e505e13-b867-11ed-9f1d-00090ffe0001');
	
*/

-- Centros

/*
	use dentaldb;
	
	-SELECT BIN_TO_UUID(id) id, nombre, telefono, correo, direccion, fecha_creacion, id_usuario FROM centros;
	
*/



-- renombrar nombre de columna
-- ALTER TABLE usuarios RENAME COLUMN fecha_creado TO fecha_creacion;

-- modificar tipo de dato de la columna
-- ALTER TABLE usuarios MODIFY fecha_creacion VARCHAR(30); 

