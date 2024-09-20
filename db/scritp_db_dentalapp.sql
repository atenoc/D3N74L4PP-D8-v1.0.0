-- CREATE DATABASE IF NOT EXISTS dentaldb
CREATE DATABASE IF NOT EXISTS dentaldb DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;

USE dentaldb;

CREATE TABLE usuarios (
  id BINARY(16) NOT NULL,
  correo VARCHAR(30) NOT NULL,
  llave VARCHAR(65) NOT NULL,
  id_rol BINARY(16) NOT NULL,
  id_titulo VARCHAR(10) DEFAULT NULL,
  nombre VARCHAR(30) NOT NULL,
  apellidop VARCHAR(20) NOT NULL,  
  apellidom VARCHAR(20) DEFAULT NULL,
  id_especialidad VARCHAR(10) DEFAULT NULL,
  telefono VARCHAR(10) DEFAULT NULL,
  llave_status INT NOT NULL,
  id_clinica BINARY(16) NULL,
  -- id_plan VARCHAR(10) NOT NULL,
  -- id_estatus_pago BINARY(16) DEFAULT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE clinicas (
  id BINARY(16) NOT NULL,
  nombre VARCHAR(100) NOT NULL, 
  telefono VARCHAR(10) NOT NULL,
  correo VARCHAR(30) DEFAULT NULL,
  direccion VARCHAR(130) NOT NULL,
  id_plan VARCHAR(10) NOT NULL,
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


CREATE TABLE cat_estatus_cuenta (
  id VARCHAR(10) NOT NULL,
  estatus_cuenta VARCHAR(15) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_estatus_cuenta(id, estatus_cuenta) values ('0301ACT', 'Activa');
INSERT INTO cat_estatus_cuenta(id, estatus_cuenta) values ('0302SUS', 'Suspendida');
INSERT INTO cat_estatus_cuenta(id, estatus_cuenta) values ('0303BLO', 'Bloqueada');


CREATE TABLE cat_planes (
  id VARCHAR(10) NOT NULL,
  plan VARCHAR(30) NULL,
  precio VARCHAR(8) NULL,
  caracteristicas VARCHAR(100) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_planes(id, plan, precio, caracteristicas) values ('0401PF30', 'Prueba gratis por 30 días', '0', 'Prueba por gratis 30 días');
INSERT INTO cat_planes(id, plan, precio, caracteristicas) values ('0402PF3T', 'Prueba gratuita terminada', '0', 'Prueba por gratis 30 días terminada');
INSERT INTO cat_planes(id, plan, precio, caracteristicas) values ('0403PBAS', 'Plan Básico', '300', 'Incluye...');
INSERT INTO cat_planes(id, plan, precio, caracteristicas) values ('0404PMED', 'Plan Intermedio', '600', 'Incluye...');
INSERT INTO cat_planes(id, plan, precio, caracteristicas) values ('0405PPRO', 'Plan Completo', '900', 'Incluye...');
INSERT INTO cat_planes(id, plan, precio, caracteristicas) values ('0406PLNA', 'NA', '0', 'Usuario');

CREATE TABLE citas (
  id BINARY(16) NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  motivo VARCHAR(50) NOT NULL,
  fecha_hora_inicio DATETIME NOT NULL,
  fecha_hora_fin DATETIME NULL,
  nota VARCHAR(200) NULL,
  id_estatus_cita VARCHAR(15) NOT NULL,
  id_estatus_pago VARCHAR(15) NOT NULL,
  id_tipo_pago VARCHAR(15) NULL,
  id_paciente BINARY(16) DEFAULT NULL, -- Cuando se crean eventos no es requerido
  id_usuario_medico BINARY(16) DEFAULT NULL,
  id_clinica BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE cat_sexo (
  id VARCHAR(1) NOT NULL,
  descripcion VARCHAR(9) NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO cat_sexo(id, descripcion) values ('M', 'Masculino');
INSERT INTO cat_sexo(id, descripcion) values ('F', 'Femenino');

CREATE TABLE pacientes (
  id BINARY(16) NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  apellidop VARCHAR(20) NOT NULL,  
  apellidom VARCHAR(20) DEFAULT NULL,
  edad VARCHAR(3) DEFAULT NULL,
  fecha_nac DATE DEFAULT NULL,
  id_sexo VARCHAR(4) DEFAULT NULL,
  telefono VARCHAR(10) DEFAULT NULL,
  correo VARCHAR(30) DEFAULT NULL,
  direccion VARCHAR(130) DEFAULT NULL,
  id_clinica BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);


CREATE TABLE pagos (
  id BINARY(16) NOT NULL,
  monto VARCHAR(10) NULL,
  fecha_pago DATETIME NOT NULL,
  id_usuario BINARY(16) NOT NULL,
  id_plan BINARY(16) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);


CREATE TABLE historias (
  id BINARY(16) NOT NULL,
  ultima_visita_dentista VARCHAR(30) DEFAULT NULL,
  problemas_dentales_pasados VARCHAR(50) DEFAULT NULL,
  tratamientos_previos_cuando VARCHAR(100) DEFAULT NULL,
  dolor_sensibilidad VARCHAR(100) DEFAULT NULL,
  -- Condición médica
  condicion_medica_actual VARCHAR(100) DEFAULT NULL,
  medicamentos_actuales VARCHAR(100) DEFAULT NULL,
  alergias_conocidas VARCHAR(100) DEFAULT NULL,
  cirugias_enfermedades_graves VARCHAR(100) DEFAULT NULL,
  -- Hábitos salud dental
  frecuencia_cepillado VARCHAR(100) DEFAULT NULL,
  uso_hilo_dental VARCHAR(100) DEFAULT NULL,
  uso_productos_especializados VARCHAR(100) DEFAULT NULL,
  tabaco_frecuencia VARCHAR(100) DEFAULT NULL,
  habito_alimenticio VARCHAR(100) DEFAULT NULL,
  --
  id_paciente BINARY(16) NOT NULL,
  id_clinica BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);


CREATE TABLE diagnosticos (
  id BINARY(16) NOT NULL,
  descripcion_problema VARCHAR(1500) DEFAULT NULL,
  codigo_diagnostico VARCHAR(25) DEFAULT NULL,
  evidencias TEXT DEFAULT NULL,
  id_paciente BINARY(16) NOT NULL,
  id_clinica BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE tratamientos (
  id BINARY(16) NOT NULL,
  tratamiento_propuesto VARCHAR(1500) DEFAULT NULL,
  medicamentos_prescritos VARCHAR(500) DEFAULT NULL,
  costo_estimado VARCHAR(10) DEFAULT NULL,
  id_paciente BINARY(16) NOT NULL,
  id_clinica BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE seguimientos (
  id BINARY(16) NOT NULL,
  proxima_cita DATETIME DEFAULT NULL,
  notas_seguimiento VARCHAR(1500) DEFAULT NULL,
  id_paciente BINARY(16) NOT NULL,
  id_clinica BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE imagenes (
  id BINARY(16) NOT NULL,
  url VARCHAR(500) NOT NULL,
  comentarios VARCHAR(500) DEFAULT NULL,
  id_paciente BINARY(16) DEFAULT NULL,
  id_diagnostico BINARY(16) DEFAULT NULL,
  id_clinica BINARY(16) NOT NULL,
  autoincremental INT AUTO_INCREMENT UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE accesos (
  id INT AUTO_INCREMENT UNIQUE,
  id_usuario BINARY(16) NOT NULL,
  ip_origen VARCHAR(20) NOT NULL,
  estado VARCHAR(20) DEFAULT NULL, -- Exitoso, Fallido
  fecha_evento DATETIME NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE auditoria (
  id INT AUTO_INCREMENT UNIQUE,
  id_registro BINARY(16) NOT NULL,
  id_usuario BINARY(16) NOT NULL,
  id_clinica BINARY(16) NOT NULL,
  tipo_evento VARCHAR(20) NOT NULL, -- CREATE, UPDATE, DELETE
  tabla_afectada VARCHAR(20) DEFAULT NULL, 
  fecha_evento DATETIME NOT NULL,
  PRIMARY KEY(id)
);


INSERT INTO clinicas(id, nombre, telefono, correo, direccion, id_plan)
values (
  UUID_TO_BIN('1dcf4c1b-449a-11ef-b367-00090ffe0001'), 
  'Dental App',
  '1234567890',
  'dental@app.com', 
  'CD.MX', 
  '0405PPRO'
);

INSERT INTO auditoria(id_registro, id_usuario, id_clinica, tipo_evento, tabla_afectada, fecha_evento) 
values (
  UUID_TO_BIN('1dcf4c1b-449a-11ef-b367-00090ffe0001'), 
  UUID_TO_BIN('ecd5e534-fabf-11ee-b435-00090ffe0001'), 
  UUID_TO_BIN('1dcf4c1b-449a-11ef-b367-00090ffe0001'), 
  'CREATE', 'clinicas', '2024-01-01 17:27:40');


INSERT INTO usuarios(id, correo, llave, id_rol, id_titulo, nombre, apellidop, apellidom, id_especialidad, telefono, llave_status, id_clinica) 
values ( 
  UUID_TO_BIN('ecd5e534-fabf-11ee-b435-00090ffe0001'), 
  'sop@sop.com',
  '$2b$10$yJxhkWSHPGCGYNJ.15iazuPXK2GRxhNf668Qq7ZnY3aBFtfM.1COO',
  UUID_TO_BIN('b29304d5-5d9b-11ee-8537-00090ffe0001'), 
  '0107NAA', 
  'Car', 
  'Atn', 
  'T', 
  '0210NAA', 
  '5538000000', 
  0, 
  UUID_TO_BIN('1dcf4c1b-449a-11ef-b367-00090ffe0001')
  );


INSERT INTO auditoria(id_registro, id_usuario, id_clinica, tipo_evento, tabla_afectada, fecha_evento) 
values (
  UUID_TO_BIN('ecd5e534-fabf-11ee-b435-00090ffe0001'), 
  UUID_TO_BIN('ecd5e534-fabf-11ee-b435-00090ffe0001'), 
  UUID_TO_BIN('1dcf4c1b-449a-11ef-b367-00090ffe0001'), 
  'CREATE', 'usuarios', '2024-01-01 17:27:40');




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

