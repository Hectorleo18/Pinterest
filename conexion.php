<?php
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 //Inicio conexion
$conn = oci_connect("SYSTEM", "oracle", "localhost:1521/XE");
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
else {
   print "Connected to Oracle!";
}
// Cierre de conexion
oci_close($conn);
//echo phpinfo();

?>



