<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


session_start();
$myIncludePath = '/var/www';
set_include_path(get_include_path() . PATH_SEPARATOR . $myIncludePath);


if (isset($_SESSION['membre'])) {
    $_SESSION['typeContenu'] = 'gestion_compte';
    //echo "<br> type_contenu = gestion_compte";
} else {
    $_SESSION['typeContenu'] = 'login';
    //echo "<br> type_contenu = login";
}
$_SESSION['MessageGestionCompte']='';
unset($_SESSION['newmembre']);
//echo "<br>on sort de select_identification.php <br>";
//echo "<a href=/index.php>Continuer</a>";
header("location: /");
?>
