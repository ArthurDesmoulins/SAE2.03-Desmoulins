<?php
/**
 * Ce fichier contient toutes les fonctions qui réalisent des opérations
 * sur la base de données, telles que les requêtes SQL pour insérer, 
 * mettre à jour, supprimer ou récupérer des données.
 */

/**
 * Définition des constantes de connexion à la base de données.
 *
 * HOST : Nom d'hôte du serveur de base de données, ici "localhost".
 * DBNAME : Nom de la base de données
 * DBLOGIN : Nom d'utilisateur pour se connecter à la base de données.
 * DBPWD : Mot de passe pour se connecter à la base de données.
 */
define("HOST", "localhost");
define("DBNAME", "SAE203");
define("DBLOGIN", "usersae203");
define("DBPWD", "09Village09!");


function getAllMovies(){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "select * from Movie";
    $stmt = $cnx->prepare($sql);
    $stmt -> execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function addMovies($n, $y, $l, $d1, $d2, $idc, $i, $t, $m){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "REPLACE INTO Movie (name, year, length, description, director, id_category, image, trailer,  min_age)
            VALUES (:name, :year, :length, :description, :director, :id_category, :image, :trailer, :min_age)";
    $stmt = $cnx->prepare($sql); 
    $stmt->bindParam(':name', $n);
    $stmt->bindParam(':year', $y);
    $stmt->bindParam(':length', $l);
    $stmt->bindParam(':description', $d1);
    $stmt->bindParam(':director', $d2);
    $stmt->bindParam(':id_category', $idc);
    $stmt->bindParam(':image', $i);
    $stmt->bindParam(':trailer', $t);
    $stmt->bindParam(':min_age', $m);
    $stmt->execute();
    $res = $stmt->rowCount(); 
    return $res;
}

function watchMovies($id){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT Movie.id, Movie.name, Movie.year, Movie.length, Movie.description, Movie.director, Movie.image, Movie.trailer, Movie.min_age, Movie.id_category, Category.name AS category FROM Movie JOIN Category ON Movie.id_category = Category.id WHERE Movie.id=:id";
    $stmt = $cnx->prepare($sql);
    $stmt -> bindParam(':id', $id);
    $stmt -> execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function getAllCategory(){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "select * from Category";
    $stmt = $cnx->prepare($sql);
    $stmt -> execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function getFilmCategory($category, $age = null) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    
    if ($age == null) {
        $sql = "SELECT Movie.*, Category.name AS category 
                FROM Movie 
                JOIN Category ON Movie.id_category = Category.id 
                WHERE Category.id = :category
                ORDER BY Movie.name ASC";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':category', $category);
    } else {
        $sql = "SELECT Movie.*, Category.name AS category 
                FROM Movie 
                JOIN Category ON Movie.id_category = Category.id 
                WHERE Category.id = :category 
                AND Movie.min_age <= :age";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':category', $category);
        $stmt->bindParam(':age', $age);
    }
    
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function addProfiles($name, $image, $age){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "INSERT INTO Profiles (name, image, age) VALUES (:name, :image, :age)";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':image', $image);
    $stmt->bindParam(':age', $age);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function changeProfiles($id, $name, $image, $age){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "UPDATE Profiles SET name=:name, image=:image, age=:age WHERE id=:id";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':image', $image);
    $stmt->bindParam(':age', $age);
    $stmt->execute();
    $res = $stmt->rowCount(); 
    return $res;
 
}

function getProfiles(){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "select * from Profiles";
    $stmt = $cnx->prepare($sql);
    $stmt -> execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function addFavorite($id_profile, $id_movie) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "INSERT IGNORE INTO Favorites (id_profile, id_movie) VALUES (:id_profile, :id_movie)";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_profile', $id_profile);
    $stmt->bindParam(':id_movie', $id_movie);
    $stmt->execute();
    return $stmt->rowCount();
}

function getFavorites($id_profile) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT Movie.* FROM Movie 
            JOIN Favorites ON Movie.id = Favorites.id_movie 
            WHERE Favorites.id_profile = :id_profile";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_profile', $id_profile);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function isMovieInFavorites($id_profile, $id_movie) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT COUNT(*) FROM Favorites WHERE id_profile = :id_profile AND id_movie = :id_movie";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_profile', $id_profile);
    $stmt->bindParam(':id_movie', $id_movie);
    $stmt->execute();
    return $stmt->fetchColumn() > 0;
}

