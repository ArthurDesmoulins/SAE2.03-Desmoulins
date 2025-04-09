import { FilmCard } from "../FilmCard/script.js";
import { DataMovie } from "../../data/dataMovie.js";

let templateFile = await fetch("./component/FilmCategory/template.html");
let template = await templateFile.text();




let FilmCategory = {};

FilmCategory.format = function(category,movies) {
    let html = template;
    html = html.replace("{{category}}", category);
  
    let html1 = FilmCard.formatMany(movies);
    html = html.replace("{{movies}}", html1);
    return html
};


FilmCategory.formatMany = async function(categories){
    let html = "";
    for (const obj of categories) {
      let movies = await DataMovie.requestFilmCategory(obj.id);
      if (movies.length === 0){
        continue
      }
      else{
        html += FilmCategory.format(obj.name, movies);
    }
}
    return html;
  };


export { FilmCategory };