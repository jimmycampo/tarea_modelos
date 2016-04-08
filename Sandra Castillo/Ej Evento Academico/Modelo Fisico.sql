
CREATE TABLE Actividad
(
	id_actividad         INTEGER NOT NULL,
	hora                 TIME NULL,
	cupo                 INTEGER NULL,
	lugar                VARCHAR(200) NULL,
	fecha                DATE NULL,
	id_tipoactividad     INTEGER NOT NULL,
	id_temaactividad     INTEGER NOT NULL
);

ALTER TABLE Actividad
ADD CONSTRAINT XPKPoliza PRIMARY KEY (id_actividad);

CREATE TABLE Actividad_tema
(
	id_temaactividad     INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Actividad_tema
ADD CONSTRAINT XPKVehiculo_tipo PRIMARY KEY (id_temaactividad);

CREATE TABLE Actividad_tipo
(
	id_tipoactividad     INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Actividad_tipo
ADD CONSTRAINT XPKVehiculo_tipo PRIMARY KEY (id_tipoactividad);

CREATE TABLE Participacion
(
	id_persona           INTEGER NOT NULL,
	id_tipoparticipacion INTEGER NOT NULL,
	id_actividad         INTEGER NOT NULL
);

ALTER TABLE Participacion
ADD CONSTRAINT XPKVehiculo_tipo PRIMARY KEY (id_persona,id_actividad);

CREATE TABLE Participacion_tipo
(
	id_tipoparticipacion INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Participacion_tipo
ADD CONSTRAINT XPKVehiculo_tipo PRIMARY KEY (id_tipoparticipacion);

CREATE TABLE Persona
(
	id_persona           INTEGER NOT NULL,
	identificacion       VARCHAR(40) NULL,
	nombre               VARCHAR(120) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(20) NULL,
	correo               VARCHAR(400) NULL,
	id_tipoidentificacion INTEGER NOT NULL,
	profesion            VARCHAR(30) NULL,
	cargo                VARCHAR(30) NULL,
	area_trabajo         VARCHAR(80) NULL,
	empresa              VARCHAR(80) NULL,
	id_ciudad            INTEGER NOT NULL
);

ALTER TABLE Persona
ADD CONSTRAINT XPKCliente PRIMARY KEY (id_persona);

CREATE TABLE Persona_Ciudad
(
	id_ciudad            INTEGER NOT NULL,
	nombre               VARCHAR(100) NULL
);

ALTER TABLE Persona_Ciudad
ADD CONSTRAINT XPKVehiculo_color PRIMARY KEY (id_ciudad);

CREATE TABLE Tipo_Identificacion
(
	id_tipoidentificacion INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Tipo_Identificacion
ADD CONSTRAINT XPKTipo_Identificacion PRIMARY KEY (id_tipoidentificacion);

ALTER TABLE Actividad
ADD CONSTRAINT R_14 FOREIGN KEY (id_tipoactividad) REFERENCES Actividad_tipo (id_tipoactividad);

ALTER TABLE Actividad
ADD CONSTRAINT R_16 FOREIGN KEY (id_temaactividad) REFERENCES Actividad_tema (id_temaactividad);

ALTER TABLE Participacion
ADD CONSTRAINT R_10 FOREIGN KEY (id_persona) REFERENCES Persona (id_persona);

ALTER TABLE Participacion
ADD CONSTRAINT R_11 FOREIGN KEY (id_tipoparticipacion) REFERENCES Participacion_tipo (id_tipoparticipacion);

ALTER TABLE Participacion
ADD CONSTRAINT R_12 FOREIGN KEY (id_actividad) REFERENCES Actividad (id_actividad);

ALTER TABLE Persona
ADD CONSTRAINT R_2 FOREIGN KEY (id_tipoidentificacion) REFERENCES Tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Persona
ADD CONSTRAINT R_9 FOREIGN KEY (id_ciudad) REFERENCES Persona_Ciudad (id_ciudad);
