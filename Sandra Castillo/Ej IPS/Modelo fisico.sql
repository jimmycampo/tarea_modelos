
CREATE TABLE Contrato
(
	id_contrato          INTEGER NOT NULL,
	fecha                DATE NULL,
	consecutivo          INTEGER NULL,
	vigencia             FLOAT NULL,
	id_EPS               INTEGER NOT NULL
);

ALTER TABLE Contrato
ADD CONSTRAINT XPKContrato PRIMARY KEY (id_contrato);

CREATE TABLE EPS
(
	id_EPS               INTEGER NOT NULL,
	Nombre               VARCHAR(60) NULL,
	identificacion       VARCHAR(40) NULL
);

ALTER TABLE EPS
ADD CONSTRAINT XPKEPS PRIMARY KEY (id_EPS);

CREATE TABLE Especialidad_tipo
(
	id_tipoespecialidad  INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Especialidad_tipo
ADD CONSTRAINT XPKEspecialidad_tipo PRIMARY KEY (id_tipoespecialidad);

CREATE TABLE Especialista
(
	id_especialista      INTEGER NOT NULL,
	identificacion       VARCHAR(40) NULL,
	nombre               VARCHAR(120) NULL,
	registro_profesional VARCHAR(30) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(20) NULL,
	correo               VARCHAR(400) NULL,
	id_tipoidentificacion INTEGER NOT NULL,
	id_profesion         INTEGER NOT NULL,
	id_tipoespecialidad  INTEGER NOT NULL
);

ALTER TABLE Especialista
ADD CONSTRAINT XPKEspecialista PRIMARY KEY (id_especialista);

CREATE TABLE Factura
(
	id_factura           INTEGER NOT NULL,
	fecha                DATE NULL,
	consecutivo          INTEGER NULL,
	valor                FLOAT NULL,
	id_procedimiento     INTEGER NOT NULL
);

ALTER TABLE Factura
ADD CONSTRAINT XPKFactura PRIMARY KEY (id_factura);

CREATE TABLE Paciente
(
	id_paciente          INTEGER NOT NULL,
	identificacion       VARCHAR(40) NULL,
	nombre               VARCHAR(120) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(20) NULL,
	correo               VARCHAR(400) NULL,
	fecha_nacimiento     DATE NULL,
	sexo                 VARCHAR(2) NULL,
	id_tipoidentificacion INTEGER NOT NULL,
	id_categoriapaciente INTEGER NOT NULL,
	id_EPS               INTEGER NOT NULL
);

ALTER TABLE Paciente
ADD CONSTRAINT XPKPaciente PRIMARY KEY (id_paciente);

CREATE TABLE Paciente_categoria
(
	id_categoriapaciente INTEGER NOT NULL,
	descripcion          VARCHAR(20) NULL
);

ALTER TABLE Paciente_categoria
ADD CONSTRAINT XPKPaciente_categoria PRIMARY KEY (id_categoriapaciente);

CREATE TABLE Procedimiento
(
	id_procedimiento     INTEGER NOT NULL,
	fecha_hora           TIMESTAMP NULL,
	lugar                VARCHAR(200) NULL,
	consecutivo          INTEGER NULL,
	diagnostico          TEXT NULL,
	id_tipoprocedimiento INTEGER NOT NULL,
	id_contrato          INTEGER NOT NULL,
	id_paciente          INTEGER NOT NULL,
	id_especialista      INTEGER NOT NULL
);

ALTER TABLE Procedimiento
ADD CONSTRAINT XPKProcedimiento PRIMARY KEY (id_procedimiento);

CREATE TABLE Procedimiento_tipo
(
	id_tipoprocedimiento INTEGER NOT NULL,
	descripcion          VARCHAR(200) NULL
);

ALTER TABLE Procedimiento_tipo
ADD CONSTRAINT XPKProcedimiento_tipo PRIMARY KEY (id_tipoprocedimiento);

CREATE TABLE Profesion
(
	id_profesion         INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Profesion
ADD CONSTRAINT XPKProfesion PRIMARY KEY (id_profesion);

CREATE TABLE Tipo_Identificacion
(
	id_tipoidentificacion INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Tipo_Identificacion
ADD CONSTRAINT XPKTipo_Identificacion PRIMARY KEY (id_tipoidentificacion);

ALTER TABLE Contrato
ADD CONSTRAINT R_39 FOREIGN KEY (id_EPS) REFERENCES EPS (id_EPS);

ALTER TABLE Especialista
ADD CONSTRAINT R_46 FOREIGN KEY (id_tipoidentificacion) REFERENCES Tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Especialista
ADD CONSTRAINT R_47 FOREIGN KEY (id_profesion) REFERENCES Profesion (id_profesion);

ALTER TABLE Especialista
ADD CONSTRAINT R_48 FOREIGN KEY (id_tipoespecialidad) REFERENCES Especialidad_tipo (id_tipoespecialidad);

ALTER TABLE Factura
ADD CONSTRAINT R_41 FOREIGN KEY (id_procedimiento) REFERENCES Procedimiento (id_procedimiento);

ALTER TABLE Paciente
ADD CONSTRAINT R_42 FOREIGN KEY (id_tipoidentificacion) REFERENCES Tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Paciente
ADD CONSTRAINT R_43 FOREIGN KEY (id_categoriapaciente) REFERENCES Paciente_categoria (id_categoriapaciente);

ALTER TABLE Paciente
ADD CONSTRAINT R_44 FOREIGN KEY (id_EPS) REFERENCES EPS (id_EPS);

ALTER TABLE Procedimiento
ADD CONSTRAINT R_33 FOREIGN KEY (id_tipoprocedimiento) REFERENCES Procedimiento_tipo (id_tipoprocedimiento);

ALTER TABLE Procedimiento
ADD CONSTRAINT R_40 FOREIGN KEY (id_contrato) REFERENCES Contrato (id_contrato);

ALTER TABLE Procedimiento
ADD CONSTRAINT R_45 FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente);

ALTER TABLE Procedimiento
ADD CONSTRAINT R_49 FOREIGN KEY (id_especialista) REFERENCES Especialista (id_especialista);
