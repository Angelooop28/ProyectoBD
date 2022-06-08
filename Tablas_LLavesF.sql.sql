--CREACION DE LA TABLA PERSONAL DE TALENTO HUMANO
create table PERSONAL_TH (
   ID_PERSONALTH        SERIAL               not null,
   CEDULA               VARCHAR(10)          not null,
   NOMBRE               VARCHAR(30)          not null,
   APELLIDO             VARCHAR(30)          not null,
   TELEFONO_EMPLEADO    VARCHAR(10)          not null,
   DIRECCION_           VARCHAR(30)          not null,
   CORREO_PERSONAL      VARCHAR(40)          not null,
   constraint PK_PERSONAL_TH primary key (ID_PERSONALTH)
);


--CREACION DE LA TABLA EMPLEADO
create table EMPLEADO (
   ID_EMPLEADO          SERIAL               not null,
   ID_PERSONALTH        INT4                 not null,
   ID_DEPARTAMENTO      INT4                 not null,
   CEDULA_EMPLEADO      VARCHAR(10)          not null,
   NOMBRE_EMPLEADO      VARCHAR(30)          not null,
   APELLIDO_EMPLEADO    VARCHAR(30)          not null,
   TELEFONO_EMPLEADO    VARCHAR(10)          not null,
   PROVINCIA_EMPLEADO   VARCHAR(20)          not null,
   DIRECCION_           VARCHAR(30)          not null,
   EMAIL_EMPLEADO       VARCHAR(50)          not null,
   GENERO_EMPLEADO      VARCHAR(20)          not null,
   CONTRATO_EMPLEADO    VARCHAR(20)          not null,
   DEPARTAMENTO_EMPLEADO VARCHAR(20)         not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);


--CREACION DE LA TABLA CONTRATO
create table CONTRATO (
   ID_CONTRATO          SERIAL               not null,
   ID_EMPLEADO          INT4                 not null,
   FECHA_CONTRATO       DATE                 not null,
   DURACION_CONTRATO    VARCHAR(10)          not null,
   SEGURO_CONTRATO      VARCHAR(10)          not null,
   BONO_CONTRATO        VARCHAR(10)          not null,
   SUELDO_CONTRATO      VARCHAR(10)          not null,
   VACACIONES_CONTRATO  VARCHAR(20)          not null,
   constraint PK_CONTRATO primary key (ID_CONTRATO)
);


--CREACION DE LA TABLA HORARIO
create table HORARIO (
   ID_HORARIO           SERIAL               not null,
   ID_DEPARTAMENTO      INT4                 not null,
   ENTRADA              VARCHAR(20)          not null,
   SALIDA               VARCHAR(20)          not null,
   RETRASO              VARCHAR(20)          not null,
   HORA_EXTRA           VARCHAR(20)          not null,
   constraint PK_HORARIO primary key (ID_HORARIO)
);


--CREACION DE LA TABLA SERVICIO
create table SERVICIO (
   ID_SERVICIO          SERIAL               not null,
   ID_PERSONALTH        INT4                 not null,
   VACACIONES_CONTRATO  VARCHAR(20)          not null,
   PERMISO              VARCHAR(20)          not null,
   ENFERMEDAD           VARCHAR(20)          not null,
   ACCIDENTE_LABORAL    VARCHAR(20)          not null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);


--CREACION DE LA TABLA DEPARTAMENTO
create table DEPARTAMENTO (
   ID_DEPARTAMENTO      SERIAL               not null,
   NUM_DEPARTAMENTO     NUMERIC              not null,
   CARGO                VARCHAR(20)          not null,
   HORARIO              VARCHAR(20)          not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPARTAMENTO)
);


--CREACION DE LAS LLAVES FORANEAS
alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_PERSONAL foreign key (ID_PERSONALTH)
      references PERSONAL_TH (ID_PERSONALTH)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_DEPARTAM foreign key (ID_DEPARTAMENTO)
      references DEPARTAMENTO (ID_DEPARTAMENTO)
      on delete restrict on update restrict;

alter table HORARIO
   add constraint FK_HORARIO_RELATIONS_DEPARTAM foreign key (ID_DEPARTAMENTO)
      references DEPARTAMENTO (ID_DEPARTAMENTO)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_RELATIONS_PERSONAL foreign key (ID_PERSONALTH)
      references PERSONAL_TH (ID_PERSONALTH)
      on delete restrict on update restrict;