<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

$myIncludePath = '/var/www/';
set_include_path(get_include_path() . PATH_SEPARATOR . $myIncludePath);

include_once 'modeles/membre/classe_membre.php';

$_SESSION['typeContenu'] = 'admin';

$delId = $_GET['id'];
echo "<br> id recupere : $delId";
$delMembre = membre::NewById($delId);

if (isset($_SESSION['membre'])) {
    // une session existe on recupere le membre dans la session
    $membre = unserialize($_SESSION['membre']);
    if ($membre->id_membre == $delId) {
        echo "<br> Impossible de supprimer le membre connecte";
        echo "<br> <a href=/popote/index.php>Continuer</a>";
        exit;
    }
}

echo "<br>supression du membre $delMembre->login";
if ($delMembre->delete() == null) {
    echo "<br>Une erreur s'est produite lors de la suppression de ce user ";
    echo "<br> il reste sans doute des donnees a ce user";
    echo "<br> <a href=/popote/index.php>Continuer</a>";
    exit;
}

//echo "<br>on sort de deleteuser.php <br>";
//echo "<a href=/popote/index.php>Continuer</a>";
header("location: /");
?>
