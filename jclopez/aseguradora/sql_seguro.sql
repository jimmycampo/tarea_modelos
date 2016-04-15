
CREATE TABLE Cliente
(
	id_cliente           INTEGER NOT NULL,
	Identifiacion        VARCHAR(40) NULL,
	nombres              VARCHAR(120) NULL,
	direccion            VARCHAR(300) NULL,
	correo               VARCHAR(300) NULL,
	telefono             VARCHAR(20) NULL,
	id_tipoidentificacion INTEGER NOT NULL
);

ALTER TABLE Cliente
ADD CONSTRAINT XPKCliente PRIMARY KEY (id_cliente);

CREATE TABLE Poliza
(
	Id_poliza            INTEGER NOT NULL,
	numero               INTEGER NULL,
	fecha_adquisicion    TIMESTAMP NULL,
	fecha_inicio         DATE NULL,
	fecha_fin            DATE NULL,
	deducible            FLOAT NULL,
	valor_asegurado      FLOAT NULL,
	id_cliente           INTEGER NOT NULL,
	id_vehiculo          INTEGER NOT NULL
);

ALTER TABLE Poliza
ADD CONSTRAINT XPKPoliza PRIMARY KEY (Id_poliza);

CREATE TABLE Siniestro
(
	id_siniestro         INTEGER NOT NULL,
	fecha_hora           TIMESTAMP NULL,
	descripcion          TEXT NULL,
	lugar                VARCHAR(200) NULL,
	consecutivo          INTEGER NULL,
	direccion            VARCHAR(200) NULL,
	latitud              FLOAT NULL,
	longitud             FLOAT NULL,
	Id_poliza            INTEGER NOT NULL
);

ALTER TABLE Siniestro
ADD CONSTRAINT XPKSiniestro PRIMARY KEY (id_siniestro);

CREATE TABLE tipo_Identificacion
(
	id_tipoidentificacion INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE tipo_Identificacion
ADD CONSTRAINT XPKtipo_Identificacion PRIMARY KEY (id_tipoidentificacion);

CREATE TABLE Vehiculo
(
	id_vehiculo          INTEGER NOT NULL,
	placa                VARCHAR(20) NULL,
	modelo               INTEGER NULL,
	cilindrada           INTEGER NULL,
	id_color             INTEGER NOT NULL,
	id_tipovehiculo      INTEGER NOT NULL
);

ALTER TABLE Vehiculo
ADD CONSTRAINT XPKVehiculo PRIMARY KEY (id_vehiculo);

CREATE TABLE Vehiculo_Color
(
	id_color             INTEGER NOT NULL,
	descripcion          VARCHAR(100) NULL
);

ALTER TABLE Vehiculo_Color
ADD CONSTRAINT XPKVehiculo_Color PRIMARY KEY (id_color);

CREATE TABLE Vehiculo_Tipo
(
	id_tipovehiculo      INTEGER NOT NULL,
	descripcion          VARCHAR(200) NULL
);

ALTER TABLE Vehiculo_Tipo
ADD CONSTRAINT XPKVehiculo_Tipo PRIMARY KEY (id_tipovehiculo);

ALTER TABLE Cliente
ADD CONSTRAINT R_1 FOREIGN KEY (id_tipoidentificacion) REFERENCES tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Poliza
ADD CONSTRAINT R_2 FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente);

ALTER TABLE Poliza
ADD CONSTRAINT R_5 FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo (id_vehiculo);

ALTER TABLE Siniestro
ADD CONSTRAINT R_6 FOREIGN KEY (Id_poliza) REFERENCES Poliza (Id_poliza);

ALTER TABLE Vehiculo
ADD CONSTRAINT R_3 FOREIGN KEY (id_color) REFERENCES Vehiculo_Color (id_color);

ALTER TABLE Vehiculo
ADD CONSTRAINT R_7 FOREIGN KEY (id_tipovehiculo) REFERENCES Vehiculo_Tipo (id_tipovehiculo);
