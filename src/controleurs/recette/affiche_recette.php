<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if (isset($_SESSION['id_recette'])) {
    // on recupere l'ide de recette dans la session
    $recette = recette::NewById($_SESSION['id_recette']);
} else {
    // on cherche un id recette au hasard  
    $maListeRecette = recette::getListId();
    $recetteAleatoire = array_rand($maListeRecette, 1);
    //echo "<br>";
    //print_r($recetteAleatoire);
    $recette = recette::NewById($maListeRecette[$recetteAleatoire]);
    //echo "<br>";
    //print_r($recette);
}

if (isset($_SESSION['membre'])) {
    $membre = unserialize($_SESSION['membre']);
} else {
    $membre = null;
}

echo "<div id = 'P0navgauche'>";
// recuperation de la photo
$maPhoto = photo::NewByRecetteId($recette->id_recette);
if ($maPhoto == null){
	$affPhoto="recette.jpeg";
}else{
	$affPhoto=$maPhoto->lien;
}
echo "<div id = 'P0image' > ";
//echo "<div id = 'P0image' style='height:100% width:100%'> ";
//echo "<p> zone image</p> ";
//print_r($maPhoto);
echo "<img src='librairies/photos/$affPhoto' id='imagerecetteXL'>";
echo "</div>";
$auteur = membre::NewById($recette->id_membre);
echo "<div id='P0note'>"
 . "Recette publiée par : <span class='P0span'> $auteur->login</span>"
 . "<br>Lui envoyer un <a href='controleurs/membre/selectEnvoiMail.php?recette=$recette->id_recette&user=$auteur->login'>mail</a>"
 . "<br>Note : $recette->note"
 . "<br>Nombre de vote : $recette->nb_votes"
 . "<br>Voter : <a href=controleurs/recette/voterRecette.php?id=$recette->id_recette&note=0><button class='petitcaractere'> 0 </button></a>"
 . "<a href=controleurs/recette/voterRecette.php?id=$recette->id_recette&note=1><button class='petitcaractere'> 1 </button></a>"
 . "<a href=controleurs/recette/voterRecette.php?id=$recette->id_recette&note=2><button class='petitcaractere'> 2 </button></a>"
 . "<a href=controleurs/recette/voterRecette.php?id=$recette->id_recette&note=3><button class='petitcaractere'> 3 </button></a>"
 . "<a href=controleurs/recette/voterRecette.php?id=$recette->id_recette&note=4><button class='petitcaractere'> 4 </button></a>"
 . "<a href=controleurs/recette/voterRecette.php?id=$recette->id_recette&note=5><button class='petitcaractere'> 5 </button></a>";

if ($membre != null) {
    echo "<br> Recettes préférées : ";
    // on verifie si cette recette est dans la liste des preferee de ce membre
    $preferee=preferee::check($recette->id_recette, $membre->id_membre);
    //print_r($preferee);
    if ($preferee != null) {
        // cette recette est dans les preferees, on la retire 
        echo "<a href=controleurs/recette/gerePreferee.php?id=$recette->id_recette&membre=$membre->id_membre&action=retirer&idPref=$preferee->id_preferee><button class='petitcaractere'>oui</button></a>";
    } else {
        // cette recette n'est pas dans les preferees on l'ajoute
        echo "<a href=controleurs/recette/gerePreferee.php?id=$recette->id_recette&membre=$membre->id_membre&action=ajouter><button class='petitcaractere'>non</button></a>";
    }
}
echo "</div>";
echo "<div id='P0pub'>";
echo "<br>";
echo "Publicité";
echo "<br>";
echo "<br>";
echo "</div>";
echo "</div> <!--fin nav gauche -->";
echo "<div id='P0navdroite'>";
echo "<div id = 'P0titre'><strong> $recette->titre</strong></div>";
echo "<div id = 'P0nav'>";
// recuperation de la liste des ingredients
$listIngredients = ingredient::GetListId($recette->id_recette);
echo "<div id = 'P0ingredients'> ";
echo "<table id='P0tablistingr'>";
foreach ($listIngredients as $ingredient) {
    //echo "<br> ingredient ";
    //print_r($ingredient);
    echo "<tr>";
    echo "<td>$ingredient[nom]</td>";
    echo "<td>: $ingredient[quantite]</td>";
    echo "</tr>";
}
echo "</table>";
echo "</div>";
echo " <div id='P0affichetemps'> ";
echo "<table>";
echo "<tr>";
echo " <td colspan='2'>Cette recette pour $recette->nb_pers personne(s)</td> ";
echo "<tr>";
echo "<td>Temps de préparation </td>";
echo "<td>: $recette->preparation</td>";
echo "</tr>";
echo "<tr>";
echo "<td>Temps de cuisson  </td>";
echo "<td>: $recette->cuisson</td>";
echo "</tr>";
echo "</table>";
echo "</div>";
echo "<div id = 'P0categories'>";
echo "<table>";
echo "<tr>";
echo "<td>Catégorie </td>";
$categorie = categorie::NewById($recette->id_cat);
echo "<td>: $categorie->nom</td>";
echo "</tr>";
echo "<tr>";
echo "<td>Sous-catégorie </td>";
$sous_categorie = sous_categorie::NewById($recette->id_ss_cat);
echo "<td>: $sous_categorie->nom</td>";
echo "</tr>";
echo "<tr>";
echo "<td>Difficulté </td>";
echo "<td>: $recette->cat_diff</td>";
echo "</tr>";
echo "<tr>";
echo "<td>Coût </td>";
echo "<td>: $recette->cat_prix</td>";
echo "</tr>";
echo "</table>";
echo "</div>";

echo "</div> <!--fin nav -->";
echo "<div id = 'P0preparation'> <p> $recette->description </p> </div>";

echo "<div id = 'P0conseil'> <p> $recette->conseil </p> </div>";
echo "</div> <!--fin navdroite -->";
?>
