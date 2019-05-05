--PROCEDIMIENTOS ALMACENADOS

/*PROCEDIMIENTO CREACION DE USUARIO*/

CREATE OR REPLACE PROCEDURE P_CREAR_USUARIO(
  p_contrasena tbl_usuarios.contraseña%TYPE,
  p_correo tbl_usuarios.correo%type,
  p_mensaje OUT varchar2,
  p_resultado OUT integer
) AS
  V_CANTIDAD_CORREO NUMBER;
  BEGIN
    SELECT COUNT(*)
    INTO V_CANTIDAD_CORREO
    FROM TBL_USUARIOS
    WHERE CORREO = p_correo;

    IF(V_CANTIDAD_CORREO=0) THEN
      INSERT INTO TBL_USUARIOS (
          CODIGOS_USUARIOS,
          CORREO,
          CONTRASEÑA
          )VALUES (
             SQ_CODIGO_USUARIO.nextval,
             p_correo,
             p_contrasena
                  );
      COMMIT;
      p_mensaje := 'Usuario registrado con exito';
      p_resultado := 1;

      ELSE
        p_mensaje := 'Correo ya existente';
        p_resultado := 0;
    END IF;

    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al guardar datos, intente de nuevo más tarde';
        p_resultado := 0;
  end;


/*PROCEDIMIENTO FINALIZAR REGISTRO*/

CREATE OR REPLACE PROCEDURE P_FIN_REGISTRO(
  p_codigo_usuario in integer,
  p_contrasena tbl_usuarios.contraseña%TYPE,
  p_correo tbl_usuarios.correo%type,
  p_notas tbl_usuarios.notas%type,
  p_nombre_usuario tbl_usuarios.NOMBRE_USUARIO%type,
  p_edad tbl_usuarios.EDAD%type,
  p_informacion_extra tbl_usuarios.INFORMACION_EXTRA%type,
  p_sitio_web tbl_usuarios.SITIO_WEB%type,
  p_disponibilidad tbl_usuarios.DISPONIBILIDAD_USUARIO%type,
  p_mensaje OUT varchar2,
  p_resultado OUT integer
) AS
  BEGIN
      INSERT INTO TBL_USUARIOS (
          CODIGOS_USUARIOS,
          DISPONIBILIDAD_USUARIO,
          NOTAS,
          NOMBRE_USUARIO,
          CORREO,
          CONTRASEÑA,
          EDAD,
          INFORMACION_EXTRA,
          SITIO_WEB,
          FECHA_HORA_CREACION
          )VALUES (
             p_codigo_usuario,
             p_disponibilidad,
             p_notas,
             p_nombre_usuario,
             p_correo,
             p_contrasena,
             p_edad,
             p_informacion_extra,
             p_sitio_web,
             sysdate
                  );
      COMMIT;
      p_mensaje := 'Usuario registrado con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al guardar datos, intente de nuevo más tarde';
        p_resultado := 0;
  end;




  /*PROCEDIMIENTO ELIMIMAR USUARIO*/

CREATE OR REPLACE PROCEDURE P_ELIMINAR_USUARIO(
  p_codigo_usuario tbl_usuarios.CODIGOS_USUARIOS%type,
  p_resultado OUT integer
) AS
  BEGIN
      DELETE FROM TBL_USUARIOS
      WHERE CODIGOS_USUARIOS = p_codigo_usuario;
      COMMIT;
      p_mensaje := 'Usuario ELIMINADO con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al eliminar, intente de nuevo más tarde';
        p_resultado := 0;
  end;

/*PROCEDIMIENTO AGREGAR PIN*/

CREATE OR REPLACE PROCEDURE P_AGREGAR_PIN(
  p_codigo_usuario in integer,
  p_descripcion TBL_PINES.DESCRIPCION%TYPE,
  p_resultado OUT integer,
  p_pin tbl_pines.PIN%type
) AS
  BEGIN
      INSERT INTO TBL_PINES (
          CODIGO_PIN,
          CODIGOS_USUARIOS,
          PIN,
          DESCRIPCION,
          FECHA_HORA_SUBIDA
          )VALUES (
             SQ_CODIGO_PIN.nextval,
             p_codigo_usuario,
             p_pin,
             p_descripcion,
             sysdate
                  );
      COMMIT;
      p_mensaje := 'pin subido con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al agregar datos, intente de nuevo más tarde';
        p_resultado := 0;
  end;


  /*PROCEDIMIENTO ELIMINAR PIN*/

  CREATE OR REPLACE PROCEDURE P_ELIMINAR_PIN(
  p_codigo_PIN tbl_PINES.CODIGO_PIN%type,
  p_resultado OUT integer
) AS
  BEGIN
      DELETE FROM TBL_PINES
      WHERE CODIGOS_USUARIOS = p_codigo_PIN;
      COMMIT;
      p_mensaje := 'Pin ELIMINADO con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al eliminar datos, intente de nuevo más tarde';
        p_resultado := 0;
  end;

