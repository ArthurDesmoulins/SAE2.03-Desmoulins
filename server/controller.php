    <?php

    /** ARCHITECTURE PHP SERVEUR  : Rôle du fichier controller.php
     * 
     *  Dans ce fichier, on va définir les fonctions de contrôle qui vont traiter les requêtes HTTP.
     *  Les requêtes HTTP sont interprétées selon la valeur du paramètre 'todo' de la requête (voir script.php)
     *  Pour chaque valeur différente, on déclarera une fonction de contrôle différente.
     * 
     *  Les fonctions de contrôle vont éventuellement lire les paramètres additionnels de la requête, 
     *  les vérifier, puis appeler les fonctions du modèle (model.php) pour effectuer les opérations
     *  nécessaires sur la base de données.
     *  
     *  Si la fonction échoue à traiter la requête, elle retourne false (mauvais paramètres, erreur de connexion à la BDD, etc.)
     *  Sinon elle retourne le résultat de l'opération (des données ou un message) à includre dans la réponse HTTP.
     */

    /** Inclusion du fichier model.php
     *  Pour pouvoir utiliser les fonctions qui y sont déclarées et qui permettent
     *  de faire des opérations sur les données stockées en base de données.
     */
    require("model.php");

    function readMoviesController(){
        $movies = getAllMovies();
        return $movies;
    }

    function addMoviesController(){
        $name = $_REQUEST['name'];
        $year = $_REQUEST['year'];
        $length = $_REQUEST['length'];
        $description = $_REQUEST['description'];
        $director = $_REQUEST['director'];
        $id_category = $_REQUEST['id_category'];
        $image = $_REQUEST['image'];
        $trailer = $_REQUEST['trailer'];
        $min_age = $_REQUEST['min_age'];

        if ($name && $year && $length && $description && $director && $id_category && $image && $trailer && $min_age)
        $ok = addMovies($name, $year, $length, $description, $director, $id_category, $image, $trailer, $min_age);
        if($ok != 0){
            return "Le film $name a bien été ajouté à la base de donnée";
        }
    else{
        return "Il manque un champ à remplir pour valider le film";
    }
    }

    function addProfilesController(){
        $name = $_REQUEST['name'];
        $age = $_REQUEST['age'];
        $image = $_REQUEST['image'];

        if ($name && $age && $image)
        $ok = addProfiles($name, $age, $image);
        if($ok != 0){
            return "Le profil $name a bien été ajouté à la base de donnée";
        }
    else{
        return "Il manque un champ à remplir pour valider le profil";
    }
    }

    function watchMoviesController(){
        $id = $_REQUEST['id'];
        $movie = watchMovies($id);
        return $movie;
    }

    function readCategoryController(){
        $category = getAllCategory();
        if($category != 0){
            return $category;
        } else{
            return "Erreur, les categories ne sont pas résupéré";
        }
    }

    function readFilmCategoryController(){
        $id = $_REQUEST["category"];
    $movies = getFilmCategory($id);
    return $movies;
    }

    function readProfilesController(){
        $profiles = getProfiles();
        return $profiles;
    }

    function readMoviesByAgeController($age){
    $movies = getMoviesByAge($age);
    if(empty($movies)){
        return ["message" => "Aucun film disponible pour votre tranche d'âge."];
    }
    return $movies;
}