let templateFile = await fetch("./component/FilmCard/template.html");
let template = await templateFile.text();

let FilmCard = {};

FilmCard.format = function (movie) {
  let html = template;
  html = html.replace("{{titre}}", movie.name);
  html = html.replace("{{img}}", movie.image);
  return html;
};

FilmCard.formatMany = function(data){
    let html = "";
    for(const movie of data){
        html += FilmCard.format(movie);
    }
    return html;
}

export { FilmCard };
