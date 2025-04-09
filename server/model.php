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
define("DBNAME", "desmoulins9");
define("DBLOGIN", "desmoulins9");
define("DBPWD", "desmoulins9");


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

function getFilmCategory($category) {

    if (empty($category)) {
        return false;
    }
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);

    $sql = "SELECT Movie.id, Movie.name, Movie.year, Movie.length, Movie.description, Movie.director, 
            Movie.image, Movie.trailer, Movie.min_age, Category.id AS category_id ,Category.name AS category
            FROM Movie JOIN Category ON Movie.id_category = Category.id 
            WHERE Category.id = :category";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':category', $category);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; 
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

function getProfiles(){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "select * from Profiles";
    $stmt = $cnx->prepare($sql);
    $stmt -> execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

