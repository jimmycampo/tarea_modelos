
CREATE TABLE Clientes
(
	id_cliente           INTEGER NOT NULL,
	documento            INTEGER NULL,
	nombres              VARCHAR(100) NULL,
	direccion            VARCHAR(150) NULL,
	movil                VARCHAR(100) NULL,
	email                VARCHAR(100) NULL
);

ALTER TABLE Clientes
ADD CONSTRAINT XPKClientes PRIMARY KEY (id_cliente);

CREATE TABLE Empleados
(
	id_empleado          INTEGER NOT NULL,
	documento            INTEGER NULL,
	nombre               VARCHAR(200) NULL,
	direccion            VARCHAR(150) NULL,
	movil                VARCHAR(60) NULL,
	email                VARCHAR(100) NULL
);

ALTER TABLE Empleados
ADD CONSTRAINT XPKEmpleados PRIMARY KEY (id_empleado);

CREATE TABLE factura
(
	id_factura           INTEGER NOT NULL,
	factura_numero       INTEGER NULL,
	id_cliente           INTEGER NOT NULL,
	id_servicio          INTEGER NOT NULL,
	id_habitacion        INTEGER NOT NULL
);

ALTER TABLE factura
ADD CONSTRAINT XPKfactura PRIMARY KEY (id_factura);

CREATE TABLE Habitaciones
(
	id_habitacion        INTEGER NOT NULL,
	descripcion          VARCHAR(200) NULL,
	id_tipo              INTEGER NOT NULL,
	id_cliente           INTEGER NOT NULL
);

ALTER TABLE Habitaciones
ADD CONSTRAINT XPKHabitaciones PRIMARY KEY (id_habitacion);

CREATE TABLE Servicios
(
	id_servicio          INTEGER NOT NULL,
	descripcion          VARCHAR(200) NULL,
	costo                INTEGER NULL,
	id_cliente           INTEGER NOT NULL,
	id_empleado          INTEGER NOT NULL
);

ALTER TABLE Servicios
ADD CONSTRAINT XPKServicios PRIMARY KEY (id_servicio);

CREATE TABLE Tipo_Habitacion
(
	id_tipo              INTEGER NOT NULL,
	descripcion          VARCHAR(200) NULL
);

ALTER TABLE Tipo_Habitacion
ADD CONSTRAINT XPKTipo_Habitacion PRIMARY KEY (id_tipo);

ALTER TABLE factura
ADD CONSTRAINT R_6 FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente);

ALTER TABLE factura
ADD CONSTRAINT R_7 FOREIGN KEY (id_servicio) REFERENCES Servicios (id_servicio);

ALTER TABLE factura
ADD CONSTRAINT R_8 FOREIGN KEY (id_habitacion) REFERENCES Habitaciones (id_habitacion);

ALTER TABLE Habitaciones
ADD CONSTRAINT R_1 FOREIGN KEY (id_tipo) REFERENCES Tipo_Habitacion (id_tipo);

ALTER TABLE Habitaciones
ADD CONSTRAINT R_2 FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente);

ALTER TABLE Servicios
ADD CONSTRAINT R_3 FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente);

ALTER TABLE Servicios
ADD CONSTRAINT R_4 FOREIGN KEY (id_empleado) REFERENCES Empleados (id_empleado);
