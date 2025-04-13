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

FilmCategory.formatMany = async function (categories, age) {
    let html = "";

    for (const category of categories) {
        const movies = await DataMovie.requestMovieCategory(category.id, age);

        if (movies.length > 0) {
            html += FilmCategory.format(category.name, movies);
        }
    }

    if (html === "") {
        html = "<p>Aucun film disponible pour votre tranche d'âge.</p>";
    }

    return html;
};


export { FilmCategory };