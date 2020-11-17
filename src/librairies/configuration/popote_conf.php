<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
DEFINE ('SERVEUR', 'mysql:host=database;dbname=popote;charset=utf8');
DEFINE ('USER', getenv("MYSQL_USER"));
DEFINE ('PWD', getenv("MYSQL_PASSWORD"));
DEFINE ('T_MEMBRES', 'membres');
DEFINE ('T_RECETTES', 'recettes');
DEFINE ('NBRECETTEPARPAGE', '10');

//echo ("<BR>SERVEUR = ");
//echo SERVEUR;
//echo ("<BR>USER = ");
//echo USER;
//echo ("<BR>PWD = ");
//echo PWD;

//echo '<p>fichier de configuration charge </p>';

?>
