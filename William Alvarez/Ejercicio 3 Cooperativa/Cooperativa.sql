
CREATE TABLE Afilacion
(
	id_afiliado          INTEGER NOT NULL,
	id_asesor            INTEGER NOT NULL,
	id_afiliacion        INTEGER NOT NULL,
	fecha                DATE NULL,
	numero               INTEGER NULL,
	valor                DECIMAL(12,2) NULL,
	id_oficio            INTEGER NOT NULL
);

ALTER TABLE Afilacion
ADD CONSTRAINT XPKAfilacion PRIMARY KEY (id_afiliacion);

CREATE TABLE Afilacion_Retiro
(
	id_afiliacion        INTEGER NOT NULL,
	id_retiro            INTEGER NOT NULL
);

ALTER TABLE Afilacion_Retiro
ADD CONSTRAINT XPKAfilacion_Retiro PRIMARY KEY (id_afiliacion,id_retiro);

CREATE TABLE Afiliado
(
	id_cooperativa       INTEGER NOT NULL,
	id_afiliado          INTEGER NOT NULL,
	nombre               VARCHAR(300) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(100) NULL,
	email                VARCHAR(300) NULL,
	id_oficio            INTEGER NOT NULL,
	salario              DECIMAL(12,2) NULL
);

ALTER TABLE Afiliado
ADD CONSTRAINT XPKAfiliado PRIMARY KEY (id_afiliado,id_oficio);

CREATE TABLE Afiliado_Aporte
(
	id_afiliado          INTEGER NOT NULL,
	id_oficio            INTEGER NOT NULL,
	id_aporte            INTEGER NOT NULL
);

ALTER TABLE Afiliado_Aporte
ADD CONSTRAINT XPKAfiliado_Aporte PRIMARY KEY (id_afiliado,id_oficio,id_aporte);

CREATE TABLE Afiliado_Novedad
(
	id_afiliado          INTEGER NOT NULL,
	id_oficio            INTEGER NOT NULL,
	id_novedad           INTEGER NOT NULL
);

ALTER TABLE Afiliado_Novedad
ADD CONSTRAINT XPKAfiliado_Novedad PRIMARY KEY (id_afiliado,id_oficio,id_novedad);

CREATE TABLE Aporte
(
	id_aporte            INTEGER NOT NULL,
	codigo               INTEGER NULL,
	nombre               VARCHAR(100) NULL,
	porcentaje           FLOAT NULL
);

ALTER TABLE Aporte
ADD CONSTRAINT XPKAporte PRIMARY KEY (id_aporte);

CREATE TABLE Asesor
(
	id_operador          INTEGER NOT NULL,
	id_asesor            INTEGER NOT NULL,
	nombre               VARCHAR(300) NULL,
	telefono             VARCHAR(100) NULL,
	email                VARCHAR(300) NULL
);

ALTER TABLE Asesor
ADD CONSTRAINT XPKAsesor PRIMARY KEY (id_asesor);

CREATE TABLE Cooperativa
(
	id_cooperativa       INTEGER NOT NULL,
	nit                  VARCHAR(20) NULL,
	nombre               VARCHAR(300) NULL
);

ALTER TABLE Cooperativa
ADD CONSTRAINT XPKCooperativa PRIMARY KEY (id_cooperativa);

CREATE TABLE Liquidacion
(
	id_liquidacion       INTEGER NOT NULL,
	fecha                DATE NULL,
	mes                  VARCHAR(2) NULL,
	anio                 VARCHAR(4) NULL,
	periodo              VARCHAR(6) NULL
);

ALTER TABLE Liquidacion
ADD CONSTRAINT XPKLiquidacion PRIMARY KEY (id_liquidacion);

CREATE TABLE Liquidacion_Aporte
(
	id_aporte            INTEGER NOT NULL,
	id_liquidacion       INTEGER NOT NULL
);

ALTER TABLE Liquidacion_Aporte
ADD CONSTRAINT XPKLiquidacion_Aporte PRIMARY KEY (id_aporte,id_liquidacion);

CREATE TABLE Liquidacion_Pago
(
	id_liquidacion       INTEGER NOT NULL,
	id_pago              INTEGER NOT NULL
);

ALTER TABLE Liquidacion_Pago
ADD CONSTRAINT XPKLiquidacion_Pago PRIMARY KEY (id_liquidacion,id_pago);

CREATE TABLE Novedad
(
	id_tipo              INTEGER NOT NULL,
	id_novedad           INTEGER NOT NULL,
	nombre               VARCHAR(100) NULL,
	descripcion          VARCHAR(500) NULL
);

ALTER TABLE Novedad
ADD CONSTRAINT XPKNovedad PRIMARY KEY (id_novedad);

CREATE TABLE Novedad_Tipo
(
	id_tipo              INTEGER NOT NULL,
	codigo               INTEGER NULL,
	descripcion          VARCHAR(500) NULL
);

