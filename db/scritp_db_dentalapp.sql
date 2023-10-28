--CREATE DATABASE IF NOT EXISTS dentaldb
CREATE DATABASE IF NOT EXISTS dentaldb DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;

USE dentaldb;

CREATE TABLE usuarios (
  id BINARY(16) NOT NULL,
  correo VARCHAR(30) NOT NULL,
  llave VARCHAR(30) NOT NULL,
  id_rol BINARY(16) NOT NULL,
  id_titulo VARCHAR(10) DEFAULT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellidop VARCHAR(20) NOT NULL,  
  apellidom VARCHAR(20) DEFAULT NULL,
  id_especialidad VARCHAR(10) DEFAULT NULL,
  telefono VARCHAR(10) DEFAULT NULL,
  fecha_creacion DATETIME NOT NULL,
  llave_status INT NOT NULL,
  id_usuario BINARY(16) NOT NULL,
  id_clinica BINARY(16) NULL,
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
  rol VARCHAR(15) NULL,
  descripcion VARCHAR(25) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_roles(id, rol, descripcion) values ( UUID_TO_BIN('b29304d5-5d9b-11ee-8537-00090ffe0001'), 'sop', 'Usop');
INSERT INTO cat_roles(id, rol, descripcion) values ( UUID_TO_BIN('b28f9c23-5d9b-11ee-8537-00090ffe0001'), 'suadmin', 'Super Administrador');
INSERT INTO cat_roles(id, rol, descripcion) values ( UUID_TO_BIN('b2309c14-5d9b-11ee-8537-00090ffe0001'), 'adminn1', 'Administrador');
INSERT INTO cat_roles(id, rol, descripcion) values ( UUID_TO_BIN('b2903c41-5d9b-11ee-8537-00090ffe0001'), 'adminn2', 'Asistente Administrativo');
INSERT INTO cat_roles(id, rol, descripcion) values ( UUID_TO_BIN('b290fa05-5d9b-11ee-8537-00090ffe0001'), 'medic', 'Médico Especialista');
INSERT INTO cat_roles(id, rol, descripcion) values ( UUID_TO_BIN('b291aa62-5d9b-11ee-8537-00090ffe0001'), 'caja', 'Cajero(a)');
INSERT INTO cat_roles(id, rol, descripcion) values ( UUID_TO_BIN('b29262d2-5d9b-11ee-8537-00090ffe0001'), 'recepcion', 'Recepcionista');

CREATE TABLE cat_titulos (
  id VARCHAR(10) NOT NULL,
  titulo VARCHAR(8) NULL,
  descripcion VARCHAR(20) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_titulos(id, titulo, descripcion) values ('0101ODO', 'Odont.' , 'Odontólogo(a)');
INSERT INTO cat_titulos(id, titulo, descripcion) values ('0102DRR', 'Dr.', 'Doctor');
INSERT INTO cat_titulos(id, titulo, descripcion) values ('0103DRA', 'Dra.', 'Doctora');
INSERT INTO cat_titulos(id, titulo, descripcion) values ('0104AUX', 'Aux.', 'Auxiliar');
INSERT INTO cat_titulos(id, titulo, descripcion) values ('0105ASI', 'Asist.', 'Asistente');
INSERT INTO cat_titulos(id, titulo, descripcion) values ('0106ENF', 'Enf.', 'Enfermero(a)');
INSERT INTO cat_titulos(id, titulo, descripcion) values ('0107NAA', 'N/A', 'N/A');

CREATE TABLE cat_especialidades (
  id VARCHAR(10) NOT NULL,
  especialidad VARCHAR(100) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_especialidades(id, especialidad) values ('0201GRL', 'Odontología general');
INSERT INTO cat_especialidades(id, especialidad) values ('0202COM', 'Cirugía oral y maxilofacial');
INSERT INTO cat_especialidades(id, especialidad) values ('0203END', 'Endodoncia');
INSERT INTO cat_especialidades(id, especialidad) values ('0204OES', 'Odontología estética');
INSERT INTO cat_especialidades(id, especialidad) values ('0205ODP', 'Odontopediatría');
INSERT INTO cat_especialidades(id, especialidad) values ('0206ORT', 'Ortodoncia');
INSERT INTO cat_especialidades(id, especialidad) values ('0207PTB', 'Patología bucal');
INSERT INTO cat_especialidades(id, especialidad) values ('0208PRD', 'Periodoncia');
INSERT INTO cat_especialidades(id, especialidad) values ('0209PRO', 'Prostodoncia y rehabilitación oral');
INSERT INTO cat_especialidades(id, especialidad) values ('0210ROM', 'Radiología oral y maxilofacial');
INSERT INTO cat_especialidades(id, especialidad) values ('0210NAA', 'N/A');

INSERT INTO usuarios(id, correo, llave, id_rol, id_titulo, nombre, apellidop, apellidom, id_especialidad, telefono, fecha_creacion, llave_status, id_usuario, id_clinica) 
values ( UUID_TO_BIN(UUID()) , 'example@gmail.com','123456', UUID_TO_BIN('b29304d5-5d9b-11ee-8537-00090ffe0001'), '0107NAA', 'Car', 'Atn', 'T', '0210NAA', '0000000000', NOW(), 0, UUID_TO_BIN(UUID()), UUID_TO_BIN(UUID()) );

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

