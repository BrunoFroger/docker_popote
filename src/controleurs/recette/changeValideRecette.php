<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


session_start();

$myIncludePath = '/var/www/';
set_include_path(get_include_path() . PATH_SEPARATOR . $myIncludePath);

include_once 'modeles/recette/classe_recette.php';
include_once 'librairies/configuration/popote_conf.php';

//echo "<br> id recette => " . $_GET['id'];
//echo "<br> tag => " . $_GET['tag'];

$idRecette=$_GET['id'];
$tmpRecette=recette::NewById($idRecette);

if ($_GET['tag'] == 'oui'){
    //echo "<br> on devalide la recette";
    $tmpRecette->publication='0';
}  else {
    //echo "<br> on valide la recette";
    $tmpRecette->publication='1';
}

$tmpRecette->update($tmpRecette->id_recette,$tmpRecette->id_membre,$tmpRecette->titre,$tmpRecette->nb_pers,$tmpRecette->cat_prix,$tmpRecette->cat_diff,$tmpRecette->description,$tmpRecette->cuisson,$tmpRecette->preparation,$tmpRecette->conseil,$tmpRecette->id_cat,$tmpRecette->id_ss_cat,$tmpRecette->note,$tmpRecette->nb_votes,$tmpRecette->somme_notes,$tmpRecette->publication);

//echo "<br>on revient en page d'admin";
//echo "<br><a href=/popote/index.php>Continuer</a>";
header("location: /");
