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

/*
  echo "<br> envoi d'un mail aux administrateurs du site";
  // recuperation de la liste des administrateurs
  $listAdmin=membre::getListAdmin();
  print_r($listAdmin);
 */

//smtp Olabs : smtp://10.194.112.86 (port 25)
//hostname : 
//smtp orange : smtp://smtp.orange.fr:465

$mailAddr = $_POST['monmail'];
echo "<br> user mail = $mailAddr";
if ($membre = membre::NewByEmail($mailAddr)) {
    echo "<br> membre trouvé <br>";
    print_r($membre);
    $madate=date('H:i:s');
    echo "<br>date = $madate";
    $subject = "Vos identifiants sur MaPopoteAuQuotidien.fr";
    $message = "Bonjour <br><br>"
            . "Vos identifiants de connexion sur notre site sont :<br>"
            . "login : $membre->login<br>"
            . "password : $membre->password<br><br>"
            . "Cordialement<br>"
            . "l'equipe Ma Popote Au Quotidien";
    file_put_contents("/tmp/mail.txt", "to: $mailAddr\n");
    file_put_contents("/tmp/mail.txt", "from: Ma Popote Au Quotidien <froger.popote@wanadoo.fr>\n", FILE_APPEND);
    file_put_contents("/tmp/mail.txt", "subject: $subject\n", FILE_APPEND);
    file_put_contents("/tmp/mail.txt", "$message\n", FILE_APPEND);

    //. " -e 'set smtp_url=\"smtp.orange.fr::465\"'"
    //. " -e 'set smtp_url=\"199.59.243.120::465\"'"
            //. " -e 'set ssl_starttls=yes'"
            //. " -e 'set smtp_url=\"smtp.orange.fr::465\"'"
            //. " -e 'set smtp_user=\"bruno.froger2\"'"
            //. " -e 'set smtp_pass=\"3paul2fan\"'"
            //. " -e 'set hostname=\"wanadoo.fr\"'"
    $cmd = "mutt -H - -n "
            . " -e 'set content_type=\"text/html\"'"
			. " -e 'set copy=no'"
            . " < /tmp/mail.txt";
    echo "<br> commande executee : $cmd";
    $ficMail = shell_exec("more /tmp/mail.txt");
    echo "<br> fichier mail : $ficMail";
    shell_exec($cmd);
    $_SESSION['mailEnvoye']='envoye';
} else {
    $_SESSION['mailOublieMessage'] = 'Adresse mail inconnue';
    
}
$_SESSION['emailSaisi']=$mailAddr;
//echo '<html><body><script type="text/javascript">alert("un mail avec vos identifiants vient de vous etre envoyé");</script></body></html>'; 
//echo "<a href=/popote/index.php>Continuer</a>";
header("location: /");
?>
