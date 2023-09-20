using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFilm2015.Models
{
    public class FilmBinder : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            Film film = new Film();

            HttpContextBase context = controllerContext.HttpContext;
            var film_id = context.Request.Form["film_id"];

            if (!String.IsNullOrEmpty(film_id))
            { 
                film.film_id = Convert.ToInt32(film_id);
            }
            
            film.fname = context.Request.Form["fname"];
            film.fname_eng = context.Request.Form["fname_eng"];
            film.year = Convert.ToInt16(context.Request.Form["year"]);
            film.description = context.Request.Form["description"];

            using (FilmDB1Entities db = new FilmDB1Entities())
            {
                var tname = context.Request.Form["tname"].Trim();
                film.type_id = db.Types.Where(t => t.tname.Trim().Equals(tname.Trim())).Select(t => t.type_id).FirstOrDefault();

                var cname = context.Request.Form["cname"].Trim();
                film.country_id = db.Countries.Where(c => c.cname.Trim().Equals(cname.Trim())).Select(c => c.country_id).FirstOrDefault();

                var sname = context.Request.Form["sname"].Trim();
                film.season_id = db.Seasons.Where(s => s.sname.Trim().Equals(sname)).Select(s => s.season_id).FirstOrDefault();

                var ename = context.Request.Form["ename"].Trim();
                film.episode_id = db.Episodes.Where(e => e.ename.Trim().Equals(ename)).Select(e => e.episode_id).FirstOrDefault();
            }

            return film;
        }
    }
}