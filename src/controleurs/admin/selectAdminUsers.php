<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

session_start();

$myIncludePath = '/var/www/';
set_include_path(get_include_path() . PATH_SEPARATOR . $myIncludePath);


$_SESSION['typeAffichageAdmin']='users';


//echo "<br>on sort de selectAdminUsers.php <br>";
//echo "<a href=/popote/index.php>Continuer</a>";
header("location: /");
?>