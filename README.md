# Les-pays-en-chiffres

# Description
Le but de ce code est d'analyser les données de population des différents pays.

# Prérequis 
  - Une instance ElephantSQL
  - Les fichiers SQL présent sur le repository
  
# Initialisation
- Dans la section "Browser" dans Elephant SQL, il faudra ouvrir le fichier create_table.sql et y copier son contenu.
- Ensuite, il faudra également executer le contenu du fichier fonctions.sql dans le Browser d'ElephantSQL.
- Enfin, executer le contenu du fichier add_countries.sql.

# Utilisation
Pour appeler les différentes fonction, il faudra entrer une des commandes suivantes dans le Browser d'ElephantSQL.

  - Pour afficher les données concernant un pays choisi :
    ```sql
    SELECT * FROM countries('le pays de votre choix ici');
    ```
    
  - Pour ajouter un pays ayant une population et une densité aléatoire :
    ```sql
    CALL add_country('le nom de la nouvelle ville ici');
    ```
    
  - Pour afficher tous les pays et leur classes de densité :
    ```sql
    SELECT * FROM class_countries();
    ```
    
  - Pour afficher un pays en particulier et sa classe de densité :
    ```sql
    SELECT * FROM class_country('le pays de votre choix ici');
    ```
