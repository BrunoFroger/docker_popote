<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

session_start();
$myIncludePath = '/var/www';
set_include_path(get_include_path() . PATH_SEPARATOR . $myIncludePath);

include_once ('modeles/membre/classe_membre.php');

if (isset($_POST['login'])) {
    //echo "<p>on recupere les param du POST</p>";
    $new_login = $_POST['login'];
    $_SESSION['loginSaisi'] = $new_login;
    //echo "<p>new login = $new_login  ; </p>";
    $new_password = $_POST['pwd'];
    //echo "<p>new password = $new_password  ; </p>";
    $membre = membre::NewByLogin($new_login);
    if ($membre->login != $new_login) {
        $_SESSION['loginMessage'] = "Login inconnu";
        exit;
    } else if ($membre->password != $new_password) {
        //echo "<p> Password invalide</p>";
        $_SESSION['loginMessage'] = "Password Invalide";
    } else if ($membre->valid != '1') {
        $_SESSION['loginMessage'] = "Login devalidé, veuillez contacter l'administrateur";
    } else {
        $_SESSION['membre'] = serialize($membre);
        $_SESSION['typeUser'] = $membre->type;
        //echo "<p>Bienvenue $membre->prenom $membre->nom </p>";
        /* if ($membre->type == "admin") {
          echo "<p>Vous etes administrateur</p>";
          } */
        $_SESSION['typeContenu'] = 'recette';
        $_SESSION['typeCommentaire'] = 'affichage';
    }
    header("location: /");

    //echo "<a href=index.php>Continuer</a>";
}
?>
