import { DataMovie } from "../../data/dataMovie";

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

FilmCategory.formatMany = async function(categories) {
    let html = "";
    for(const cat of categories){
        const movies = await DataMovie.requestFilmCategory(cat.category);
        html += MoieCategory.format(cat.category, movies);
    }
    return html;
};



export { FilmCard };

