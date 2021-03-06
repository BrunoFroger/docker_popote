<?php
header('content-type: text/html; charset=uft-8');
//session_destroy();
//$membre = membre::NewByLogin('bte');
//$membre = membre::NewByLogin('bfr');
//$_SESSION['membre'] = serialize($membre);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr"><head>
        <!--meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>
                Ma Popote Au Quotidien
            </title>
            <link rel="stylesheet" type="text/css" href="vues/css/contenu.css" media="all">
                </head>

                <body>

                    <div id="global">
                        <div id="entete">
                            <a href="controleurs/accueil/resetSession.php"><h1>MaPopoteAuQuotidien.fr</h1></a>
                            <div id="connect">
                                <p> Bonjour </p>
                                <p> <?php include_once 'controleurs/accueil/bonjour.php'; ?></p>
                            </div><!-- #connect -->
                        </div><!-- #entete -->

                        <div id="menu">
                            <ul>
                                <?php include_once 'controleurs/accueil/menu.php'; ?>
                            </ul>
                        </div><!-- #menu -->	


                        <div id="contenu"> <!-- #cadre descriptif recette -->
                            <!-- ==================================================================================================== -->                            
                            <!-- Saisie de la liste des ingredients & quantité de la nouvelle  -->               
                            <!-- Etape 2 : proposer les ingrédients existants et si ingrédient pas dans la liste alors bouton "autre"  -->
                            <!-- puis saisir les quantités pour l'ingrédient saisi -->
                            <!-- afficher les ingrédients et quantités sous forme de table -->
                            <!-- qd saisie liste ingrédient terminée alors "bouton" étape suivante -->

                            <div class='cadretitre'>
                                <h1> Afficher la variable [titre de la recette] </h1>
                                <p> Création de la liste de ingrédients </p>
                            </div>         
                            <div id='newlisteingredient'>
                                <div id='ajoutunitaire'>
                                    <form id='newingredient' action='saisielisteingredient.php'> 
                                        <fieldset>
                                            <legend><strong>Saisir un ingrédient</strong></legend>
                                            Ingrédient : <input list='modeleingredient' >
                                                <datalist id='modeleingredient'>
                                                    <option value='sucre'>sucre</option> 
                                                    <option value='farine'>farine</option> 
                                                    <option value='beurre'>beurre </option> 
                                                </datalist>
                                                Quantité : <input type='text' id='saisieqte'>
                                                    <button type="submit" value="Ajouter"> Ajouter</button>
                                                    </fieldset>
                                                    </form> 
                                                    </div>
                                                    <!-- recuperation de la liste des ingredients -->
                                                    <div class = 'affichetableingredientsaisi'> 
                                                        <table>
                                                            <tr>
                                                                <th> Ingrédient </th>
                                                                <th> Quantité </th>
                                                            </tr>
                                                            <tr>
                                                                <td>ingredient 1</td>
                                                                <td>qte 1</td>
                                                            </tr>
                                                            <tr>
                                                                <td>ingredient 2</td>
                                                                <td>qte 2</td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    </div> <!-- newlisteingredient -->
                                                    <div id='etapesuivante'>
                                                        <p>Pour passer à l'étape suivante 
                                                            <button type='submit' id='nextstep'>Suite</button> </p>
                                                    </div> <!-- #etapesuivante --> 

                                                    </div><!-- #contenu -->

                                                    <!-- ---------------------- zone des commentaires membres ------------ -->
                                                    <div id='commentaire'>
                                                        <?php include_once 'controleurs/accueil/commentaires.php'; ?>
                                                    </div>
                                                    <!-- ---------------------- fin zone des commentaires membres-------- --> 



                                                    <div id='footer'>
                                                        <h1>pied-de-page</h1>
                                                    </div><!-- #pied-de-page -->

                                                    </div><!-- #global -->



                                                    </body></html>
