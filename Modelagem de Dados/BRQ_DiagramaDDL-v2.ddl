-- Gerado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   em:        2022-10-05 20:15:41 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE com_casa (
    t_comodo_cd_comodo NUMBER(5) NOT NULL,
    t_casa_cd_casa     NUMBER(5) NOT NULL
);

ALTER TABLE com_casa ADD CONSTRAINT com_casa_pk PRIMARY KEY ( t_comodo_cd_comodo,
                                                              t_casa_cd_casa );

CREATE TABLE gat_disp (
    t_gatilho_cd_gatilho         NUMBER(5) NOT NULL,
    t_dispositivo_cd_dispositivo NUMBER(5) NOT NULL
);

ALTER TABLE gat_disp ADD CONSTRAINT gat_disp_pk PRIMARY KEY ( t_gatilho_cd_gatilho,
                                                              t_dispositivo_cd_dispositivo );

CREATE TABLE t_asset (
    cd_asset               NUMBER(5) NOT NULL,
    nm_asset               VARCHAR2(150) NOT NULL,
    ds_asset               VARCHAR2(250),
    ds_ativa               CHAR(1) NOT NULL,
    t_integracoes_cd_integ NUMBER(5) NOT NULL
);

ALTER TABLE t_asset ADD CONSTRAINT t_asset_pk PRIMARY KEY ( cd_asset );

CREATE TABLE t_bairro (
    cd_bairro          NUMBER(5) NOT NULL,
    nm_bairro          VARCHAR2(100) NOT NULL,
    t_cidade_cd_cidade NUMBER(5) NOT NULL
);

ALTER TABLE t_bairro ADD CONSTRAINT t_bairro_pk PRIMARY KEY ( cd_bairro );

CREATE TABLE t_casa (
    cd_casa                NUMBER(5) NOT NULL,
    nm_casa                VARCHAR2(150) NOT NULL,
    t_endereco_cd_endereco NUMBER(5) NOT NULL
);

CREATE UNIQUE INDEX t_casa__idx ON
    t_casa (
        t_endereco_cd_endereco
    ASC );

ALTER TABLE t_casa ADD CONSTRAINT t_casa_pk PRIMARY KEY ( cd_casa );

CREATE TABLE t_cidade (
    cd_cidade          NUMBER(5) NOT NULL,
    nm_cidade          VARCHAR2(100) NOT NULL,
    t_estado_cd_estado NUMBER(5) NOT NULL
);

ALTER TABLE t_cidade ADD CONSTRAINT t_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE t_comodo (
    cd_comodo NUMBER(5) NOT NULL,
    nm_comodo VARCHAR2(150) NOT NULL,
    ds_comodo VARCHAR2(250)
);

ALTER TABLE t_comodo ADD CONSTRAINT t_comodo_pk PRIMARY KEY ( cd_comodo );

CREATE TABLE t_dispositivo (
    cd_dispositivo     NUMBER(5) NOT NULL,
    nm_dispositivo     VARCHAR2(50) NOT NULL,
    ds_dispositivo     VARCHAR2(250),
    ds_ativa           CHAR(1) NOT NULL,
    t_comodo_cd_comodo NUMBER(5) NOT NULL
);

ALTER TABLE t_dispositivo ADD CONSTRAINT t_dispositivo_pk PRIMARY KEY ( cd_dispositivo );

CREATE TABLE t_endereco (
    cd_endereco                 NUMBER(5) NOT NULL,
    t_tp_langrad_cd_langradouro NUMBER(5) NOT NULL,
    t_bairro_cd_bairro          NUMBER(5) NOT NULL
);

ALTER TABLE t_endereco ADD CONSTRAINT t_endereco_pk PRIMARY KEY ( cd_endereco );

CREATE TABLE t_estado (
    cd_estado NUMBER(5) NOT NULL,
    nm_estado VARCHAR2(50) NOT NULL,
    sg_estado VARCHAR2(2) NOT NULL
);

