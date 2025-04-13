let templateFile = await fetch("./component/FormulaireProfilesChange/template.html");
let template = await templateFile.text();

let FormulaireProfilesChange = {};

FormulaireProfilesChange.format = function (handle){
  let html = template;
  html = html.replace('{{handle}}', handle);
  return html;
};

export {FormulaireProfilesChange};
