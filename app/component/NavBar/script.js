let templateFile = await fetch("./component/NavBar/template.html");
let template = await templateFile.text();

let NavBar = {};

NavBar.format = function (hHome, profiles) {
    let html = template;
    html = html.replace("{{hHome}}", hHome);
    html = html.replace("{{profileOptions}}", NavBar.profilesOptions(profiles));
    const defaultImage = "https://mmi.unilim.fr/~cakir4/SAE2.03-Huzeyfe_ckr/server/images/image-avatar.webp";
    html = html.replace("{{imageURL}}", defaultImage);
    html = html.replace("{{initialClass}}", "hidden");
    
    return html;
};

NavBar.profilesOptions = function (profiles) {
    let html = "";
    if (profiles && profiles.length > 0) {
        html += '<option value="">Sélectionner un profil</option>';
        for (const obj of profiles) {
            html += `<option value="${obj.id}" data-avatar="${obj.image}">${obj.name}</option>`;
        }
    }
    return html;
}

export { NavBar };