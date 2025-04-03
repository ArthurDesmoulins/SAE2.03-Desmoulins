let templateFile = await fetch("./component/Formulaire/template.html");
let template = await templateFile.text();

let FilmCard = {};

FilmCard.format = function (movie) {
  let html = template;
  return html;
};

export { FilmCard };
