-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1536
--   en:        2019-05-03 14:56:39 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE notificaciones_oficiales (
    codigo_notificacion       INTEGER NOT NULL,
    codigo_administrador      INTEGER NOT NULL,
    notificacion              VARCHAR2(4000),
    fecha_hora_notificacion   DATE
);

ALTER TABLE notificaciones_oficiales ADD CONSTRAINT notificaciones_oficiales_pk PRIMARY KEY ( codigo_notificacion );

CREATE TABLE tbl_administradores (
    codigo_administrador   INTEGER NOT NULL,
    correo_admin           VARCHAR2(100) NOT NULL,
    nombre_usuario_admin   VARCHAR2(100) NOT NULL,
    nombre_admin           VARCHAR2(200) NOT NULL,
    contraseña_admin       VARCHAR2(100) NOT NULL
);

ALTER TABLE tbl_administradores ADD CONSTRAINT tbl_administradores_pk PRIMARY KEY ( codigo_administrador );

ALTER TABLE tbl_administradores ADD CONSTRAINT tbl_administradores__un UNIQUE ( correo_admin,
                                                                                nombre_usuario_admin );

CREATE TABLE tbl_colaboradores_tablero (
    codigo_tablero     INTEGER NOT NULL,
    codigos_usuarios   INTEGER NOT NULL
);

ALTER TABLE tbl_colaboradores_tablero ADD CONSTRAINT tbl_colaboradores_tablero_pk PRIMARY KEY ( codigos_usuarios,
                                                                                                codigo_tablero );

CREATE TABLE tbl_comentario (
    codigo_comentario   INTEGER NOT NULL,
    codigos_usuarios    INTEGER NOT NULL,
    codigo_pin          INTEGER NOT NULL,
    titulo_comentario   VARCHAR2(80),
    comentario          VARCHAR2(4000)
);

ALTER TABLE tbl_comentario ADD CONSTRAINT tbl_comentario_pk PRIMARY KEY ( codigo_comentario );

CREATE TABLE tbl_conversaciones (
    codigo_conversacion          INTEGER NOT NULL,
    codigos_usuarios_primario    INTEGER NOT NULL,
    codigos_usuario_secundario   INTEGER NOT NULL,
    fecha_hora_inicio            DATE
);

ALTER TABLE tbl_conversaciones ADD CONSTRAINT tbl_conversaciones_pk PRIMARY KEY ( codigo_conversacion );

CREATE TABLE tbl_cuenta_empresarial (
    codigo_cuenta_empresarial   INTEGER NOT NULL,
    codigos_usuario_dueno       INTEGER NOT NULL,
    nombre_cuenta               VARCHAR2(200) NOT NULL,
    fecha_hora_creacion         DATE
);

ALTER TABLE tbl_cuenta_empresarial ADD CONSTRAINT tbl_cuenta_empresarial_pk PRIMARY KEY ( codigo_cuenta_empresarial );

ALTER TABLE tbl_cuenta_empresarial ADD CONSTRAINT tbl_cuenta_empresarial__un UNIQUE ( nombre_cuenta );

CREATE TABLE tbl_denuncias_conversacion (
    codigo_denuncia        INTEGER NOT NULL,
    codigo_tipo_denuncia   INTEGER NOT NULL,
    codigo_conversacion    INTEGER NOT NULL,
    fecha_hora_denuncia    DATE
);

ALTER TABLE tbl_denuncias_conversacion ADD CONSTRAINT tbl_denuncias_mensaje_pk PRIMARY KEY ( codigo_denuncia );

CREATE TABLE tbl_denuncias_pin (
    codigos_usuarios       INTEGER NOT NULL,
    codigo_pin             INTEGER NOT NULL,
    codigo_tipo_denuncia   INTEGER NOT NULL,
    fecha_hora_denuncia    DATE
);

CREATE TABLE tbl_disponibilidad_usuario (
    codigo_estado             INTEGER NOT NULL,
    estado                    VARCHAR2(200),
    fecha_hora_modificacion   DATE
);

ALTER TABLE tbl_disponibilidad_usuario ADD CONSTRAINT disponibilidad_usuario_pk PRIMARY KEY ( codigo_estado );

CREATE TABLE tbl_enlaces (
    codigo_enlace             INTEGER NOT NULL,
    codigos_usuarios_subida   INTEGER NOT NULL,
    fecha_hora_adicion        DATE,
    enlace                    VARCHAR2(4000)
);

