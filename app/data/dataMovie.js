
// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "https://mmi.unilim.fr/~desmoulins9/SAE2.03-Desmoulins/";
let DataMovie = {};

 /**
     * Fetches data from the server based on the specified day.
     *
     - The day parameter to be sent to the server.
     * @returns The response from the server.
     * 
     * DataMenu.request permet de récupérer des données depuis le serveur.
     * Elle prend en paramètre une semaine (1, 2, ..., 52) et un jour (lundi mardi...)
     * renvoie les données contenues dans la réponse du serveur (data).
     */
DataMovie.request = async function(){
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readmovies");
    let data = await answer.json();
    return data;
}

DataMovie.info = async function(id){
    let answer = await fetch(HOST_URL + "/server/script.php?todo=watchmovies&id=" + id);
    let data = await answer.json();
    return data;
}

export {DataMovie};