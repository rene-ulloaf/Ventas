CREATE TABLE productos (
  idProducto INTEGER NOT NULL AUTO_INCREMENT,
  idTipoProducto INTEGER NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  vigente BOOL NOT NULL DEFAULT true,
  fechaCreacion DATETIME NOT NULL,
  idUsuario INTEGER NOT NULL,
  FOREIGN KEY()
    REFERENCES tipoProducto()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE compras (
  idCompra INTEGER NOT NULL AUTO_INCREMENT,
  idProducto INTEGER NOT NULL,
  observacion VARCHAR(255) NULL,
  cantProductos INTEGER NOT NULL,
  precioCompra NUMERIC NOT NULL,
  idTipoMoneda SMALLINT NOT NULL,
  idParidad NUMERIC NOT NULL,
  fechaCompra DATE NOT NULL,
  fechaLlegada DATE NULL,
  fechaPago DATE NULL,
  idOrigenCompra SMALLINT NOT NULL,
  fechaIngreso DATE NOT NULL,
  idUsuario INTEGER NOT NULL,
  FOREIGN KEY()
    REFERENCES productos()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY()
    REFERENCES origenCompra()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY()
    REFERENCES tipoMoneda()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY()
    REFERENCES Paridad()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE ventas (
  idVenta INTEGER NOT NULL AUTO_INCREMENT,
  idCompra INTEGER NOT NULL,
  cantidad SMALLINT NOT NULL,
  precio NUMERIC NOT NULL,
  idPersona INTEGER NOT NULL,
  fechaVenta DATE NOT NULL,
  idUsuario INTEGER NOT NULL,
  FOREIGN KEY()
    REFERENCES gastos()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY()
    REFERENCES compras()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE gastos (
  idGasto INTEGER NOT NULL AUTO_INCREMENT,
  idTipoGasto SMALLINT NOT NULL,
  precio NUMERIC NOT NULL,
  observacion VARCHAR(255) NOT NULL,
  fecha DATE NOT NULL,
  idUsuario INTEGER NOT NULL
);

CREATE TABLE tipoProducto (
  idTipoProducto SMALLINT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR NOT NULL,
  vigente BOOL NOT NULL
);

CREATE TABLE tipoMoneda (
  idTipoMoneda SMALLINT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR NOT NULL,
  vigente BOOL NOT NULL
);

CREATE TABLE origenCompra (
  idOrigen SMALLINT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR NOT NULL,
  vigente BOOL NOT NULL
);

CREATE TABLE Paridad (
  idParidad INTEGER NOT NULL AUTO_INCREMENT,
  idTipoMoneda SMALLINT NOT NULL,
  monto DECIMAL NOT NULL,
  fecha DATE NOT NULL,
  fechaIngreso DATE NOT NULL,
  FOREIGN KEY()
    REFERENCES tipoMoneda()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

