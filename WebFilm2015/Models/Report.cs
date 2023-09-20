using System;
using System.ComponentModel.DataAnnotations;
using NLog;

namespace WebFilm2015.Models
{
    public class Report
    {
        public int HistoryId { get; set; }
        public string Fname { get; set; }
        public string Tname { get; set; }
        public string Sname { get; set; }
        public string Ename { get; set; }
        public string Hdate { get; set; }
    }

    public class Param
    {
        [Display(Name = "Начало периода")]
        public DateTime BeginDate { get; set; }

        [Display(Name = "Окончание периода")]
        public DateTime EndDate { get; set; }
    }

    public static class GlobalData
    {
        // Establishing Connection String from Configuration File
        // public static string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        public static Logger logger = LogManager.GetCurrentClassLogger();

        // public static string password = null;
    }
}