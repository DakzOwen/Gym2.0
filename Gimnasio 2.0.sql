CREATE TABLE CLIENTES(
  cod_cli NUMBER(4) NOT NULL,
  dpi varchar2(20)NOT NULL,
  nombre varchar2(35)NOT NULL,
  apellido varchar2(35)NOT NULL,
  telefono varchar2(20)NOT NULL,
  telaux varchar2(20) null,
  edad varchar2(5)NOT NULL,
  sexo varchar2(3)NOT NULL,
  estado int NOT NULL,
  fecha_registro date,
  fecha_autorizado date,
  img BLOB ,  
  primary key(cod_cli)
  );
 CREATE SEQUENCE CLI_SEQ START WITH 101;
 
 CREATE TABLE PAGOS(
 cod_pag NUMBER(5) NOT NULL,
 cod_cli NUMBER(4) NOT NULL,
 nombre varchar2(40) NOT NULL,
 monto float NOT NULL,
 estadop int NOT NULL,
 fecha_pago date NOT NULL,
 primary key(cod_pag)
 );
 CREATE SEQUENCE PAG_SEQ START WITH 1;
 
 
  alter table PAGOS
  add constraint fkpagos
  foreign key (cod_cli)
  references CLIENTES (cod_cli);
 
create table USUA(
cod_usu int,
nom_usu varchar2(35),
pass_usu varchar2(30),
primary key(cod_usu)
 );
 
 CREATE SEQUENCE USU_SEQ START WITH 1;
 
drop table USUA; 
drop table PAGOS;
drop table CLIENTES;

drop SEQUENCE CLI_SEQ;
drop SEQUENCE PAG_SEQ;
drop SEQUENCE USU_SEQ;


 
 select * from CLIENTES ORDER BY COD_CLI;
 select * from PAGOS ORDER BY COD_PAG;

INSERT INTO USUA VALUES (usu.nextval,'admin','admin');
INSERT INTO USUA VALUES (usu.nextval,'invitado','invitado');
UPDATE CLIENTES SET estado = 1 WHERE cod_cli =109;

INSERT INTO CLIENTES(cod_cli, dpi, nombre, apellido, telefono, telaux, edad, sexo, estado, fecha_registro, fecha_autorizado)
VALUES (CLI_SEQ.NEXTVAL, '11111','Nombre','Apellido', '23423423','234234234','12','M','1',TO_DATE('20-03-1196','DD-MM-YYYY'),TO_DATE('20-03-1196','DD-MM-YYYY'));

INSERT INTO PAGOS(cod_pag, cod_cli, nombre, monto, estadop, fecha_pago)
VALUES (CLI_SEQ.NEXTVAL,'101','Nombre','1000','1',TO_DATE('20-03-1196','DD-MM-YYYY'));

update CLIENTES set FECHA_AUTORIZADO = FECHA_AUTORIZADO + interval '1' month;
update CLIENTES set FECHA_AUTORIZADO = add_months(FECHA_AUTORIZADO,1) WHERE COD_CLI = '101';

update CLIENTES set FECHA_AUTORIZADO = (FECHA_AUTORIZADO +1) WHERE COD_CLI = '101';
  
select * from CLIENTES ORDER BY 5;
  