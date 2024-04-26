/*********************  GERMAN DARIO OSPINA  ********************
*********************  Crear tabla EMPLEADOS *******************/
CREATE TABLE EMPLEADOS (
    id_empleado     NUMBER(12) NOT NULL, 
                    CONSTRAINT empleado_id_pk PRIMARY KEY (id_empleado),
    nombres         VARCHAR2(30) NOT NULL,
    apellidos       VARCHAR2(30) NOT NULL,
    fecha_ingreso   DATE         NOT NULL
);

/********************* Crear tabla VENTAS *********************/
CREATE TABLE VENTAS (
    id_venta        NUMBER(15)
                    CONSTRAINT venta_id_pk NOT NULL ,  
        	        PRIMARY KEY (id_venta),
    descrip_venta   VARCHAR2(200) NOT NULL,
    valor_venta     NUMBER(20) NOT NULL, 
    fecha_venta     DATE NOT NULL,
    id_empleado     NUMBER(12) NOT NULL,
                    CONSTRAINT venta_id_fk FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);


/********************* Insertar data en tabla EMPLEADOS *********************/
BEGIN  
    INSERT INTO EMPLEADOS VALUES (1014420896, 'ALEJANDRA', 'GOMEZ','01/07/2023');
    INSERT INTO EMPLEADOS VALUES (976574965, 'OSCAR', 'ORJUELA','15/04/2022');
    INSERT INTO EMPLEADOS VALUES (1015678964, 'CARLOS DAVID', 'SANCHEZ','01/07/2023');
    INSERT INTO EMPLEADOS VALUES (1019678452, 'CAMILA', 'FONSECA','05/09/2023');
    INSERT INTO EMPLEADOS VALUES (1013874521, 'JUAN CAMILO', 'OSORIO', '01/04/2024');
    COMMIT;
END; 


/********************* Insertar data en tabla VENTAS *********************/
BEGIN  
    INSERT INTO VENTAS VALUES (1, 'Televisor 50" marca Samsung', 2362000, '05/01/2024',  1014420896);
    INSERT INTO VENTAS VALUES (2, 'Nevera marca Haceb', 1605000, '15/01/2024', 976574965);
    INSERT INTO VENTAS VALUES (3, 'Portatil Msi cyborg 15 i5 12450H RTX 4050 8 GB RAM 512 SSD 144hz 156', 4950000, '20/01/2024', 976574965);
    INSERT INTO VENTAS VALUES (4, 'Impresora multifuncional marca HP', 780000, '25/01/2024', 1019678452);
    INSERT INTO VENTAS VALUES (5, 'Altavoz inalámbrico marca JBL', 865200, '28/01/2024', 1014420896);
    INSERT INTO VENTAS VALUES (6, 'Grabadora portatil profesional marca ZOOM', 2089000, '02/02/2024', 976574965);
    INSERT INTO VENTAS VALUES (7, 'Calculadora marca HP', 723500, '15/02/2024', 1014420896);
    INSERT INTO VENTAS VALUES (8, 'Consola PS5 playstation', 2340950, '19/02/2024', 1019678452);
    INSERT INTO VENTAS VALUES (9, 'Parlante Bluetooth Jbl Boombox 2 Portátil Negro', 1645000, '24/02/2024', 1014420896);
    INSERT INTO VENTAS VALUES (10, 'Portatil gamer Lenovo Loq Core I7 Rtx 4050 Ram 24Gb Ssd 1000Gb', 5170000, '27/02/2024', 976574965);
    INSERT INTO VENTAS VALUES (11, 'Monitor Gaming 27 pulgadas HP X27', 899000, '07/03/2024', 976574965);
    INSERT INTO VENTAS VALUES (12, 'Cargador portátil de 24000 mAh y 88.8Wh - 65Watts portable', 587000, '23/03/2024', 1019678452);
    INSERT INTO VENTAS VALUES (13, 'Consola nintendo switch', 1153200, '25/03/2024', 1019678452);
    INSERT INTO VENTAS VALUES (14, 'Monitor Hp Ecran Pc V24v G5 23,8 Full Hd', 780000, '29/03/2024', 1019678452);
    INSERT INTO VENTAS VALUES (15, 'Consola Mini Retro Arcade Fc 360 Juegos 2 Controles Blanco', 2089000, '03/04/2024', 1019678452);
    INSERT INTO VENTAS VALUES (16, 'Deshumidificador Pequeño Portátil Kioudic', 426000, '06/04/2024', 1015678964);
    INSERT INTO VENTAS VALUES (17, 'Licuadora Portátil Sin Bpa La Reveuse', 245000, '11/04/2024', 1019678452);
    INSERT INTO VENTAS VALUES (18, 'Samsung disco duro portátil de 1 TB estado sólido USB', 2195000, '13/04/2024', 1014420896);
    INSERT INTO VENTAS VALUES (19, 'MacBook Air APPLE MGN63LA/A Apple M1 8 Núcleos 8 GB RAM 256 GB SSD', 3890000, '18/04/2024', 976574965);
    INSERT INTO VENTAS VALUES (20, 'Impresora Laser Hp M4303fdw Multifuncional', 2736000, '21/04/2024', 1019678452);
    COMMIT;
END; 


/********************* función que retorna colección por empleado *********************/
CREATE OR REPLACE FUNCTION OBTENER_VENTAS_EMPLEADO(v_id_empleado IN NUMBER) 
RETURN lista_venta_empleado
IS
    cursor_venta lista_venta_empleado;
BEGIN
    OPEN cursor_venta FOR
        SELECT id_venta, valor_venta
        FROM ventas
        WHERE id_empleado = v_id_empleado;

    RETURN cursor_venta;
END OBTENER_VENTAS_EMPLEADO;


/********************* Validar función *********************/
SELECT OBTENER_VENTAS_EMPLEADO('1014420896') AS EMPL1 FROM DUAL;
SELECT OBTENER_VENTAS_EMPLEADO('976574965') AS EMPL2 FROM DUAL;
SELECT OBTENER_VENTAS_EMPLEADO('1015678964') AS EMPL3 FROM DUAL;
SELECT OBTENER_VENTAS_EMPLEADO('1019678452') AS EMPL4 FROM DUAL;
SELECT OBTENER_VENTAS_EMPLEADO('1013874521') AS EMPL5 FROM DUAL;


--SELECT * FROM EMPLEADOS;
--SELECT * FROM VENTAS;

