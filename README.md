# Site web du C.R.A.B.E.

Le site web du C.R.A.B.E. représente le club étudiant de vélo de l'École de technologie supérieure. Il utilise le CMS Grav pour gérer le contenu et les pages. Il remplace le système WordPress utilisé pour l'ancien site du C.R.A.B.E.

## Préréquis
### Configuration requise
* Visual Studio Code (VS Code)
* Git Bash

Si vous souhaitez exécuter Grav localement :
* PHP (>= 7.3.6)

Si vous utilisez Docker :
* Docker Desktop

Consultez la [documentation de Grav](https://learn.getgrav.org/17/basics/requirements) pour plus d'informations sur la configuration de Grav et d'un serveur web (dépend de votre machine).

## Configuration - Grav local uniquement
1. Téléchargez les fichiers de base de Grav depuis [https://getgrav.org/downloads](https://getgrav.org/downloads).
2. Extrayez le dossier `grav` dans l'emplacement de votre choix.
3. Ouvrez VS Code, puis le projet `grav`.
4. Ouvrez un terminal bash dans VS Code et naviguez vers le dossier `user`.
5. Clonez le projet Grav depuis Git à l'aide de la commande :
```
git clone https://github.com/ClubCedille/crabe.demo.prodv2.cedille.club.git .
```

> [!WARNING]  
> Si vous obtenez des erreurs d'autorisation (403), contactez Cédille (Club étudiant à l'ÉTS) en rejoignant leur Discord et en laissant un commentaire dans le fil `Site web C.R.A.B.E.` sous `Projets`.

## Lancement de l'application

Vous pouvez exécuter l'application en utilisant un de ces méthodes :

### 1. Grav
Depuis la racine du projet, exécutez la commande suivante pour lancer le serveur PHP intégré :
```
bin/grav server
```

Accédez au site web à l'adresse `localhost:8000`.

Le panneau d'administration est accessible à l'adresse `localhost:8000/admin`.

### 2. Docker
Construisez l'image Docker à l'aide de la commande suivante :
```
docker-compose up --build
```

Recréez les fichiers de configuration suivants dans le dossier de contenu, car ce sont des liens symboliques sur GitHub :
* git-sync.yaml
* security.yaml

Accédez au site à l'adresse `localhost:8080`.

Le panneau d'administration est accessible à l'adresse `localhost:8000/admin`.

## Développement
Lorsque vous travaillez sur le projet, il est recommandé de créer une nouvelle branche à l'aide de la commande suivante :
```
git checkout -b "nom_de_branche"
```

Les fichiers doivent être ajoutés en spécifiant le chemin du dossier ou du fichier. Voici un exemple de la façon de pousser plusieurs fichiers et dossiers :
```
git add themes README.md pages/05.equipe/team.md
git commit -m "ton message ici"
git push
```

> [!WARNING]  
> Deux fichiers de liens symboliques sous config ne doivent pas être poussés vers GitHub : `plugins/git-sync.yaml` et `security.yaml`. Pousser des mises à jour de ces fichiers vers GitHub fera planter le site lors de la fusion avec la branche principale (main), car ces fichiers sont des pointeurs vers ses données (que nous n'avons pas actuellement). Si ces fichiers changent, contactez Cédille pour appliquer les corrections.

Une fois que les modifications sont prêtes à être déployées sur le site web, créez un *pull request* sur GitHub.

## Déploiement

Une fois les modifications fusionnées dans la branche principale (main), naviguez vers la console du site (`crabe.etsmtl.ca/admin`) et effectuez une synchronisation Git manuelle.

## Remerciements
Développeur :
* Benjamin Mah - Capitaine du C.R.A.B.E. - [GitHub](https://github.com/benjaminm278)

Spécialistes DevOps :
* Julien Giguère - Co-capitaine de Cédille - [GitHub](https://github.com/JulienGiguere)
* Alexandre Baudouin Vegas - Capitaine de Cédille - [GitHub](https://github.com/alexvegas22)
* Jonathan Lopez - Ancien capitaine de Cédille - [GitHub](https://github.com/SonOfLope)