ALTER TABLE Novedad_Tipo
ADD CONSTRAINT XPKNovedad_Tipo PRIMARY KEY (id_tipo);

CREATE TABLE Oficio
(
	id_oficio            INTEGER NOT NULL,
	nombre               VARCHAR(100) NULL,
	descripcion          VARCHAR(500) NULL
);

ALTER TABLE Oficio
ADD CONSTRAINT XPKOficio PRIMARY KEY (id_oficio);

CREATE TABLE Operador
(
	id_operador          INTEGER NOT NULL,
	nit                  VARCHAR(20) NULL,
	nombre               VARCHAR(300) NULL
);

ALTER TABLE Operador
ADD CONSTRAINT XPKOperador PRIMARY KEY (id_operador);

CREATE TABLE Pago
(
	id_pago              INTEGER NOT NULL,
	pin                  INTEGER NULL,
	fecha                DATE NULL,
	valor                DECIMAL(12,2) NULL
);

ALTER TABLE Pago
ADD CONSTRAINT XPKPago PRIMARY KEY (id_pago);

CREATE TABLE Razon_Social
(
	id_cooperativa       INTEGER NOT NULL,
	id_razon_social      INTEGER NOT NULL,
	nombre               VARCHAR(300) NULL,
	descripcion          VARCHAR(500) NULL
);

ALTER TABLE Razon_Social
ADD CONSTRAINT XPKRazon_Social PRIMARY KEY (id_razon_social);

CREATE TABLE Retiro
(
	id_retiro            INTEGER NOT NULL,
	codigo               INTEGER NULL,
	fecha                DATE NULL,
	motivo               TEXT NULL
);

ALTER TABLE Retiro
ADD CONSTRAINT XPKRetiro PRIMARY KEY (id_retiro);

ALTER TABLE Afilacion
ADD CONSTRAINT R_6 FOREIGN KEY (id_afiliado, id_oficio) REFERENCES Afiliado (id_afiliado, id_oficio);

ALTER TABLE Afilacion
ADD CONSTRAINT R_5 FOREIGN KEY (id_asesor) REFERENCES Asesor (id_asesor);

ALTER TABLE Afilacion_Retiro
ADD CONSTRAINT R_8 FOREIGN KEY (id_afiliacion) REFERENCES Afilacion (id_afiliacion);

ALTER TABLE Afilacion_Retiro
ADD CONSTRAINT R_9 FOREIGN KEY (id_retiro) REFERENCES Retiro (id_retiro);

ALTER TABLE Afiliado
ADD CONSTRAINT R_2 FOREIGN KEY (id_cooperativa) REFERENCES Cooperativa (id_cooperativa);

ALTER TABLE Afiliado
ADD CONSTRAINT R_10 FOREIGN KEY (id_oficio) REFERENCES Oficio (id_oficio);

ALTER TABLE Afiliado_Aporte
ADD CONSTRAINT R_21 FOREIGN KEY (id_afiliado, id_oficio) REFERENCES Afiliado (id_afiliado, id_oficio);

ALTER TABLE Afiliado_Aporte
ADD CONSTRAINT R_22 FOREIGN KEY (id_aporte) REFERENCES Aporte (id_aporte);

ALTER TABLE Afiliado_Novedad
ADD CONSTRAINT R_12 FOREIGN KEY (id_afiliado, id_oficio) REFERENCES Afiliado (id_afiliado, id_oficio);

ALTER TABLE Afiliado_Novedad
ADD CONSTRAINT R_13 FOREIGN KEY (id_novedad) REFERENCES Novedad (id_novedad);

ALTER TABLE Asesor
ADD CONSTRAINT R_4 FOREIGN KEY (id_operador) REFERENCES Operador (id_operador);

ALTER TABLE Liquidacion_Aporte
ADD CONSTRAINT R_16 FOREIGN KEY (id_aporte) REFERENCES Aporte (id_aporte);

ALTER TABLE Liquidacion_Aporte
ADD CONSTRAINT R_15 FOREIGN KEY (id_liquidacion) REFERENCES Liquidacion (id_liquidacion);

ALTER TABLE Liquidacion_Pago
ADD CONSTRAINT R_18 FOREIGN KEY (id_liquidacion) REFERENCES Liquidacion (id_liquidacion);

ALTER TABLE Liquidacion_Pago
ADD CONSTRAINT R_19 FOREIGN KEY (id_pago) REFERENCES Pago (id_pago);

ALTER TABLE Novedad
ADD CONSTRAINT R_1 FOREIGN KEY (id_tipo) REFERENCES Novedad_Tipo (id_tipo);

ALTER TABLE Razon_Social
ADD CONSTRAINT R_3 FOREIGN KEY (id_cooperativa) REFERENCES Cooperativa (id_cooperativa);
