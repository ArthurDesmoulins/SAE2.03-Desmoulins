Pour l'ittération 1 on utilise les tables déjà générer, pas besoin de changer. On utilise une requete SQL pour pouvoir lire les informations des films: "select \* from Movie"

Pour l'itteration 2, on utilise une requete pour ajouter des films à la table: "REPLACE INTO Movie (name, year, length, description, director, id_category, image, trailer, min_age)
VALUES (:name, :year, :length, :description, :director, :id_category, :image, :trailer, :min_age)"

Pour l'itteration 3 on fait la meme commande que la 1 pour récuperer toute les infos du films et pouvoir les afficher.

Pour l'itteration 4, on utilise la table Category où l'on récupère les informations: "select _ from Category". Et on trie les films par categories: "SELECT Movie._, Category.name AS category
FROM Movie
JOIN Category ON Movie.id_category = Category.id
WHERE Category.id = :category
ORDER BY Movie.name ASC"

Pour l'ittération 5 on rajoute une nouvelle table, la table Profiles qui permet de prendre en compte les profils ajouté, leur nom et leur age afin de pouvoir trier en conséquence: "select \* from Profiles".

Pour l'ittération 6, on doit ajouter des nouveaux profils: "INSERT INTO Profiles (name, image, age) VALUES (:name, :image, :age)"

Pour l'ittération 7 on rajoute l'âge en parametre pour trier les categories: "SELECT Movie.\*, Category.name AS category
FROM Movie
JOIN Category ON Movie.id_category = Category.id
WHERE Category.id = :category
AND Movie.min_age <= :age"
