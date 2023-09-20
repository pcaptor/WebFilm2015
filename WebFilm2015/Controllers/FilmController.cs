using System;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using System.Windows.Media.Imaging;
using Drew.Wpf.Flags;
using WebFilm2015.Models;
using Microsoft.AspNet.Identity;


namespace WebFilm2015.Controllers
{
    public class FilmController : Controller
    {
        FilmDB1Entities db = new FilmDB1Entities();
        
        // GET: Film
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public JsonResult GetFilms(string sidx, string sort, int page, int rows, bool _search, string searchField,
            string searchOper, string searchString)
        {
            int totalRecords = 0;
            var totalPages = 0;

            // GlobalData.logger.Error("GetFilms");

            // try
            // {

            sort = (sort == null) ? "" : sort;
            int pageIndex = page - 1;
            int pageSize = rows;

            string userId = User.Identity.GetUserId();

            var FilmList = from film in db.Films
                           join type in db.Types on film.type_id equals type.type_id
                           join country in db.Countries on film.country_id equals country.country_id
                           join episode in db.Episodes on film.episode_id equals episode.episode_id
                           join season in db.Seasons on film.season_id equals season.season_id
                           where film.AspUserId == userId
                           select new
                           {
                               film_id = film.film_id,
                               fname = film.fname,
                               fname_eng = film.fname_eng,
                               type_id = film.type_id,
                               tname = type.tname,
                               year = film.year,
                               country_id = film.country_id,
                               cname = country.cname,
                               season_id = film.season_id,
                               sname = season.sname,
                               episode_id = film.episode_id,
                               ename = episode.ename,
                               description = film.description,
                               hdate = db.Histories.Where(h => h.film_id == film.film_id).Max(h => h.hdate),
                               code = country.code
                           };

            try
            {

                var uploadPath = System.Web.Hosting.HostingEnvironment.MapPath("~/Uploads");
                if (!System.IO.Directory.Exists(uploadPath))
                {
                    System.IO.Directory.CreateDirectory(uploadPath);
                }

                foreach (var film in FilmList)
                {
                    var path = Path.Combine(uploadPath, film.code + ".jpg");

                    if (System.IO.File.Exists(path))
                    {
                        continue;
                    }

                    CountryIdToFlagImageSourceConverter FlagConverter = new CountryIdToFlagImageSourceConverter();
                    System.Type targetType = null;
                    var img1 = FlagConverter.Convert(film.code, targetType, "", CultureInfo.CurrentCulture);
                    BitmapImage image = img1 as BitmapImage;

                    JpegBitmapEncoder encoder = new JpegBitmapEncoder();
                    encoder.Frames.Add(BitmapFrame.Create(image));

                    using (var filestream = new FileStream(path, FileMode.Create))
                    {
                        encoder.Save(filestream);
                    }
                }

                if (_search)
                {
                    switch (searchField)
                    {
                        case "fname":
                            FilmList = FilmList.Where(t => t.fname.Contains(searchString));
                            break;
                        case "fname_eng":
                            FilmList = FilmList.Where(t => t.fname_eng.Contains(searchString));
                            break;
                            /*
                            case "Gender":
                                FilmList = FilmList.Where(t => t.Gender.Contains(searchString));
                                break;
                            case "ClassName":
                                FilmList = FilmList.Where(t => t.ClassName.Contains(searchString));
                                break;
                                */
                    }
                }

                totalRecords = FilmList.Count();
                totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);

                if (sort.ToUpper() == "DESC")
                {
                    FilmList = FilmList.OrderByDescending(t => t.fname);
                    FilmList = FilmList.Skip(pageIndex * pageSize).Take(pageSize);
                }
                else
                {
                    // FilmList = FilmList.OrderBy(t => t.fname);
                    FilmList = FilmList.OrderByDescending(t => t.hdate);
                    FilmList = FilmList.Skip(pageIndex * pageSize).Take(pageSize);
                }
            }
            catch (Exception ex)
            {
                GlobalData.logger.Error(ex.ToString());
            }

            var jsonData = new
            {
                total = totalPages,
                page,
                records = totalRecords,
                rows = FilmList
            };

            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [Authorize]
        public string Create([ModelBinder(typeof(FilmBinder))] Film newFilm)
        {
            string msg = string.Empty;

            try
            {
                if (ModelState.IsValid)
                {
                    if (db.Films.Any())
                    {
                        newFilm.film_id = db.Films.Max(x => x.film_id) + 1;
                    }
                    else
                    {
                        newFilm.film_id = 1;
                    }

                    if (!String.IsNullOrEmpty(User.Identity.Name))
                    {
                        string userId = User.Identity.GetUserId();
                        newFilm.AspUserId = userId;
                    }

                    db.Films.Add(newFilm);
                    db.SaveChanges();
                    msg = "Данные успешно сохранены!";
                }
                else
                {
                    msg = "Проверьте данные";
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException != null)
                {
                    if (ex.InnerException.InnerException != null)
                    {
                        msg += "Ошибка: " + ex.InnerException.InnerException.Message;
                    }
                    else
                    {
                        msg += "Ошибка: " + ex.InnerException.Message;
                    }
                }
                else
                {
                    msg += "Ошибка: " + ex.Message;
                }
            }
            return msg;
        }

