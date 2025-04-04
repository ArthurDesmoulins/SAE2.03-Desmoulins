let templateFile = await fetch("./component/Formulaire/template.html");
let template = await templateFile.text();

let Formulaire = {};

Formulaire.format = function (handler){
  let html = template;
  html = html.replace('{{handler}}', handler)
  return html;
};

export { Formulaire };
