let templateFile = await fetch("./component/FilmCategory/template.html");
let template = await templateFile.text();


let FilmCategory = {};

FilmCategory.format = function (category) {
  let html = template;
  html = html.replace("{{title}}", category.name);

  let html2 = Movie.format(category.movies || [])
  html = html.replace("{{gridcard}}", html2)
  return html;
};



export { FilmCard };