/*PROCEDIMIENTO AGREGAR TABLERO*/

CREATE OR REPLACE PROCEDURE P_AGREGAR_TABLERO(
  p_codigo_usuario in integer,
  p_descripcion tbl_tableros.DESCRIPCION%type,
  p_codigo_tema tbl_tableros.CODIGO_TEMA%type,
  p_nombre_tablero tbl_tableros.NOMBRE_TABLERO%type,
  p_resultado OUT integer
) AS
  BEGIN
      INSERT INTO TBL_TABLEROS (
          CODIGO_TABLERO,
          CODIGOS_USUARIOS,
          CODIGO_TEMA,
          NOMBRE_TABLERO,
          DESCRIPCION,
          FECHA_HORA_CREACION
          )VALUES (
             SQ_CODIGO_TABLERO.nextval,
             p_codigo_usuario,
             p_codigo_tema,
             p_nombre_tablero,
             p_descripcion,
             sysdate
                  );
      COMMIT;
      p_mensaje := 'Tablero creaado con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al agregar datos, intente de nuevo más tarde';
        p_resultado := 0;
  end;


  /*PROCEDIMIENTO ELIMINAR TABLERO*/
CREATE OR REPLACE PROCEDURE P_ELIMINAR_TABLERO(
  p_codigo_tablero in integer,
  p_resultado OUT integer
) AS
  BEGIN
      DELETE FROM TBL_TABLEROS
      WHERE CODIGO_TABLERO = p_codigo_tablero;
      COMMIT;
      p_mensaje := 'Tablero ELIMINADO con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al eliminar, intente de nuevo más tarde';
        p_resultado := 0;
  end;


/*PROCEDIMIENTO CREAR SUBTABLERO*/

CREATE OR REPLACE PROCEDURE P_AGREGAR_SUBTABLERO(
  p_codigo_tablero tbl_subtablero.CODIGO_TABLERO%type,
  p_nombre_tablero TBL_SUBTABLERO.NOMBRE_SUBTABLERO%type,
  p_resultado OUT integer
) AS
  BEGIN
      INSERT INTO TBL_SUBTABLERO (
          CODIGO_SUBTABLERO,
          CODIGO_TABLERO,
          NOMBRE_SUBTABLERO,
          FECHA_HORA_CREACION
          )VALUES (
             SQ_CODIGO_SUBTABLERO.nextval,
             p_codigo_tablero,
             p_nombre_tablero,
             sysdate
                  );
      COMMIT;
      p_mensaje := 'Tablero creaado con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al agregar datos, intente de nuevo más tarde';
        p_resultado := 0;
  end;




  /*PROCEDIMIENTO ELIMINAR SUBTABLERO*/
CREATE OR REPLACE PROCEDURE P_ELIMINAR_SUBTABLERO(
  p_codigo_subtablero in integer,
  p_resultado OUT integer
) AS
  BEGIN
      DELETE FROM TBL_SUBTABLERO
      WHERE CODIGO_SUBTABLERO = p_codigo_subtablero;
      COMMIT;
      p_mensaje := 'Tablero ELIMINADO con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al eliminar, intente de nuevo más tarde';
        p_resultado := 0;
  end;

/*PROCEDIMIENTO CREAR COMENTARIO*/

CREATE OR REPLACE PROCEDURE P_AGREGAR_COMENTARIO(
  p_codigo_usuario tbl_comentario.CODIGOS_USUARIOS%type,
  p_codigo_pin tbl_comentario.CODIGO_PIN%type,
  p_titulo tbl_comentario.TITULO_COMENTARIO%type,
  p_comentario tbl_comentario.COMENTARIO%type,
  p_resultado OUT integer
) AS
  BEGIN
      INSERT INTO TBL_COMENTARIO (
          CODIGO_COMENTARIO,
          CODIGO_PIN,
          CODIGOS_USUARIOS,
          TITULO_COMENTARIO,
          COMENTARIO,
          FECHA_HORA_CREACION
          )VALUES (
             SQ_CODIGO_COMENTARIO.nextval,
             p_codigo_pin,
             p_codigo_usuario,
             p_titulo,
             p_comentario,
             sysdate
                  );
      COMMIT;
      p_mensaje := 'comentarios publicado con exito';
      p_resultado := 1;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR '|| SQLCODE || '-'||SQLERRM);
        ROLLBACK;
        p_mensaje := 'Error al agregar datos, intente de nuevo más tarde';
        p_resultado := 0;
  end;
