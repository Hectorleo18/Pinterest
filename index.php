<html>
    <head>
        <meta charset="utf-8"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/openModal.css" />
        <link type="text/css" rel="stylesheet" href="css/flexbox-galery.css" />
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/flexbox-galery.js"></script> 
    </head>
    
<title>Pinterest</title>

<body>    
    <!--Fondo Con imagenes -->
    <div id="contenedor">
        <figure>
            <img src="imagenes/1.jpg">
        </figure>
        <figure>
            <img src="imagenes/2.jpg">
        </figure>
        <figure>
            <img src="imagenes/3.jpg">
        </figure>
        <figure>
            <img src="imagenes/4.jpg">
        </figure>
        <figure>
            <img src="imagenes/5.jpg">
        </figure>
        <figure>
            <img src="imagenes/6.jpg">
        </figure>
        <figure>
            <img src="imagenes/7.jpg">
        </figure>
        <figure>
            <img src="imagenes/8.jpg">
        </figure>
        <figure>
            <img src="imagenes/9.jpg">
        </figure>
        <figure>
            <img src="imagenes/10.jpg">
        </figure>
        <figure>
            <img src="imagenes/11.jpg">
        </figure>
      </div>

    <!--Script para el fondo de imagenes-->
    <script>
    $('#contenedor').flexgal();
    </script>
    
        <div id="openModal2" class="modalDialog" role="dialog">
            Prueba
        </div>
        <!-- Formulario de ingreso -->
        <div id="openModal" class="modalDialog" role="dialog" >
            
            <div id="division" class="modal-content">
                    <div class="modal-header">
                        <div >
                            <img class="img-responsive img-center"src="iconos/icono.jpg" alt="Icono" width="90" margin="10" height="60"><br><br>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div id="texto-registro">
                            <p class="negrita">Te damos la bienvenida a Pinterest</p>
                        </div>
                        <div id="texto">
                            <p>Encuentra nuevas ideas que probar</p>
                        </div>
                        <div>
                            <form action="datos.php" method="POST">
                                <div>
                                    <p id="centrar"><input id="field" class="form-control form-control-lg" type="email" name="correo" placeholder="Correo"> </p><br>
                                </div>
                                <div>
                                    <p id="centrar"><input id="field" class="form-control form-control-lg" type="password" name="contrasena" placeholder="Crea una contraseña"> </p><br>
                                </div>
                                <div>
                                <button id="centrar" onclick="alert('Boton de registrarse')" 
                                accesskey=""type="submit" class="btn btn-danger btn-lg btn-block">Continuar</button>
                                </div>
                            </form>
                            
                            <p class="centrarTexto">O</p>
                            <button id="botonFb" class="btn btn-secondary btn-lg btn-block" type="submit"><img class="botones" src="iconos/icono_facebook.png" alt="facebook logo" />Continuar con Facebook</button><br>
                            <button id="centrar" class="btn btn-primary btn-lg btn-block" type="submit"><img class="botones" src="iconos/google.png" alt="google logo" /> Continuar con Google</button><br>
                            
                        </div>
                    </div>
                    <div >
                        <p class="centrarTexto" style="font-size: 11px">Al continuar, aceptas las Condiciones del servicio y la Política de privacidad de Pinterest.</p>
                    </div>
                    <div class="centrarTexto">
                        <a href="paginas/login.php">¿Ya eres miembro? Inicia sesión</a>
                    </div>

                    <div class="modal-footer pie" role="button">
                        <button id="botonPie" type="button" class="btn btn-secondary btn-block" data-dismiss="modal"><p class="negra align-middle">Crear una cuenta de empresa</p></button>
                    </div>
                </div>
            
        </div>
        
    <!-- Boton para lanzar el formulario de login-->
    <button id='boton' onclick="location.href='#openModal'" ></button>
    
    <!-- Script para iniciar automaticamente el boton del formulario -->
    <script type="text/javascript">
        $(document).ready(function(){
            $('#boton').trigger('click');
        });
    </script>
</body>
</html>
