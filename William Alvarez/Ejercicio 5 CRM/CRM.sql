
CREATE TABLE Agenda
(
	id_agenda            CHAR(18) NOT NULL,
	codigo               CHAR(18) NULL,
	fecha_visita         TIMESTAMP NULL
);

ALTER TABLE Agenda
ADD CONSTRAINT XPKAgenda PRIMARY KEY (id_agenda);

CREATE TABLE Agenda_Asesor
(
	id_agenda            CHAR(18) NOT NULL,
	id_asesor            INTEGER NOT NULL
);

ALTER TABLE Agenda_Asesor
ADD CONSTRAINT XPKAgenda_Asesor PRIMARY KEY (id_agenda,id_asesor);

CREATE TABLE Asesor
(
	id_asesor            INTEGER NOT NULL,
	nombre               VARCHAR(200) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(100) NULL,
	email                VARCHAR(300) NULL,
	codigo               INTEGER NULL
);

ALTER TABLE Asesor
ADD CONSTRAINT XPKAsesor PRIMARY KEY (id_asesor);

CREATE TABLE Oferta
(
	id_oferta            INTEGER NOT NULL,
	codigo               INTEGER NULL,
	nombre               VARCHAR(200) NULL,
	descripcion          TEXT NULL,
	valor                DECIMAL(12,2) NULL,
	id_tipo              INTEGER NOT NULL,
	id_asesor            INTEGER NOT NULL,
	id_venta             INTEGER NOT NULL
);

ALTER TABLE Oferta
ADD CONSTRAINT XPKOferta PRIMARY KEY (id_oferta);

CREATE TABLE Oferta_Tipo
(
	id_tipo              INTEGER NOT NULL,
	codigo               INTEGER NULL,
	nombre               VARCHAR(200) NULL,
	descripcion          TEXT NULL
);

ALTER TABLE Oferta_Tipo
ADD CONSTRAINT XPKOferta_Tipo PRIMARY KEY (id_tipo);

CREATE TABLE Propuesta
(
	id_propuesta         INTEGER NOT NULL,
	nombre               VARCHAR(200) NULL,
	descripcion          TEXT NULL,
	id_estado            INTEGER NOT NULL
);

ALTER TABLE Propuesta
ADD CONSTRAINT XPKPropuesta PRIMARY KEY (id_propuesta);

CREATE TABLE Propuesta_Estado
(
	id_estado            INTEGER NOT NULL,
	estado               VARCHAR(100) NULL,
	descripcion          TEXT NULL
);

ALTER TABLE Propuesta_Estado
ADD CONSTRAINT XPKPropuesta_Estado PRIMARY KEY (id_estado);

CREATE TABLE Propuesta_Prospecto
(
	id_prospecto         INTEGER NOT NULL,
	id_propuesta         INTEGER NOT NULL
);

ALTER TABLE Propuesta_Prospecto
ADD CONSTRAINT XPKPropuesta_Prospecto PRIMARY KEY (id_prospecto,id_propuesta);

CREATE TABLE Prospecto
(
	id_oferta            INTEGER NOT NULL,
	id_prospecto         INTEGER NOT NULL,
	nombre               VARCHAR(200) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(100) NULL,
	email                VARCHAR(300) NULL,
	latitud              VARCHAR(100) NULL,
	longitud             VARCHAR(100) NULL,
	id_sector            INTEGER NOT NULL
);

ALTER TABLE Prospecto
ADD CONSTRAINT XPKProspecto PRIMARY KEY (id_prospecto);

CREATE TABLE Sector
(
	id_sector            INTEGER NOT NULL,
	codigo               INTEGER NULL,
	nombre               VARCHAR(200) NULL
);

ALTER TABLE Sector
ADD CONSTRAINT XPKSector PRIMARY KEY (id_sector);

CREATE TABLE Venta
(
	id_venta             INTEGER NOT NULL,
	numero               INTEGER NULL,
	fecha                DATE NULL,
	valor                DECIMAL(12,2) NULL
);

ALTER TABLE Venta
ADD CONSTRAINT XPKVenta PRIMARY KEY (id_venta);

CREATE TABLE Venta_Detalle
(
	id_venta             INTEGER NOT NULL,
	id_detalle           INTEGER NOT NULL,
	valor_item           DECIMAL(12,2) NULL,
	cantidad             INTEGER NULL
);

ALTER TABLE Venta_Detalle
ADD CONSTRAINT XPKVenta_Detalle PRIMARY KEY (id_detalle);

ALTER TABLE Agenda_Asesor
ADD CONSTRAINT R_7 FOREIGN KEY (id_agenda) REFERENCES Agenda (id_agenda);

ALTER TABLE Agenda_Asesor
ADD CONSTRAINT R_8 FOREIGN KEY (id_asesor) REFERENCES Asesor (id_asesor);

ALTER TABLE Oferta
ADD CONSTRAINT R_2 FOREIGN KEY (id_tipo) REFERENCES Oferta_Tipo (id_tipo);

ALTER TABLE Oferta
ADD CONSTRAINT R_14 FOREIGN KEY (id_asesor) REFERENCES Asesor (id_asesor);

ALTER TABLE Oferta
ADD CONSTRAINT R_13 FOREIGN KEY (id_venta) REFERENCES Venta (id_venta);

ALTER TABLE Propuesta
ADD CONSTRAINT R_3 FOREIGN KEY (id_estado) REFERENCES Propuesta_Estado (id_estado);

ALTER TABLE Propuesta_Prospecto
ADD CONSTRAINT R_12 FOREIGN KEY (id_prospecto) REFERENCES Prospecto (id_prospecto);

ALTER TABLE Propuesta_Prospecto
ADD CONSTRAINT R_11 FOREIGN KEY (id_propuesta) REFERENCES Propuesta (id_propuesta);

ALTER TABLE Prospecto
ADD CONSTRAINT R_4 FOREIGN KEY (id_oferta) REFERENCES Oferta (id_oferta);

ALTER TABLE Prospecto
ADD CONSTRAINT R_9 FOREIGN KEY (id_sector) REFERENCES Sector (id_sector);

ALTER TABLE Venta_Detalle
ADD CONSTRAINT R_1 FOREIGN KEY (id_venta) REFERENCES Venta (id_venta);
