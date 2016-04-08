
CREATE TABLE Contrato
(
	id_ips               INTEGER NOT NULL,
	id_eps               INTEGER NOT NULL,
	id_contrato          INTEGER NOT NULL,
	fecha_contrato       DATE NULL
);

ALTER TABLE Contrato
ADD CONSTRAINT XPKContrato PRIMARY KEY (id_contrato);

CREATE TABLE EPS
(
	id_eps               INTEGER NOT NULL,
	nit                  VARCHAR(100) NULL,
	nombre               VARCHAR(300) NULL
);

ALTER TABLE EPS
ADD CONSTRAINT XPKEPS PRIMARY KEY (id_eps);

CREATE TABLE Especialista
(
	id_especialista      INTEGER NOT NULL,
	nombre               VARCHAR(300) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(100) NULL,
	email                VARCHAR(300) NULL,
	especialidad         VARCHAR(300) NULL
);

ALTER TABLE Especialista
ADD CONSTRAINT XPKEspecialista PRIMARY KEY (id_especialista);

CREATE TABLE Especialista_Procedimiento
(
	id_especialista      INTEGER NOT NULL,
	id_procedimiento     INTEGER NOT NULL
);

ALTER TABLE Especialista_Procedimiento
ADD CONSTRAINT XPKEspecialista_Procedimiento PRIMARY KEY (id_especialista,id_procedimiento);

CREATE TABLE Factura
(
	id_factura           INTEGER NOT NULL,
	numero               INTEGER NULL,
	fecha                DATE NULL,
	valor                DECIMAL(12,2) NULL
);

ALTER TABLE Factura
ADD CONSTRAINT XPKFactura PRIMARY KEY (id_factura);

CREATE TABLE Factura_Detalle
(
	id_factura           INTEGER NOT NULL,
	id_detalle           INTEGER NOT NULL,
	valor_item           DECIMAL(12,2) NULL,
	cantidad             INTEGER NULL
);

ALTER TABLE Factura_Detalle
ADD CONSTRAINT XPKFactura_Detalle PRIMARY KEY (id_detalle);

CREATE TABLE IPS
(
	id_ips               INTEGER NOT NULL,
	nit                  VARCHAR(100) NULL,
	nombre               VARCHAR(300) NULL
);

ALTER TABLE IPS
ADD CONSTRAINT XPKIPS PRIMARY KEY (id_ips);

CREATE TABLE IPS_Especialista
(
	id_ips               INTEGER NOT NULL,
	id_especialista      INTEGER NOT NULL
);

ALTER TABLE IPS_Especialista
ADD CONSTRAINT XPKIPS_Especialista PRIMARY KEY (id_ips,id_especialista);

CREATE TABLE Paciente
(
	id_paciente          INTEGER NOT NULL,
	nombre               VARCHAR(300) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(100) NULL,
	email                VARCHAR(300) NULL,
	id_contrato          INTEGER NOT NULL
);

ALTER TABLE Paciente
ADD CONSTRAINT XPKPaciente PRIMARY KEY (id_paciente);

CREATE TABLE Procedimiento
(
	id_tipo              INTEGER NOT NULL,
	id_procedimiento     INTEGER NOT NULL,
	nombre               VARCHAR(300) NULL,
	fecha                DATE NULL,
	valor                DECIMAL(12,2) NULL
);

ALTER TABLE Procedimiento
ADD CONSTRAINT XPKProcedimiento PRIMARY KEY (id_procedimiento);

CREATE TABLE Procedimiento_Factura_Detalle
(
	id_procedimiento     INTEGER NOT NULL,
	id_detalle           INTEGER NOT NULL
);

ALTER TABLE Procedimiento_Factura_Detalle
ADD CONSTRAINT XPKProcedimiento_Factura_Detalle PRIMARY KEY (id_procedimiento,id_detalle);

CREATE TABLE Procedimiento_Paciente
(
	id_procedimiento     INTEGER NOT NULL,
	id_paciente          INTEGER NOT NULL
);

ALTER TABLE Procedimiento_Paciente
ADD CONSTRAINT XPKProcedimiento_Paciente PRIMARY KEY (id_procedimiento,id_paciente);

CREATE TABLE Procedimiento_RIPS
(
	id_procedimiento     INTEGER NOT NULL,
	id_rips              INTEGER NOT NULL
);

ALTER TABLE Procedimiento_RIPS
ADD CONSTRAINT XPKProcedimiento_RIPS PRIMARY KEY (id_procedimiento,id_rips);

CREATE TABLE Procedimiento_Tipo
(
	id_tipo              INTEGER NOT NULL,
	codigo               INTEGER NULL,
	descripcion          VARCHAR(1000) NULL
);

ALTER TABLE Procedimiento_Tipo
ADD CONSTRAINT XPKProcedimiento_Tipo PRIMARY KEY (id_tipo);

CREATE TABLE RIPS
(
	id_rips              INTEGER NOT NULL,
	codigo               INTEGER NULL,
	descripcion          VARCHAR(1000) NULL
);

ALTER TABLE RIPS
ADD CONSTRAINT XPKRIPS PRIMARY KEY (id_rips);

ALTER TABLE Contrato
ADD CONSTRAINT R_9 FOREIGN KEY (id_ips) REFERENCES IPS (id_ips);

ALTER TABLE Contrato
ADD CONSTRAINT R_10 FOREIGN KEY (id_eps) REFERENCES EPS (id_eps);

ALTER TABLE Especialista_Procedimiento
ADD CONSTRAINT R_5 FOREIGN KEY (id_especialista) REFERENCES Especialista (id_especialista);

ALTER TABLE Especialista_Procedimiento
ADD CONSTRAINT R_6 FOREIGN KEY (id_procedimiento) REFERENCES Procedimiento (id_procedimiento);

ALTER TABLE Factura_Detalle
ADD CONSTRAINT R_14 FOREIGN KEY (id_factura) REFERENCES Factura (id_factura);

ALTER TABLE IPS_Especialista
ADD CONSTRAINT R_2 FOREIGN KEY (id_ips) REFERENCES IPS (id_ips);

ALTER TABLE IPS_Especialista
ADD CONSTRAINT R_3 FOREIGN KEY (id_especialista) REFERENCES Especialista (id_especialista);

ALTER TABLE Paciente
ADD CONSTRAINT R_18 FOREIGN KEY (id_contrato) REFERENCES Contrato (id_contrato);

ALTER TABLE Procedimiento
ADD CONSTRAINT R_7 FOREIGN KEY (id_tipo) REFERENCES Procedimiento_Tipo (id_tipo);

ALTER TABLE Procedimiento_Factura_Detalle
ADD CONSTRAINT R_16 FOREIGN KEY (id_procedimiento) REFERENCES Procedimiento (id_procedimiento);

ALTER TABLE Procedimiento_Factura_Detalle
ADD CONSTRAINT R_17 FOREIGN KEY (id_detalle) REFERENCES Factura_Detalle (id_detalle);

ALTER TABLE Procedimiento_Paciente
ADD CONSTRAINT R_12 FOREIGN KEY (id_procedimiento) REFERENCES Procedimiento (id_procedimiento);

ALTER TABLE Procedimiento_Paciente
ADD CONSTRAINT R_13 FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente);

ALTER TABLE Procedimiento_RIPS
ADD CONSTRAINT R_20 FOREIGN KEY (id_procedimiento) REFERENCES Procedimiento (id_procedimiento);

ALTER TABLE Procedimiento_RIPS
ADD CONSTRAINT R_21 FOREIGN KEY (id_rips) REFERENCES RIPS (id_rips);
