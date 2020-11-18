# docker_popote
Creation d'un site de recettes de cuisine utilisant Docker

# Structure des fichiers
- repertoire "docker" : contient l'ensemble des fichiers nécessaires a la création des conteneurs pour créer une instance de l'application dans docker avec docker-compose

- répertoire "src" : contient tous les fichiers source PHP pour générer les pages Web du site popote

- la base de données de référence doit être stockée dans le répertoire database/popote.sql

# Génération des conteneurs
Chargez l'ensemble des fichiers de cette application sur une machine sur laquelle Docker est installé.
Aller dans le répertoire docker de cette application et lancer la commande suivante :

	docker-compose up -d --build
	
si tout se passe bien vous devriez avoir ces lignes a la fin de la génération de vos images docker

	
	Starting docker_database_1 ... done
	Starting docker_php-fpm_1  ... done
	Starting docker_nginx_1    ... done
	
# Execution de l'application
il ne vous reste plus qu'a lancer l'application Web dans votre navigateur avec l'adresse suivante : 
	
	http://<adresse IP de votre serveur Docker>:8080
	
	
# Paramétrage
Certains paramètres de cette application sont modifiables pour s'adapter a vos contraintes d'environnement :

- Port d'écoute (8080 par défaut) : 
	- Fichier : docker/docker-compose.yml
	- Ligne a modifier (nginx:ports) : Changer la ligne 8080:80 avec la valeur du port que vous souhaitez utiliser
-  Fichier d'initialisation de la base de données
	- Fichier : docker/database/popote.sql
	- remplacer ce fichier par un fichier d'import SQL correspondant aux données que vous voulez prendre en référence
