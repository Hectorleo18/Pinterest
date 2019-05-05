insert into tbl_foto_usuario (codigo_foto,FOTO,FECHA_HORA_SUBIDA) VALUES (1,NULL,TO_DATE(SYSDATE+1));
insert into tbl_foto_usuario (codigo_foto,FOTO,FECHA_HORA_SUBIDA) VALUES (2,NULL,TO_DATE(SYSDATE+1));
insert into tbl_foto_usuario (codigo_foto,FOTO,FECHA_HORA_SUBIDA) VALUES (3,NULL,TO_DATE(SYSDATE+1));
insert into tbl_foto_usuario (codigo_foto,FOTO,FECHA_HORA_SUBIDA) VALUES (4,NULL,TO_DATE(SYSDATE+1));
insert into tbl_foto_usuario (codigo_foto,FOTO,FECHA_HORA_SUBIDA) VALUES (5,NULL,TO_DATE(SYSDATE+1));

INSERT INTO tbl_tipo_denuncias_conve (codigo_denuncia, "NOM,BRE_DENUNCIA") VALUES (1, 'SPAM');
INSERT INTO tbl_tipo_denuncias_conve (codigo_denuncia, "NOM,BRE_DENUNCIA") VALUES (2, 'CONTENIDO INADECUADO');
INSERT INTO tbl_tipo_denuncias_conve (codigo_denuncia, "NOM,BRE_DENUNCIA") VALUES (3, 'VIRUS');
INSERT INTO tbl_tipo_denuncias_conve (codigo_denuncia, "NOM,BRE_DENUNCIA") VALUES (4, 'DESNUDOS');

INSERT INTO tbl_privacidad_tablero (codigo_privacidaD, NOMBRE_PRIVACIDAD) VALUES (1, 'PUBLICO');
INSERT INTO tbl_privacidad_tablero (codigo_privacidaD, NOMBRE_PRIVACIDAD) VALUES (2, 'PRIVADO');
INSERT INTO tbl_privacidad_tablero (codigo_privacidaD, NOMBRE_PRIVACIDAD) VALUES (3, 'OCULTO');

INSERT INTO tbl_disponibilidad_usuario (codigo_estado, ESTADO, FECHA_HORA_MODIFICACION) VALUES (1, 'DISPONIBLE', TO_DATE(SYSDATE));
INSERT INTO tbl_disponibilidad_usuario (codigo_estado, ESTADO, FECHA_HORA_MODIFICACION) VALUES (2, 'OCUPADO', TO_DATE(SYSDATE));

INSERT INTO tbl_mensajes (codigo_mensaje, MENSAJE, FECHA_HORA_MENSAJE) VALUES (1, 'HOLA', TO_DATE(SYSDATE));
INSERT INTO tbl_mensajes (codigo_mensaje, MENSAJE, FECHA_HORA_MENSAJE) VALUES (2, 'QUE TAL', TO_DATE(SYSDATE));
INSERT INTO tbl_mensajes (codigo_mensaje, MENSAJE, FECHA_HORA_MENSAJE) VALUES (3, 'MUY BIEN', TO_DATE(SYSDATE));
INSERT INTO tbl_mensajes (codigo_mensaje, MENSAJE, FECHA_HORA_MENSAJE) VALUES (4, 'UN PLACER', TO_DATE(SYSDATE));
INSERT INTO tbl_mensajes (codigo_mensaje, MENSAJE, FECHA_HORA_MENSAJE) VALUES (5, 'COMO VA TODO?', TO_DATE(SYSDATE));

INSERT INTO tbl_estado_notificacion (codigo_estado, ESTADO) VALUES (1, 'VISTO');
INSERT INTO tbl_estado_notificacion (codigo_estado, ESTADO) VALUES (2, 'NO VISTO');

INSERT INTO tbl_estados_usuario (codigo_estado, NOMBRE_ESTADO) VALUES (1, 'ACTIVO');
INSERT INTO tbl_estados_usuario (codigo_estado, NOMBRE_ESTADO) VALUES (2, 'OFFLINE');
INSERT INTO tbl_estados_usuario (codigo_estado, NOMBRE_ESTADO) VALUES (3, 'OCUPADO');