ALTER TABLE t_estado ADD CONSTRAINT t_estado_pk PRIMARY KEY ( cd_estado );

CREATE TABLE t_gatilho (
    cd_gatilho NUMBER(5) NOT NULL,
    nm_gatilho VARCHAR2(30) NOT NULL,
    tp_periodo VARCHAR2(10) NOT NULL,
    dt_disparo DATE NOT NULL,
    dt_criacao DATE NOT NULL
);

ALTER TABLE t_gatilho ADD CONSTRAINT t_gatilho_pk PRIMARY KEY ( cd_gatilho );

CREATE TABLE t_integracoes (
    cd_integ       NUMBER(5) NOT NULL,
    nm_integ       VARCHAR2(50) NOT NULL,
    str_linkapi    VARCHAR2(150) NOT NULL,
    t_casa_cd_casa NUMBER(5) NOT NULL,
    ds_integ       VARCHAR2(250),
    cd_token       VARCHAR2(128),
    nm_user        VARCHAR2(150),
    scr_password   VARCHAR2(200)
);

ALTER TABLE t_integracoes ADD CONSTRAINT t_integracoes_pk PRIMARY KEY ( cd_integ );

CREATE TABLE t_tp_langrad (
    cd_langradouro NUMBER(5) NOT NULL,
    ds_langradouro VARCHAR2(100) NOT NULL
);

ALTER TABLE t_tp_langrad ADD CONSTRAINT t_tp_langrad_pk PRIMARY KEY ( cd_langradouro );

ALTER TABLE com_casa
    ADD CONSTRAINT com_casa_t_casa_fk FOREIGN KEY ( t_casa_cd_casa )
        REFERENCES t_casa ( cd_casa );

ALTER TABLE com_casa
    ADD CONSTRAINT com_casa_t_comodo_fk FOREIGN KEY ( t_comodo_cd_comodo )
        REFERENCES t_comodo ( cd_comodo );

ALTER TABLE gat_disp
    ADD CONSTRAINT gat_disp_t_dispositivo_fk FOREIGN KEY ( t_dispositivo_cd_dispositivo )
        REFERENCES t_dispositivo ( cd_dispositivo );

ALTER TABLE gat_disp
    ADD CONSTRAINT gat_disp_t_gatilho_fk FOREIGN KEY ( t_gatilho_cd_gatilho )
        REFERENCES t_gatilho ( cd_gatilho );

ALTER TABLE t_asset
    ADD CONSTRAINT t_asset_t_integracoes_fk FOREIGN KEY ( t_integracoes_cd_integ )
        REFERENCES t_integracoes ( cd_integ );

ALTER TABLE t_bairro
    ADD CONSTRAINT t_bairro_t_cidade_fk FOREIGN KEY ( t_cidade_cd_cidade )
        REFERENCES t_cidade ( cd_cidade );

ALTER TABLE t_casa
    ADD CONSTRAINT t_casa_t_endereco_fk FOREIGN KEY ( t_endereco_cd_endereco )
        REFERENCES t_endereco ( cd_endereco );

ALTER TABLE t_cidade
    ADD CONSTRAINT t_cidade_t_estado_fk FOREIGN KEY ( t_estado_cd_estado )
        REFERENCES t_estado ( cd_estado );

ALTER TABLE t_dispositivo
    ADD CONSTRAINT t_dispositivo_t_comodo_fk FOREIGN KEY ( t_comodo_cd_comodo )
        REFERENCES t_comodo ( cd_comodo );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endereco_t_bairro_fk FOREIGN KEY ( t_bairro_cd_bairro )
        REFERENCES t_bairro ( cd_bairro );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endereco_t_tp_langrad_fk FOREIGN KEY ( t_tp_langrad_cd_langradouro )
        REFERENCES t_tp_langrad ( cd_langradouro );

ALTER TABLE t_integracoes
    ADD CONSTRAINT t_integracoes_t_casa_fk FOREIGN KEY ( t_casa_cd_casa )
        REFERENCES t_casa ( cd_casa );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             1
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
