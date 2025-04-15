let HOST_URL = "..";
let DataProfiles = {};

DataProfiles.read = async function () {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readprofiles");
    let data = await answer.json();
    return data;
  };
export { DataProfiles };