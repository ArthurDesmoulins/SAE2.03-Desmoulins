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

function addMovie($n, $y, $l, $d1, $d2, $idc, $i, $t, $m){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "INSERT INTO Movie (name, year, lenght, description, director, id_categorie, image, trailer,  min_age)
            VALUES (:name, :year, :lenght, :description, :director, :id_categorie, :image, :trailer, :min_age)";
    $stmt = $cnx->prepare($sql); 
    $stmt->bindParam(':name', $n);
    $stmt->bindParam(':year', $y);
    $stmt->bindParam(':lenght', $l);
    $stmt->bindParam(':description', $d1);
    $stmt->bindParam(':id_categorie', $idc);
    $stmt->bindParam(':image', $i);
    $stmt->bindParam(':trailer', $t);
    $stmt->bindParam(':min_age', $m);
    $stmt->execute();
    $res = $stmt->rowCount(); 
    return $res;
}
