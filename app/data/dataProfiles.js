let HOST_URL = "https://mmi.unilim.fr/~desmoulins9/SAE2.03-Desmoulins";
let DataProfiles = {};

DataProfiles.read = async function () {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readprofiles");
    let data = await answer.json();
    return data;
  };
export { DataProfiles };