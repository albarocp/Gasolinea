DROP TABLE Embarcaderos;
DROP TABLE Trabajadores;	
DROP TABLE Clientes;
DROP TABLE ItemCompras;
DROP TABLE Productos;
DROP TABLE LineaCompras;
DROP TABLE Compras;


CREATE TABLE Clientes(
Id_C NUMBER NOT NULL,
Nombre VARCHAR2(50) NOT NULL,
Apellidos VARCHAR2(50) NOT NULL,
Dni CHAR(9) NOT NULL UNIQUE,
Telefono CHAR(9) NOT NULL UNIQUE,
Correo VARCHAR2(60) NOT NULL UNIQUE,
FechaNacimiento DATE NOT NULL,
ContraseÃ±a VARCHAR2(50) NOT NULL,
DireccionImagen VARCHAR2(60) NOT NULL UNIQUE,
PRIMARY KEY(Id_C),
Constraint ck_dni_cliente CHECK(REGEXP_LIKE(dni, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]')),
Constraint ck_telefono_cliente CHECK(REGEXP_LIKE(telefono, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')));

CREATE TABLE Trabajadores(
Id_T NUMBER NOT NULL,
Nombre VARCHAR2(50) NOT NULL,
Apellidos VARCHAR2(50) NOT NULL,
Dni CHAR(9) NOT NULL UNIQUE,
Telefono CHAR(9) NOT NULL UNIQUE,
Salario NUMBER(9,2) NOT NULL,
TipoEmpleado VARCHAR2(15) NOT NULL,
Contraseña VARCHAR2(50) NOT NULL,
DireccionImagen VARCHAR2(60) NOT NULL UNIQUE,
constraint enumerado1 check (TipoEmpleado IN ('JEFE','DEPENDIENTE')),
PRIMARY KEY(Id_T),
Constraint ck_dni_trabajador CHECK(REGEXP_LIKE(dni, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]')),
Constraint ck_telefono_trabajador CHECK(REGEXP_LIKE(telefono, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')));

CREATE TABLE Embarcaderos(
Id_E NUMBER NOT NULL,
Disponible CHAR(2) NOT NULL,
constraint LIBRE check (Disponible IN('SI','NO')),
PRIMARY KEY(Id_E));

CREATE TABLE ItemCompras(
Id_I NUMBER NOT NULL,
Stock NUMBER(9,2) NOT NULL,
Precio NUMBER(9,2) NOT NULL,
PRIMARY KEY(Id_I));

CREATE TABLE Productos(
Id_P NUMBER NOT NULL,
Nombre VARCHAR2(50) NOT NULL,
Codigo VARCHAR2(50) NOT NULL,
DireccionImagen VARCHAR2(50) NOT NULL,
Id_I NUMBER NOT NULL,
Id_A NUMBER NOT NULL,
Id_PRO NUMBER NOT NULL,
PRIMARY KEY(Id_P),
FOREIGN KEY(Id_I) REFERENCES ItemCompras(Id_I) ON DELETE CASCADE,
FOREIGN KEY(Id_A) REFERENCES Almacenes(Id_A) ON DELETE CASCADE,
FOREIGN KEY(Id_PRO) REFERENCES Proveedores(Id_PRO) ON DELETE CASCADE);

CREATE TABLE LineaCompras(
Id_L NUMBER NOT NULL,
Cantidad INT NOT NULL,
Id_I NUMBER NOT NULL,
PRIMARY KEY(Id_L),
FOREIGN KEY(Id_I) REFERENCES ItemCompras(Id_I) ON DELETE CASCADE);

CREATE TABLE Compras(
Id_COM NUMBER NOT NULL,
FechaPedido DATE NOT NULL,
FechaRecogida DATE NOT NULL,
Pagado CHAR(2) NOT NULL,
Id_C NUMBER NOT NULL,
Id_T NUMBER NOT NULL,
Id_L NUMBER NOT NULL,
CONSTRAINT horas check (FechaRecogida>FechaPedido),
constraint EstaPagado check (Pagado IN ('SI','NO')),
PRIMARY KEY(Id_COM),
FOREIGN KEY (Id_C) REFERENCES Clientes(Id_C) ON DELETE CASCADE,
FOREIGN KEY(Id_T) REFERENCES Trabajadores(Id_T) ON DELETE CASCADE,
FOREIGN KEY (Id_L) REFERENCES LineaCompras(Id_L) ON DELETE CASCADE);


