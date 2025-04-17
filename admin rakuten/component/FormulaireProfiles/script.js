let templateFile = await fetch("./component/FormulaireProfiles/template.html");
let template = await templateFile.text();

let FormulaireProfiles = {};

FormulaireProfiles.format = function (handler){
  let html = template;
  html = html.replace('{{handler}}', handler);
  return html;
};

export {FormulaireProfiles};
