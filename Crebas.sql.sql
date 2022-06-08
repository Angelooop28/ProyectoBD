/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     31/05/2022 18:44:47                          */
/*==============================================================*/


drop index RELATIONSHIP_2_FK;

drop index CONTRATO_PK;

drop table CONTRATO;

drop index DEPARTAMENTO_PK;

drop table DEPARTAMENTO;

drop index RELATIONSHIP_4_FK;

drop index RELATIONSHIP_1_FK;

drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index RELATIONSHIP_6_FK;

drop index HORARIO_PK;

drop table HORARIO;

drop index PERSONAL_TH_PK;

drop table PERSONAL_TH;

drop index RELATIONSHIP_3_FK;

drop index SERVICIO_PK;

drop table SERVICIO;

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   ID_CONTRATO          SERIAL               not null,
   ID_EMPLEADO          INT4                 not null,
   FECHA_CONTRATO       DATE                 null,
   DURACION_CONTRATO    VARCHAR(10)          null,
   SEGURO_CONTRATO      VARCHAR(10)          null,
   BONO_CONTRATO        VARCHAR(10)          null,
   SUELDO_CONTRATO      VARCHAR(10)          null,
   VACACIONES_CONTRATO  VARCHAR(20)          null,
   constraint PK_CONTRATO primary key (ID_CONTRATO)
);

/*==============================================================*/
/* Index: CONTRATO_PK                                           */
/*==============================================================*/
create unique index CONTRATO_PK on CONTRATO (
ID_CONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on CONTRATO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DEPARTAMENTO      SERIAL               not null,
   NUM_DEPARTAMENTO     NUMERIC              null,
   CARGO                VARCHAR(20)          null,
   HORARIO              VARCHAR(20)          null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPARTAMENTO)
);

/*==============================================================*/
/* Index: DEPARTAMENTO_PK                                       */
/*==============================================================*/
create unique index DEPARTAMENTO_PK on DEPARTAMENTO (
ID_DEPARTAMENTO
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          SERIAL               not null,
   ID_PERSONALTH        INT4                 not null,
   ID_DEPARTAMENTO      INT4                 not null,
   CEDULA_EMPLEADO      VARCHAR(10)          null,
   NOMBRE_EMPLEADO      VARCHAR(30)          null,
   APELLIDO_EMPLEADO    VARCHAR(30)          null,
   TELEFONO_EMPLEADO    VARCHAR(10)          null,
   PROVINCIA_EMPLEADO   VARCHAR(20)          null,
   DIRECCION_           VARCHAR(30)          null,
   EMAIL_EMPLEADO       VARCHAR(50)          null,
   GENERO_EMPLEADO      VARCHAR(20)          null,
   CONTRATO_EMPLEADO    VARCHAR(20)          null,
   DEPARTAMENTO_EMPLEADO VARCHAR(20)          null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on EMPLEADO (
ID_PERSONALTH
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on EMPLEADO (
ID_DEPARTAMENTO
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO (
   ID_HORARIO           SERIAL               not null,
   ID_DEPARTAMENTO      INT4                 not null,
   ENTRADA              VARCHAR(20)          null,
   SALIDA               VARCHAR(20)          null,
   RETRASO              VARCHAR(20)          null,
   HORA_EXTRA           VARCHAR(20)          null,
   constraint PK_HORARIO primary key (ID_HORARIO)
);

/*==============================================================*/
/* Index: HORARIO_PK                                            */
/*==============================================================*/
create unique index HORARIO_PK on HORARIO (
ID_HORARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on HORARIO (
ID_DEPARTAMENTO
);

/*==============================================================*/
/* Table: PERSONAL_TH                                           */
/*==============================================================*/
create table PERSONAL_TH (
   ID_PERSONALTH        SERIAL               not null,
   CEDULA               VARCHAR(10)          null,
   NOMBRE               VARCHAR(30)          null,
   APELLIDO             VARCHAR(30)          null,
   TELEFONO_EMPLEADO    VARCHAR(10)          null,
   DIRECCION_           VARCHAR(30)          null,
   CORREO_PERSONAL      VARCHAR(40)          null,
   constraint PK_PERSONAL_TH primary key (ID_PERSONALTH)
);

/*==============================================================*/
/* Index: PERSONAL_TH_PK                                        */
/*==============================================================*/
create unique index PERSONAL_TH_PK on PERSONAL_TH (
ID_PERSONALTH
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          SERIAL               not null,
   ID_PERSONALTH        INT4                 not null,
   VACACIONES_CONTRATO  VARCHAR(20)          null,
   PERMISO              VARCHAR(20)          null,
   ENFERMEDAD           VARCHAR(20)          null,
   ACCIDENTE_LABORAL    VARCHAR(20)          null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on SERVICIO (
ID_PERSONALTH
);

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



