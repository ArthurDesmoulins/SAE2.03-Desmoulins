let HOST_URL = "https://mmi.unilim.fr/~desmoulins9/SAE2.03-Desmoulins/";

let DataMovie = {};

 /**
     * Fetches data from the server based on the specified day.
     *
     * @param {*} fdata - The day parameter to be sent to the server.
     * @returns The response from the server.
     * 
     * DataMenu.request permet de récupérer des données depuis le serveur.
     * Elle prend en paramètre un jour (lundi mardi...) de la semaine et 
     * renvoie les données contenues dans la réponse du serveur (data).
     */

DataMovie.add = async function(fdata){
    let config = {
        method: "POST",
        body: fdata
    };
    let answer = await fetch(HOST_URL + "/server/script.php?todo=addMovie", config);
    let data = await answer.json();
    return data;
}

export {DataMovie};