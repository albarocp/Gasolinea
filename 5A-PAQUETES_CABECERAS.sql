-- PAQUETES - CABECERAS --

--Trabajadores
CREATE OR REPLACE PACKAGE pruebas_trabajadores AS
  
  PROCEDURE inicializar;
  
  PROCEDURE insertar
  (nombre_prueba       VARCHAR2,
   w_nombre            IN trabajadores.nombre%TYPE,
   w_apellidos         IN trabajadores.apellidos%TYPE,
   w_dni               IN trabajadores.dni%TYPE,
   w_telefono          IN trabajadores.telefono%TYPE,
   w_salario           IN trabajadores.salario%TYPE,
   w_tipoEmpleado      IN trabajadores.tipoEmpleado%TYPE,
   w_contraseña        IN trabajadores.contraseña%TYPE,
   w_direccionImagen   IN trabajadores.direccionImagen%TYPE,
   salidaEsperada      BOOLEAN);

   PROCEDURE actualizar
   (nombre_prueba       VARCHAR2,
   w_id_T               IN trabajadores.id_T%TYPE,
   w_nombre             IN trabajadores.nombre%TYPE,
   w_apellidos          IN trabajadores.apellidos%TYPE,
   w_dni                IN trabajadores.dni%TYPE,
   w_telefono           IN trabajadores.telefono%TYPE,
   w_salario            IN trabajadores.salario%TYPE,
   w_tipoEmpleado       IN trabajadores.tipoEmpleado%TYPE,
   w_contraseña         IN trabajadores.contraseña%TYPE,
   w_direccionImagen    IN trabajadores.direccionImagen%TYPE,
   salidaEsperada       BOOLEAN);

   PROCEDURE eliminar
   (nombre_prueba   VARCHAR2,
    w_id_T          IN trabajadores.id_T%TYPE,
   salidaEsperada   BOOLEAN);
 END pruebas_trabajadores;
/

--Proveedores
CREATE OR REPLACE 
PACKAGE pruebas_proveedores AS
  PROCEDURE inicializar;
  PROCEDURE insertar
    (nombre_prueba VARCHAR2,
    w_nombre in proveedores.nombre%TYPE,
    w_apellidos in proveedores.apellidos%TYPE,
    w_dni in proveedores.dni%TYPE,
    w_telefono in proveedores.telefono%TYPE,
    w_correo in proveedores.correo%TYPE,
    salidaEsperada BOOLEAN);
  PROCEDURE actualizar
    (nombre_prueba VARCHAR2,
    w_id_pro in proveedores.id_pro%TYPE,
    w_nombre in proveedores.nombre%TYPE,
    w_apellidos in proveedores.apellidos%TYPE,
    w_dni in proveedores.dni%TYPE,
    w_telefono in proveedores.telefono%TYPE,
    w_correo in proveedores.correo%TYPE,
    salidaEsperada BOOLEAN);
  PROCEDURE eliminar
  (nombre_prueba VARCHAR2,
  w_id_pro in proveedores.id_pro%TYPE,
  salidaEsperada BOOLEAN);
END;
/

--LineaCompras
CREATE OR REPLACE PACKAGE Pruebas_LineaCompras IS

  PROCEDURE inicializar;
  
  PROCEDURE insertar(nombre_prueba VARCHAR2, w_cantidad IN lineaCompras.cantidad%TYPE, w_Id_I IN lineaCompras.Id_I%TYPE, salida_esperada BOOLEAN);
  
  PROCEDURE actualizar(nombre_prueba VARCHAR2, w_Id_L IN lineaCompras.Id_L%TYPE, w_cantidad IN lineaCompras.cantidad%TYPE, w_Id_I IN lineaCompras.Id_I%TYPE, salida_esperada BOOLEAN);
  
  PROCEDURE eliminar(nombre_prueba VARCHAR2, w_Id_L IN lineaCompras.Id_L%TYPE, salida_esperada BOOLEAN);
  
END Pruebas_LineaCompras;   
/ 

--Compras
CREATE OR REPLACE PACKAGE Pruebas_Compras IS

  PROCEDURE inicializar;
  
  PROCEDURE insertar(nombre_prueba VARCHAR2, w_fechaPedido IN COMPRAS.FECHAPEDIDO%TYPE, w_fechaRecogida IN compras.fechaRecogida%TYPE, w_Pagado IN compras.pagado%TYPE,
  w_Id_C IN compras.Id_C%TYPE, w_Id_T IN compras.Id_T%TYPE, w_Id_L IN compras.Id_L%TYPE, salida_esperada BOOLEAN);
  
  PROCEDURE actualizar(nombre_prueba VARCHAR2, w_Id_COM IN Compras.Id_COM%TYPE, w_fechaPedido IN COMPRAS.FECHAPEDIDO%TYPE, w_fechaRecogida IN compras.fechaRecogida%TYPE,
   w_Pagado IN compras.pagado%TYPE, w_Id_C IN compras.Id_C%TYPE, w_Id_T IN compras.Id_T%TYPE, w_Id_L IN compras.Id_L%TYPE, salida_esperada BOOLEAN);
  
  PROCEDURE eliminar(nombre_prueba VARCHAR2, w_Id_COM IN Compras.Id_COM%TYPE, salida_esperada BOOLEAN);
  
END Pruebas_Compras;  
/
