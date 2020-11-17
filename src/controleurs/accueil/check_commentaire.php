<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


session_start();
$myIncludePath = '/var/www/';
set_include_path(get_include_path() . PATH_SEPARATOR . $myIncludePath);

include_once 'modeles/commentaire/classe_commentaire.php';
include_once 'librairies/configuration/popote_conf.php';

// on impose de retourner sur la meme recette
$_SESSION['id_recette'] = $_GET['recette'];
$membre = $_GET['membre'];
//echo" <br> la recette de retour est : ".$_SESSION['id_recette'];
//echo "<br> on entre dans check commentaire";
switch ($_SESSION['typeCommentaire']) {
    case 'affichage':
        // on etait en mode affichage on a cliqué sur le bouton modification
        $_SESSION['typeCommentaire'] = 'modification';
        //echo "<br> on etait en affichage, on passe en modification";
        break;
    case 'modification':
        // on etait en mode modification,on a cliqué sur le bouton validation
        // on recupere la saisie dans le formulaire
        if (isset($_POST['commentajout'])) {
            $saisie = $_POST['commentajout'];
            echo "<BR> valeur du post modifie : " . $saisie;
        } else {
            $saisie = $_SESSION['commentaire'];
            echo "<BR> pas de modif du post d'origine : " . $saisie;
        }
        $_SESSION['typeCommentaire'] = 'affichage';
        echo "<br> on etait en modification, on passe en affichage";
        if ($saisie != "") {
            // faire update du commentaire dans la base avec la valeur de $saisie
            if ($_SESSION['idComment'] == "") {
                // pas de commentaire pour cette recette, on la cree en base
                echo "<br> creation en base";
                $tmp = new commentaire();
                $tmp->create($_SESSION['id_recette'], $membre, $saisie);
            } else {
                // un commentaire existe, on update
                echo "<br> modification du commentaire en base";
                $tmp = commentaire::NewById($_SESSION['idComment']);
                $tmp->update($tmp->id_commentaire, $tmp->id_recette, $tmp->id_membre, $saisie);
            }
        } else {
            echo "<br> la saisie est vide, on ne touche pas a la base de donnees";
        }
        break;
    default:
        echo "<br> rien de positonne, on passe en affichage";
        $_SESSION['typeCommentaire'] = 'affichage';
        break;
}

//echo "<br>on sort de check commentaire.php <br>";
//echo "<a href=/popote/index.php>Continuer</a>";
header("location: /");



