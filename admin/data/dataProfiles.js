let HOST_URL = "https://mmi.unilim.fr/~desmoulins9/SAE2.03-Desmoulins/";

let DataProfiles = {};

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
DataProfiles.add = async function(fdata){
    let config = {
        method: "POST",
        body: fdata
    };
    let answer = await fetch(HOST_URL + "/server/script.php?todo=addprofiles", config);
    let data = await answer.json();
    return data;
}

DataProfiles.change = async function(id, namechange, agechange, imagechange) {
    const formData = new FormData();
    formData.append("id", id);
    formData.append("name", namechange);
    formData.append("age", agechange);
    formData.append("image", imagechange);

    let config = {
        method: "POST",
        body: formData
    };

    let answer = await fetch(HOST_URL + "/server/script.php?todo=changeprofiles", config);
    let data = await answer.json();
    return data;
};

export {DataProfiles};




