let templateFile = await fetch("./component/NavBar/template.html");
let template = await templateFile.text();

const templateFile2 = await fetch("./component/NavBar/templateProfiles.html");
const templateProfile = await templateFile2.text();

let NavBar = {};

NavBar.format = function (hAbout) {
  let html = template;
  html = html.replace("{{hAbout}}", hAbout);
  return html;
};


export { NavBar };