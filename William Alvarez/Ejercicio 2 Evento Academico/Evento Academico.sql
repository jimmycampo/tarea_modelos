
CREATE TABLE Actividad
(
	id_actividad         INTEGER NOT NULL,
	actividad            VARCHAR(100) NULL,
	tema                 VARCHAR(200) NULL,
	descripcion          VARCHAR(300) NULL,
	id_tipoA             INTEGER NOT NULL
);

ALTER TABLE Actividad
ADD CONSTRAINT XPKActividad PRIMARY KEY (id_actividad);

CREATE TABLE Actividad_Asistente
(
	id_actividad         INTEGER NOT NULL,
	id_asistente         INTEGER NOT NULL
);

ALTER TABLE Actividad_Asistente
ADD CONSTRAINT XPKActividad_Asistente PRIMARY KEY (id_actividad,id_asistente);

CREATE TABLE Actividad_Tipo
(
	id_tipoA             INTEGER NOT NULL,
	codigo               VARCHAR(20) NULL,
	descripcion          VARCHAR(300) NULL,
	cupo_maximo          INTEGER NULL
);

ALTER TABLE Actividad_Tipo
ADD CONSTRAINT XPKActividad_Tipo PRIMARY KEY (id_tipoA);

CREATE TABLE Asistente
(
	id_asistente         INTEGER NOT NULL,
	numero               INTEGER NULL,
	nombre               VARCHAR(300) NULL,
	telefono             VARCHAR(100) NULL,
	email                VARCHAR(300) NULL
);

ALTER TABLE Asistente
ADD CONSTRAINT XPKAsistente PRIMARY KEY (id_asistente);

CREATE TABLE Participante
(
	id_participante      INTEGER NOT NULL,
	numero               INTEGER NULL,
	nombre               VARCHAR(300) NULL,
	especialidad         VARCHAR(300) NULL
);

ALTER TABLE Participante
ADD CONSTRAINT XPKParticipante PRIMARY KEY (id_participante);

CREATE TABLE Participante_Actividad
(
	id_participante      INTEGER NOT NULL,
	id_actividad         INTEGER NOT NULL
);

ALTER TABLE Participante_Actividad
ADD CONSTRAINT XPKParticipante_Actividad PRIMARY KEY (id_participante,id_actividad);

ALTER TABLE Actividad
ADD CONSTRAINT R_7 FOREIGN KEY (id_tipoA) REFERENCES Actividad_Tipo (id_tipoA);

ALTER TABLE Actividad_Asistente
ADD CONSTRAINT R_5 FOREIGN KEY (id_actividad) REFERENCES Actividad (id_actividad);

ALTER TABLE Actividad_Asistente
ADD CONSTRAINT R_6 FOREIGN KEY (id_asistente) REFERENCES Asistente (id_asistente);

ALTER TABLE Participante_Actividad
ADD CONSTRAINT R_2 FOREIGN KEY (id_participante) REFERENCES Participante (id_participante);

ALTER TABLE Participante_Actividad
ADD CONSTRAINT R_3 FOREIGN KEY (id_actividad) REFERENCES Actividad (id_actividad);
