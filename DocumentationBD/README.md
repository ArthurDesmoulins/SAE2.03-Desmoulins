Pour l'ittération 1 on utilise les tables déjà générer, pas besoin de changer. On utilise une requete SQL pour pouvoir lire les informations des films: "select \* from Movie" Les tables Movie et Category sont relier avec deux bornes 1,n et 1,1 car un film doit appartenir au minimum à 1 category et au maximum à 1 category. Mais une categorie peut avoir au minimum aucun film dedans et peut en avoir au maximum plusieurs.

Pour l'itteration 2, on utilise une requete pour ajouter des films à la table: "REPLACE INTO Movie (name, year, length, description, director, id_category, image, trailer, min_age)
VALUES (:name, :year, :length, :description, :director, :id_category, :image, :trailer, :min_age)"

Pour l'itteration 3 on fait la meme commande que la 1 pour récuperer toute les infos du films et pouvoir les afficher.

Pour l'itteration 4, on utilise la table Category où l'on récupère les informations: "select _ from Category". Et on trie les films par categories: "SELECT Movie._, Category.name AS category
FROM Movie
JOIN Category ON Movie.id_category = Category.id
WHERE Category.id = :category
ORDER BY Movie.name ASC"

Pour l'ittération 5 on rajoute une nouvelle table, la table Profiles qui permet de prendre en compte les profils ajouté, leur nom et leur age afin de pouvoir trier en conséquence: "select \* from Profiles". Les tables Movie et Profiles sont relier avec deux bornes 1,n car un film peut appartenir au minimum à 0 profils et au maximum à plusieurs profils. Mais un profil peut avoir au minimum aucun film dedans et peut en avoir au maximum plusieurs.

Pour l'ittération 6, on doit ajouter des nouveaux profils: "INSERT INTO Profiles (name, image, age) VALUES (:name, :image, :age)"

Pour l'ittération 7 on rajoute l'âge en parametre pour trier les categories: "SELECT Movie.\*, Category.name AS category
FROM Movie
JOIN Category ON Movie.id_category = Category.id
WHERE Category.id = :category
AND Movie.min_age <= :age"

Pour l'ittération 8 on doit modifier les profils existants avec une formule comme celle-ci: "UPDATE Profiles SET name=:name, image=:image, age=:age WHERE id=:id".

Début de l'ittération 9: on créé une nouvelle table pour pouvoir gérer les films mis en favorits. On créer ensuite trois fonction pour
ajouter un favoris: "INSERT IGNORE INTO Favorites (id_profile, id_movie) VALUES (:id_profile, :id_movie)",
récuperer tous les favoris: "SELECT Movie.\* FROM Movie
JOIN Favorites ON Movie.id = Favorites.id_movie
WHERE Favorites.id_profile = :id_profile"
et vérifier si un film est déjà dans les favoris d’un profil utilisateur:
"SELECT COUNT(\*) FROM Favorites WHERE id_profile = :id_profile AND id_movie = :id_movie"
Dans cette table on met en parametre l'id_profile et l'id_movie afin d'associer chaque film mis en favorits avec el profil qui l'a mis et pas avoir des favorits commun pour tous les profils.
Entre la table Movie et Favorites on a: 0,1 et 0,n car un film peut être en favorit et peut ne pas l'être, c'est binaire. Et il peut y avoir au minimum aucun film en favorit et au maximum plusieurs.
Entre la table Profiles et Favorites on a: 0,n et 0,n car un profil peut avoir 0 favorit et peut en avoir au maximum plusieurs. Et il peut y avoir au minimum aucun favorit dans un profil et au maximum plusieurs.