ALTER TABLE tbl_enlaces ADD CONSTRAINT tbl_enlaces_pk PRIMARY KEY ( codigo_enlace );

CREATE TABLE tbl_estado_notificacion (
    codigo_estado   INTEGER NOT NULL,
    estado          VARCHAR2(50)
);

ALTER TABLE tbl_estado_notificacion ADD CONSTRAINT tbla_estado_notificacion_pk PRIMARY KEY ( codigo_estado );

CREATE TABLE tbl_estados_usuario (
    codigo_estado   INTEGER NOT NULL,
    nombre_estado   VARCHAR2(25)
);

ALTER TABLE tbl_estados_usuario ADD CONSTRAINT tbl_estados_usuario_pk PRIMARY KEY ( codigo_estado );

CREATE TABLE tbl_foto_usuario (
    codigo_foto         INTEGER NOT NULL,
    foto                BLOB,
    fecha_hora_subida   DATE
);

ALTER TABLE tbl_foto_usuario ADD CONSTRAINT tbl_foto_usuario_pk PRIMARY KEY ( codigo_foto );

CREATE TABLE tbl_mensajes (
    codigo_mensaje       INTEGER NOT NULL,
    mensaje              VARCHAR2(4000),
    fecha_hora_mensaje   DATE
);

ALTER TABLE tbl_mensajes ADD CONSTRAINT mensajes_pk PRIMARY KEY ( codigo_mensaje );

CREATE TABLE tbl_mensajes_x_usuario (
    codigo_mensaje              INTEGER NOT NULL,
    codigos_usuario_receptor    INTEGER NOT NULL,
    codigos_usuario_remitente   INTEGER NOT NULL
);

CREATE TABLE tbl_notificaciones (
    codigo_notificacion       INTEGER NOT NULL,
    codigos_usuarios          INTEGER NOT NULL,
    estado_notificacion       INTEGER NOT NULL,
    fecha_hora_notificacion   DATE,
    notificacion              VARCHAR2(4000)
);

ALTER TABLE tbl_notificaciones ADD CONSTRAINT tbl_notificaciones_pk PRIMARY KEY ( codigo_notificacion );

CREATE TABLE tbl_paginas_bloqueadas (
    codigo_bloqueo       INTEGER NOT NULL,
    codigo_enlace        INTEGER NOT NULL,
    fecha_hora_bloqueo   DATE
);

ALTER TABLE tbl_paginas_bloqueadas ADD CONSTRAINT tbl_paginas_bloqueadas_pk PRIMARY KEY ( codigo_bloqueo );

CREATE TABLE tbl_pines (
    codigo_pin          INTEGER NOT NULL,
    codigos_usuarios    INTEGER NOT NULL,
    codigo_enlace       INTEGER NOT NULL,
    pin                 BLOB,
    guardados           INTEGER,
    fecha_hora_subida   DATE,
    descripcion         VARCHAR2(4000)
);

ALTER TABLE tbl_pines ADD CONSTRAINT tbl_pines_pk PRIMARY KEY ( codigo_pin );

CREATE TABLE tbl_pines_guardados (
    codigos_usuarios   INTEGER NOT NULL,
    codigo_pin         INTEGER NOT NULL
);

ALTER TABLE tbl_pines_guardados ADD CONSTRAINT tbl_pines_guardados_pk PRIMARY KEY ( codigos_usuarios,
                                                                                    codigo_pin );

CREATE TABLE tbl_pines_x_tablero (
    codigo_pin       INTEGER NOT NULL,
    codigo_tablero   INTEGER NOT NULL
);

CREATE TABLE tbl_pines_x_tema (
    codigo_pin    INTEGER NOT NULL,
    codigo_tema   INTEGER NOT NULL
);

CREATE TABLE tbl_privacidad_tablero (
    codigo_privacidad   INTEGER NOT NULL,
    nombre_privacidad   VARCHAR2(50)
);

ALTER TABLE tbl_privacidad_tablero ADD CONSTRAINT tbl_privacidad_tablero_pk PRIMARY KEY ( codigo_privacidad );

CREATE TABLE tbl_seguidores_x_tablero (
    codigo_tablero     INTEGER NOT NULL,
    codigos_usuarios   INTEGER NOT NULL
);

ALTER TABLE tbl_seguidores_x_tablero ADD CONSTRAINT tbl_seguidores_x_tablero_pk PRIMARY KEY ( codigo_tablero,
                                                                                              codigos_usuarios );

