<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


session_start();

$myIncludePath = '/var/www/';
set_include_path(get_include_path() . PATH_SEPARATOR . $myIncludePath);


$_SESSION['typeContenu']='recette';

//echo "<br>on sort de selectSortieAdmin.php <br>";
//echo "<a href=/popote/index.php>Continuer</a>";
header("location: /");
?>
