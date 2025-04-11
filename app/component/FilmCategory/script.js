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


FilmCategory.formatMany =  async function(categories) {
    let html = "";
    const select = document.getElementById('profile-select');
    const selectedOption = select ? select.selectedOptions[0] : null;
    
    for (const obj of categories) {
        let movies;
        if (!selectedOption || selectedOption.value === "") {
            movies = await DataMovie.requestMovieCategory(obj.id, null);
        } else {
            const age = selectedOption.getAttribute('data-dob');
            movies = await DataMovie.requestMovieCategory(obj.id, age);
        }
        
        if (Array.isArray(movies) && movies.length > 0) {
            html += FilmCategory.format(obj.name, movies);
        }
    }
    return html;
  };


export { FilmCategory };