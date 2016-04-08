CREATE TABLE Alquiler
(
	id_alquiler          INTEGER NOT NULL,
	consecutivo          INTEGER NULL,
	fecha_ingreso        TIMESTAMP NULL,
	fecha_salida         TIMESTAMP NULL,
	ciudad_origen        VARCHAR(100) NULL,
	num_adultos          INTEGER NULL,
	num_menores          INTEGER NULL,
	id_cliente           INTEGER NOT NULL,
	id_habitacion        INTEGER NOT NULL
);

ALTER TABLE Alquiler
ADD CONSTRAINT XPKAlquiler PRIMARY KEY (id_alquiler);

CREATE TABLE Cliente
(
	id_cliente           INTEGER NOT NULL,
	nombre               VARCHAR(120) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(20) NULL,
	correo               VARCHAR(400) NULL,
	fecha_nacimiento     DATE NULL,
	identificacion       VARCHAR(40) NULL,
	id_tipoidentificacion INTEGER NOT NULL
);

ALTER TABLE Cliente
ADD CONSTRAINT XPKCliente PRIMARY KEY (id_cliente);

CREATE TABLE Empleado
(
	id_empleado          INTEGER NOT NULL,
	identificacion       VARCHAR(20) NULL,
	nombre               VARCHAR(120) NULL,
	direccion            VARCHAR(300) NULL,
	telefono             VARCHAR(20) NULL,
	fecha_nacimiento     DATE NULL,
	cargo                VARCHAR(100) NULL,
	fecha_ingreso        DATE NULL,
	correo               VARCHAR(400) NULL,
	id_tipoidentificacion INTEGER NOT NULL
);

ALTER TABLE Empleado
ADD CONSTRAINT XPKEmpleado PRIMARY KEY (id_empleado);

CREATE TABLE Factura
(
	id_factura           INTEGER NOT NULL,
	fecha                DATE NULL,
	consecutivo          INTEGER NULL,
	valor                FLOAT NULL,
	id_cliente           INTEGER NOT NULL
);

ALTER TABLE Factura
ADD CONSTRAINT XPKFactura PRIMARY KEY (id_factura);

CREATE TABLE Habitacion
(
	id_habitacion        INTEGER NOT NULL,
	descripcion          TEXT NULL,
	capacidad            INTEGER NULL,
	numero               VARCHAR(10) NULL,
	id_tipohabitacion    INTEGER NOT NULL
);

ALTER TABLE Habitacion
ADD CONSTRAINT XPKHabitacion PRIMARY KEY (id_habitacion);

CREATE TABLE Habitacion_tipo
(
	id_tipohabitacion    INTEGER NOT NULL,
	tarifa               FLOAT NULL,
	nombre               VARCHAR(80) NULL
);

ALTER TABLE Habitacion_tipo
ADD CONSTRAINT XPKHabitacion_tipo PRIMARY KEY (id_tipohabitacion);

CREATE TABLE Reserva
(
	id_reserva           INTEGER NOT NULL,
	consecutivo          INTEGER NULL,
	fecha_ingreso        DATE NULL,
	fecha_salida         DATE NULL,
	ciudad_origen        VARCHAR(100) NULL,
	num_adultos          INTEGER NULL,
	num_menores          INTEGER NULL,
	id_cliente           INTEGER NOT NULL,
	id_habitacion        INTEGER NOT NULL
);

ALTER TABLE Reserva
ADD CONSTRAINT XPKReserva PRIMARY KEY (id_reserva);

CREATE TABLE Servicio
(
	id_servicio          INTEGER NOT NULL,
	valor                FLOAT NULL,
	fecha_realizacion    TIMESTAMP NULL,
	id_tiposervicio      INTEGER NOT NULL,
	id_cliente           INTEGER NOT NULL,
	id_empleado          INTEGER NOT NULL
);

ALTER TABLE Servicio
ADD CONSTRAINT XPKServicio PRIMARY KEY (id_servicio);

CREATE TABLE Servicio_tipo
(
	id_tiposervicio      INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Servicio_tipo
ADD CONSTRAINT XPKServicio_tipo PRIMARY KEY (id_tiposervicio);

CREATE TABLE Tipo_Identificacion
(
	id_tipoidentificacion INTEGER NOT NULL,
	descripcion          VARCHAR(60) NULL
);

ALTER TABLE Tipo_Identificacion
ADD CONSTRAINT XPKTipo_Identificacion PRIMARY KEY (id_tipoidentificacion);

ALTER TABLE Alquiler
ADD CONSTRAINT R_50 FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente);

ALTER TABLE Alquiler
ADD CONSTRAINT R_52 FOREIGN KEY (id_habitacion) REFERENCES Habitacion (id_habitacion);

ALTER TABLE Cliente
ADD CONSTRAINT R_43 FOREIGN KEY (id_tipoidentificacion) REFERENCES Tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Empleado
ADD CONSTRAINT R_48 FOREIGN KEY (id_tipoidentificacion) REFERENCES Tipo_Identificacion (id_tipoidentificacion);

ALTER TABLE Factura
ADD CONSTRAINT R_47 FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente);

ALTER TABLE Habitacion
ADD CONSTRAINT R_30 FOREIGN KEY (id_tipohabitacion) REFERENCES Habitacion_tipo (id_tipohabitacion);

ALTER TABLE Reserva
ADD CONSTRAINT R_53 FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente);

ALTER TABLE Reserva
ADD CONSTRAINT R_54 FOREIGN KEY (id_habitacion) REFERENCES Habitacion (id_habitacion);

ALTER TABLE Servicio
ADD CONSTRAINT R_38 FOREIGN KEY (id_tiposervicio) REFERENCES Servicio_tipo (id_tiposervicio);

ALTER TABLE Servicio
ADD CONSTRAINT R_46 FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente);

ALTER TABLE Servicio
ADD CONSTRAINT R_49 FOREIGN KEY (id_empleado) REFERENCES Empleado (id_empleado);