CREATE TABLE tbl_subtablero (
    codigo_subtablero     INTEGER NOT NULL,
    codigo_tablero        INTEGER NOT NULL,
    nombre_subtablero     VARCHAR2(50),
    fecha_hora_creacion   DATE
);

ALTER TABLE tbl_subtablero ADD CONSTRAINT tbl_subtablero_pk PRIMARY KEY ( codigo_subtablero );

CREATE TABLE tbl_tableros (
    codigo_tablero        INTEGER NOT NULL,
    codigos_usuarios      INTEGER NOT NULL,
    codigo_tema           INTEGER,
    codigo_privacidad     INTEGER NOT NULL,
    nombre_tablero        VARCHAR2(50),
    descripcion           VARCHAR2(4000),
    fecha_hora_creacion   DATE
);

ALTER TABLE tbl_tableros ADD CONSTRAINT tbl_tableros_pk PRIMARY KEY ( codigo_tablero );

CREATE TABLE tbl_temas (
    codigo_tema   INTEGER NOT NULL,
    nombre_tema   VARCHAR2(400)
);

ALTER TABLE tbl_temas ADD CONSTRAINT tbl_temas_pk PRIMARY KEY ( codigo_tema );

CREATE TABLE tbl_tipo_denuncia_pin (
    codigo_tipo_denuncia   INTEGER NOT NULL,
    nombre_tipo_denuncia   VARCHAR2(2000)
);

ALTER TABLE tbl_tipo_denuncia_pin ADD CONSTRAINT tbl_tipo_denuncia_pin_pk PRIMARY KEY ( codigo_tipo_denuncia );

CREATE TABLE tbl_tipo_denuncias_conve (
    codigo_denuncia      INTEGER NOT NULL,
    "NOM,BRE_DENUNCIA"   VARCHAR2(200)
);

ALTER TABLE tbl_tipo_denuncias_conve ADD CONSTRAINT tbl_tipo_denuncias_conve_pk PRIMARY KEY ( codigo_denuncia );

CREATE TABLE tbl_usuarios (
    codigos_usuarios           INTEGER NOT NULL,
    codigo_foto                INTEGER NOT NULL,
    codigo_estado_activacion   INTEGER NOT NULL,
    disponibilidad_usuario     INTEGER NOT NULL,
    codigo_temas               INTEGER,
    notas                      INTEGER,
    seguidos                   INTEGER,
    tableros_seguidos          INTEGER,
    nombre_usuario             VARCHAR2(4000),
    correo                     VARCHAR2(4000),
    contraseña                 VARCHAR2(100),
    edad                       INTEGER,
    informacion_extra          VARCHAR2(4000),
    sitio_web                  VARCHAR2(100),
    pines_visitados            INTEGER,
    fecha_hora_creacion        DATE
);

ALTER TABLE tbl_usuarios ADD CONSTRAINT tbl_usuarios_pk PRIMARY KEY ( codigos_usuarios );

CREATE TABLE tbl_usuarios_ban (
    codigo_ban             INTEGER NOT NULL,
    codigos_usuario_ban    INTEGER NOT NULL,
    codigo_administrador   INTEGER NOT NULL,
    fecha_hora_ban         DATE
);

ALTER TABLE tbl_usuarios_ban ADD CONSTRAINT tbl_usuarios_ban_pk PRIMARY KEY ( codigo_ban );

CREATE TABLE tbl_usuarios_bloqueados (
    codigo_bloqueo        INTEGER NOT NULL,
    usuario_bloqueado     INTEGER NOT NULL,
    usuario_que_bloquea   INTEGER NOT NULL,
    fecha_hora_bloqueo    DATE
);

ALTER TABLE tbl_usuarios_bloqueados ADD CONSTRAINT tbl_usuarios_bloqueados_pk PRIMARY KEY ( codigo_bloqueo );

CREATE TABLE tbl_visitas_a_usuario (
    codigos_usuario_visitante   INTEGER NOT NULL,
    codigos_usuario_visitado    INTEGER NOT NULL,
    fecha_hora                  DATE
);

ALTER TABLE tbl_visitas_a_usuario ADD CONSTRAINT tbl_visitas_a_usuario_pk PRIMARY KEY ( codigos_usuario_visitante,
                                                                                        codigos_usuario_visitado );

CREATE TABLE tbl_visitas_pin (
    codigos_usuario_visitado   INTEGER NOT NULL,
    codigo_usuario_visitante   INTEGER NOT NULL,
    codigo_pin                 INTEGER NOT NULL,
    fecha_visita               DATE
);

