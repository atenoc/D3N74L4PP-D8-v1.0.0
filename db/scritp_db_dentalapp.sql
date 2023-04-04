--CREATE DATABASE IF NOT EXISTS dentaldb
CREATE DATABASE IF NOT EXISTS dentaldb DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;

USE dentaldb;

CREATE TABLE usuarios (
  id BINARY(16) NOT NULL,
  correo VARCHAR(30) NOT NULL,
  llave VARCHAR(30) NOT NULL,
  rol VARCHAR(15) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  id_usuario BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE centros (
  id BINARY(16) NOT NULL,
  nombre VARCHAR(40) NOT NULL, 
  telefono VARCHAR(10) NOT NULL,
  correo VARCHAR(30) DEFAULT NULL,
  direccion VARCHAR(130) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  id_usuario BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

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

	#	Time	Action	Message	Duration / Fetch
0	1	18:40:08	CREATE DATABASE IF NOT EXISTS dentaldb CHARACTER SET utf8 COLLATE utf8_spanish_2_ci	Error Code: 1273. Unknown collation: 'utf8_spanish_2_ci'	0.000 sec

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