        [Authorize]
        public string Edit([ModelBinder(typeof(FilmBinder))] Film newFilm)
        {
            string msg = string.Empty;

            try
            {
                if (ModelState.IsValid)
                {
                    string userId = User.Identity.GetUserId();
                    newFilm.AspUserId = userId;

                    db.Entry(newFilm).State = EntityState.Modified;
                    db.SaveChanges();
                    msg = "Данные успешно сохранены!";
                }
                else
                {
                    // msg = "Validation data not successfully";
                    msg = "Проверьте данные";
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException != null)
                {
                    if (ex.InnerException.InnerException != null)
                    {
                        msg += "Ошибка: " + ex.InnerException.InnerException.Message;
                    }
                    else
                    {
                        msg += "Ошибка: " + ex.InnerException.Message;
                    }
                }
                else
                {
                    msg += "Ошибка: " + ex.Message;
                }
            }
            return msg;
        }

        [Authorize]
        public string Delete(int Id)
        {
            Film film = db.Films.Find(Id);

            var histories = db.Histories.Where(h => h.film_id == Id).ToList();
            foreach (var item in histories)
            {
                if (db.Entry(item).State != EntityState.Deleted)
                {
                    db.Histories.Remove(item);
                }
            }

            db.Films.Remove(film);
            db.SaveChanges();
            return "Фильм успешно удален!";
        }


        public string TypeSelectList()
        {
            var typeList = db.Types.ToList();

            string tmpSelect = "<select>";
            foreach (var t in typeList)
            {
                tmpSelect += "<option value='" + t.tname + "'>" + t.tname + "</option>";
            }
            tmpSelect += "</select>";

            return tmpSelect;
        }

        public string CountrySelectList()
        {
            var countryList = db.Countries.ToList();

            string tmpSelect = "<select>";
            foreach (var c in countryList)
            {
                tmpSelect += "<option value='" + c.cname + "'>" + c.cname + "</option>";
            }
            tmpSelect += "</select>";

            return tmpSelect;
        }

        public string SeasonSelectList()
        {
            var seasonList = db.Seasons.ToList();

            string tmpSelect = "<select>";
            foreach (var s in seasonList)
            {
                tmpSelect += "<option value='" + s.sname + "'>" + s.sname + "</option>";
            }
            tmpSelect += "</select>";

            return tmpSelect;
        }

        [HttpGet]
        public string EpisodeSelectList()
        {
            var episodeList = db.Episodes.ToList();

            string tmpSelect = "<select>";
            foreach (var e in episodeList)
            {
                tmpSelect += "<option value='" + e.ename + "'>" + e.ename + "</option>";
            }
            tmpSelect += "</select>";

            return tmpSelect;
        }

        [HttpGet]
        public string YearSelectList()
        {
            string tmpSelect = "<select>";
            int currentYear = DateTime.Today.Year;

            // for (int i = currentYear - 15; i <= currentYear; i++)
            for (int i = currentYear; i >= currentYear - 10; i--)
            {
                tmpSelect += "<option value='" + i.ToString() + "'>" + i + "</option>";
            }

            tmpSelect += "</select>";
            return tmpSelect;
        }


        [Authorize]
        public JsonResult GetDescription(int film_id)
        {
            int filmId = film_id;
            string userId = User.Identity.GetUserId();

            var FilmList = from film in db.Films
                           where film.AspUserId == userId && film.film_id == filmId
                           select new
                           {
                               film_id = film.film_id,
                               description = film.description
                           };

            var descr = db.Films.Where(f => f.film_id == filmId && f.AspUserId == userId)
                    .Select(f => f.description)
                    .FirstOrDefault();

            var jsonData = new
            {
                total = 1,
                page = 1,
                records = 1,
                rows = FilmList
            };

            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult GetDetail(string sidx, string sort, int page, int rows, bool _search, string searchField, string searchOper, string searchString, string filmId)
        {
            try
            {
                sort = (sort == null) ? "" : sort;
                int pageIndex = Convert.ToInt32(page) - 1;
                int pageSize = rows;

                var fId = Convert.ToInt32(filmId);

                var HistoryList = from h in db.Histories
                                  where h.film_id == fId
                                  join season in db.Seasons on h.season_id equals season.season_id
                                  join episode in db.Episodes on h.episode_id equals episode.episode_id
                                  select new
                                  {
                                      History_id = h.history_id,
                                      Sname = season.sname,
                                      Ename = episode.ename,
                                      Hdate = h.hdate
                                  };

                /*
                if (_search)
                {
                    switch (searchField)
                    {
                        case "ClientId":
                            CallList = CallList.Where(t => t.ClientId == Convert.ToInt32(searchString));
                            break;
                    }
                }
                */

                int totalRecords = HistoryList.Count();
                var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);


                if (sort.ToUpper() == "DESC")
                {
                    HistoryList = HistoryList.OrderByDescending(t => t.History_id);
                    HistoryList = HistoryList.Skip(pageIndex * pageSize).Take(pageSize);
                }
                else
                {
                    HistoryList = HistoryList.OrderBy(t => t.History_id);
                    HistoryList = HistoryList.Skip(pageIndex * pageSize).Take(pageSize);
                }

                var jsonData = new
                {
                    total = totalPages,
                    page = page,
                    records = totalRecords,
                    rows = HistoryList
                };
                return Json(jsonData, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                var jsonData1 = new
                {
                    total = 1,
                    page = 1,
                    records = 0
                };

                return Json(jsonData1, JsonRequestBehavior.AllowGet);
            }
        }
    }
}