ALTER TABLE tbl_visitas_pin ADD CONSTRAINT tbl_visitas_pin_pk PRIMARY KEY ( codigos_usuario_visitado,
                                                                            codigo_pin );

CREATE TABLE tbl_visitas_tablero (
    codigo_tablero         INTEGER NOT NULL,
    codigos_usuarios       INTEGER NOT NULL,
    fecha_visita_tablero   DATE
);

ALTER TABLE tbl_visitas_tablero ADD CONSTRAINT tbl_visitas_tablero_pk PRIMARY KEY ( codigo_tablero,
                                                                                    codigos_usuarios );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT cod_estado_activacion FOREIGN KEY ( codigo_estado_activacion )
        REFERENCES tbl_estados_usuario ( codigo_estado );

ALTER TABLE tbl_colaboradores_tablero
    ADD CONSTRAINT col_tab_tab_fk FOREIGN KEY ( codigo_tablero )
        REFERENCES tbl_tableros ( codigo_tablero );

ALTER TABLE tbl_colaboradores_tablero
    ADD CONSTRAINT col_tab_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_conversaciones
    ADD CONSTRAINT con_usu_fk FOREIGN KEY ( codigos_usuarios_primario )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_conversaciones
    ADD CONSTRAINT con_usu_fkv2 FOREIGN KEY ( codigos_usuario_secundario )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_cuenta_empresarial
    ADD CONSTRAINT cue_emp_usu_fk FOREIGN KEY ( codigos_usuario_dueno )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_denuncias_conversacion
    ADD CONSTRAINT den_con_con_fk FOREIGN KEY ( codigo_conversacion )
        REFERENCES tbl_conversaciones ( codigo_conversacion );

ALTER TABLE tbl_denuncias_conversacion
    ADD CONSTRAINT den_con_tip_den_con_fk FOREIGN KEY ( codigo_tipo_denuncia )
        REFERENCES tbl_tipo_denuncias_conve ( codigo_denuncia );

ALTER TABLE tbl_denuncias_pin
    ADD CONSTRAINT den_pin_pin_fk FOREIGN KEY ( codigo_pin )
        REFERENCES tbl_pines ( codigo_pin );

ALTER TABLE tbl_denuncias_pin
    ADD CONSTRAINT den_pin_tip_den_pin_fk FOREIGN KEY ( codigo_tipo_denuncia )
        REFERENCES tbl_tipo_denuncia_pin ( codigo_tipo_denuncia );

ALTER TABLE tbl_denuncias_pin
    ADD CONSTRAINT den_pin_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_enlaces
    ADD CONSTRAINT enl_usu_fk FOREIGN KEY ( codigos_usuarios_subida )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_mensajes_x_usuario
    ADD CONSTRAINT men_x_usu_men_fk FOREIGN KEY ( codigo_mensaje )
        REFERENCES tbl_mensajes ( codigo_mensaje );

ALTER TABLE tbl_mensajes_x_usuario
    ADD CONSTRAINT men_x_usu_usu_fk FOREIGN KEY ( codigos_usuario_remitente )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_mensajes_x_usuario
    ADD CONSTRAINT men_x_usu_usu_fkv2 FOREIGN KEY ( codigos_usuario_receptor )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_notificaciones
    ADD CONSTRAINT not_est_not_fk FOREIGN KEY ( estado_notificacion )
        REFERENCES tbl_estado_notificacion ( codigo_estado );

ALTER TABLE notificaciones_oficiales
    ADD CONSTRAINT not_ofi_adm_fk FOREIGN KEY ( codigo_administrador )
        REFERENCES tbl_administradores ( codigo_administrador );

ALTER TABLE tbl_notificaciones
    ADD CONSTRAINT not_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_paginas_bloqueadas
    ADD CONSTRAINT pag_blo_enl_fk FOREIGN KEY ( codigo_enlace )
        REFERENCES tbl_enlaces ( codigo_enlace );

ALTER TABLE tbl_pines
    ADD CONSTRAINT pin_enl_fk FOREIGN KEY ( codigo_enlace )
        REFERENCES tbl_enlaces ( codigo_enlace );

ALTER TABLE tbl_pines_guardados
    ADD CONSTRAINT pin_gua_pin_fk FOREIGN KEY ( codigo_pin )
        REFERENCES tbl_pines ( codigo_pin );

ALTER TABLE tbl_pines_guardados
    ADD CONSTRAINT pin_gua_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_pines
    ADD CONSTRAINT pin_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_pines_x_tablero
    ADD CONSTRAINT pin_x_tab_pin_fk FOREIGN KEY ( codigo_pin )
        REFERENCES tbl_pines ( codigo_pin );

