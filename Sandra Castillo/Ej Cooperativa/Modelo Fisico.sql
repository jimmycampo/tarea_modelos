CREATE TABLE Afiliado
(
	id_afiliado          INTEGER NOT NULL,
	identificacion       VARCHAR(40) NULL,
	nombre               VARCHAR(120) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(20) NULL,
	correo               VARCHAR(400) NULL,
	fecha_nacimiento     DATE NULL,
	oficio               VARCHAR(50) NULL,
	salario              FLOAT NULL,
	sexo                 VARCHAR(1) NULL,
	fecha_afiliacion     DATE NULL,
	fecha_retiro         DATE NULL,
	id_asesor            INTEGER NOT NULL,
	id_tipoidentificacion INTEGER NOT NULL
);

ALTER TABLE Afiliado
ADD CONSTRAINT XPKAfiliado PRIMARY KEY (id_afiliado);

CREATE TABLE Aporte
(
	id_aporte            INTEGER NOT NULL,
	fecha_hora           TIMESTAMP NULL,
	consecutivo          INTEGER NULL,
	valor                FLOAT NULL,
	id_afiliado          INTEGER NOT NULL,
	id_novedad           INTEGER NOT NULL,
	id_tipoaporte        INTEGER NOT NULL,
	id_operadorPILA      INTEGER NOT NULL
);

ALTER TABLE Aporte
ADD CONSTRAINT XPKAporte PRIMARY KEY (id_aporte);

CREATE TABLE Aporte_tipo
(
	id_tipoaporte        INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL,
	porcentaje           FLOAT NULL
);

ALTER TABLE Aporte_tipo
ADD CONSTRAINT XPKAporte_tipo PRIMARY KEY (id_tipoaporte);

CREATE TABLE Asesor
(
	id_asesor            INTEGER NOT NULL,
	identificacion       VARCHAR(40) NULL,
	nombre               VARCHAR(120) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(20) NULL,
	correo               VARCHAR(400) NULL,
	id_tipoidentificacion INTEGER NOT NULL
);

ALTER TABLE Asesor
ADD CONSTRAINT XPKAsesor PRIMARY KEY (id_asesor);

CREATE TABLE Novedad
(
	id_novedad           INTEGER NOT NULL,
	fecha_hora           TIMESTAMP NULL,
	consecutivo          INTEGER NULL,
	id_tiponovedad       INTEGER NOT NULL,
	id_afiliado          INTEGER NOT NULL
);

ALTER TABLE Novedad
ADD CONSTRAINT XPKNovedad PRIMARY KEY (id_novedad);

CREATE TABLE Novedad_tipo
(
	id_tiponovedad       INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Novedad_tipo
ADD CONSTRAINT XPKNovedad_tipo PRIMARY KEY (id_tiponovedad);

CREATE TABLE Operador_PILA
(
	id_operadorPILA      INTEGER NOT NULL,
	identificacion       VARCHAR(40) NULL,
	nombre               VARCHAR(120) NULL,
	correo               VARCHAR(400) NULL,
	pagina_web           CHAR(300) NULL,
	id_tipoidentificacion INTEGER NOT NULL
);

ALTER TABLE Operador_PILA
ADD CONSTRAINT XPKOperador_PILA PRIMARY KEY (id_operadorPILA);

CREATE TABLE Pago_mensual
(
	id_pago              INTEGER NOT NULL,
	fecha_hora           TIMESTAMP NULL,
	concepto             VARCHAR(200) NULL,
	consecutivo          INTEGER NULL,
	valor                FLOAT NULL,
	id_afiliado          INTEGER NOT NULL
);

ALTER TABLE Pago_mensual
ADD CONSTRAINT XPKPago_mensual PRIMARY KEY (id_pago);

CREATE TABLE Tipo_Identificacion
(
	id_tipoidentificacion INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Tipo_Identificacion
ADD CONSTRAINT XPKTipo_Identificacion PRIMARY KEY (id_tipoidentificacion);

ALTER TABLE Afiliado
ADD CONSTRAINT R_14 FOREIGN KEY (id_asesor) REFERENCES Asesor (id_asesor);

ALTER TABLE Afiliado
ADD CONSTRAINT R_16 FOREIGN KEY (id_tipoidentificacion) REFERENCES Tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Aporte
ADD CONSTRAINT R_20 FOREIGN KEY (id_afiliado) REFERENCES Afiliado (id_afiliado);

ALTER TABLE Aporte
ADD CONSTRAINT R_21 FOREIGN KEY (id_novedad) REFERENCES Novedad (id_novedad);

ALTER TABLE Aporte
ADD CONSTRAINT R_27 FOREIGN KEY (id_tipoaporte) REFERENCES Aporte_tipo (id_tipoaporte);

ALTER TABLE Aporte
ADD CONSTRAINT R_30 FOREIGN KEY (id_operadorPILA) REFERENCES Operador_PILA (id_operadorPILA);

ALTER TABLE Asesor
ADD CONSTRAINT R_15 FOREIGN KEY (id_tipoidentificacion) REFERENCES Tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Novedad
ADD CONSTRAINT R_18 FOREIGN KEY (id_tiponovedad) REFERENCES Novedad_tipo (id_tiponovedad);

ALTER TABLE Novedad
ADD CONSTRAINT R_19 FOREIGN KEY (id_afiliado) REFERENCES Afiliado (id_afiliado);

ALTER TABLE Operador_PILA
ADD CONSTRAINT R_28 FOREIGN KEY (id_tipoidentificacion) REFERENCES Tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Pago_mensual
ADD CONSTRAINT R_17 FOREIGN KEY (id_afiliado) REFERENCES Afiliado (id_afiliado);