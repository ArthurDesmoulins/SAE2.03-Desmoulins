let templateFile = await fetch("./component/FilmInfo/template.html");
let template = await templateFile.text();

let FilmInfo = {};

FilmInfo.format = function (movie) {
  let html = template;
  html = html.replace("{{video}}", movie.trailer);
  html = html.replace("{{image}}", movie.image);
  html = html.replace("{{titre}}", movie.name);
  html = html.replace("{{date}}", movie.year);
  html = html.replace("{{age}}", movie.min_age);
  html = html.replace("{{time}}", movie.length);
  html = html.replace("{{desc}}", movie.description);
  html = html.replace("{{real}}", movie.director);
  return html;
};

export { FilmInfo };