ALTER TABLE tbl_pines_x_tablero
    ADD CONSTRAINT pin_x_tab_tab_fk FOREIGN KEY ( codigo_tablero )
        REFERENCES tbl_tableros ( codigo_tablero );

ALTER TABLE tbl_pines_x_tema
    ADD CONSTRAINT pin_x_tem_pin_fk FOREIGN KEY ( codigo_pin )
        REFERENCES tbl_pines ( codigo_pin );

ALTER TABLE tbl_pines_x_tema
    ADD CONSTRAINT pin_x_tem_tem_fk FOREIGN KEY ( codigo_tema )
        REFERENCES tbl_temas ( codigo_tema );

ALTER TABLE tbl_seguidores_x_tablero
    ADD CONSTRAINT seg_tab_fk FOREIGN KEY ( codigo_tablero )
        REFERENCES tbl_tableros ( codigo_tablero );

ALTER TABLE tbl_seguidores_x_tablero
    ADD CONSTRAINT seg_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_subtablero
    ADD CONSTRAINT sub_tabl_fk FOREIGN KEY ( codigo_tablero )
        REFERENCES tbl_tableros ( codigo_tablero );

ALTER TABLE tbl_tableros
    ADD CONSTRAINT tab_pri_tab_fk FOREIGN KEY ( codigo_privacidad )
        REFERENCES tbl_privacidad_tablero ( codigo_privacidad );

ALTER TABLE tbl_tableros
    ADD CONSTRAINT tab_tem_fk FOREIGN KEY ( codigo_tema )
        REFERENCES tbl_temas ( codigo_tema );

ALTER TABLE tbl_tableros
    ADD CONSTRAINT tab_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_comentario
    ADD CONSTRAINT tbl_com_tbl_pin_fk FOREIGN KEY ( codigo_pin )
        REFERENCES tbl_pines ( codigo_pin );

ALTER TABLE tbl_comentario
    ADD CONSTRAINT tbl_com_tbl_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_usuarios_ban
    ADD CONSTRAINT usu_ban_adm_fk FOREIGN KEY ( codigo_administrador )
        REFERENCES tbl_administradores ( codigo_administrador );

ALTER TABLE tbl_usuarios_ban
    ADD CONSTRAINT usu_ban_usu_fk FOREIGN KEY ( codigos_usuario_ban )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_usuarios_bloqueados
    ADD CONSTRAINT usu_blo_usu_fk FOREIGN KEY ( usuario_bloqueado )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_usuarios_bloqueados
    ADD CONSTRAINT usu_blo_usu_fkv2 FOREIGN KEY ( usuario_que_bloquea )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT usu_dis_usu_fk FOREIGN KEY ( disponibilidad_usuario )
        REFERENCES tbl_disponibilidad_usuario ( codigo_estado );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT usu_fot_usu_fk FOREIGN KEY ( codigo_foto )
        REFERENCES tbl_foto_usuario ( codigo_foto );

ALTER TABLE tbl_visitas_a_usuario
    ADD CONSTRAINT vis_a_usu_usu_fk FOREIGN KEY ( codigos_usuario_visitante )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_visitas_pin
    ADD CONSTRAINT vis_pin_pin_fk FOREIGN KEY ( codigo_pin )
        REFERENCES tbl_pines ( codigo_pin );

ALTER TABLE tbl_visitas_pin
    ADD CONSTRAINT vis_pin_usu_fk FOREIGN KEY ( codigos_usuario_visitado )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_visitas_pin
    ADD CONSTRAINT vis_pin_usu_fkv2 FOREIGN KEY ( codigo_usuario_visitante )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_visitas_tablero
    ADD CONSTRAINT vis_tab_tab_fk FOREIGN KEY ( codigo_tablero )
        REFERENCES tbl_tableros ( codigo_tablero );

ALTER TABLE tbl_visitas_tablero
    ADD CONSTRAINT vis_tab_usu_fk FOREIGN KEY ( codigos_usuarios )
        REFERENCES tbl_usuarios ( codigos_usuarios );

ALTER TABLE tbl_visitas_a_usuario
    ADD CONSTRAINT vis_usu_usu_fk FOREIGN KEY ( codigos_usuario_visitado )
        REFERENCES tbl_usuarios ( codigos_usuarios );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            34
-- CREATE INDEX                             0
-- ALTER TABLE                             80
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