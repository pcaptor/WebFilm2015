using System;
using System.Linq;
using System.Web.Mvc;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Web.Script.Serialization;
using WebFilm2015.Models;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using Microsoft.AspNet.Identity;


namespace WebFilm2015.Controllers
{
    public class ReportController : Controller
    {
        // GET: /Report/
        [Authorize]
        public ActionResult Index()
        {
            try
            {
                Param param = new Param();
                param.EndDate = DateTime.Today;
                param.BeginDate = DateTime.Today.AddMonths(-1);

                return View(param);
            }
            catch (Exception ex)
            {
                GlobalData.logger.Error(ex.ToString());
            }

            return View();
        }

        [HttpGet]
        [Authorize]
        public JsonResult LoadTable()
        {
            try
            {
                var endDate = DateTime.Today.AddDays(1);
                var beginDate = DateTime.Today.AddMonths(-1);

                string jsonResult = GetJsonResult(beginDate, endDate);

                return Json(jsonResult, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                GlobalData.logger.Error(ex.ToString());
            }

            return Json(String.Empty, JsonRequestBehavior.AllowGet);
        }

        private string GetJsonResult(DateTime beginDate, DateTime endDate)
        {
            List<Report> list = new List<Report>();

            using (FilmDB1Entities db = new FilmDB1Entities())
            {
                string userId = User.Identity.GetUserId();

                var FilmList = from c in db.View_History
                               where c.AspUserId == userId &&
                                     DateTime.Compare(beginDate, c.hdate) <= 0 &&
                                     DateTime.Compare(c.hdate, endDate) <= 0
                               select
                                   new
                                   {
                                       c.history_id,
                                       c.fname,
                                       c.tname,
                                       c.sname,
                                       c.ename,
                                       c.hdate,
                                       c.AspUserId
                                   };

                foreach (var record in FilmList)
                {
                    Report report = new Report()
                    {
                        HistoryId = record.history_id,
                        Fname = record.fname,
                        Tname = record.tname,
                        Sname = record.sname,
                        Ename = record.ename,
                        Hdate = record.hdate.ToShortDateString() + " " + record.hdate.ToShortTimeString()
                    };
                    list.Add(report);
                }
            }
            // string jsonData = JsonConvert.SerializeObject(list);

            var serializer = new JavaScriptSerializer();
            string jsonResult = serializer.Serialize(list);

            return jsonResult;
        }


        [HttpGet]
        [Authorize]
        public JsonResult LoadReport(string beginDate, string endDate)
        {
            var date1 = Convert.ToDateTime(beginDate);
            var date2 = Convert.ToDateTime(endDate).AddDays(1);

            string jsonResult = GetJsonResult(date1, date2);

            return Json(jsonResult, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
        public ActionResult DownloadReport(string beginDate, string endDate)
        // public string DownloadReport(string beginDate, string endDate)
        {
            string msg = string.Empty;
            var sp = (char)32;

            try
            {
                var tmpDir = Environment.GetEnvironmentVariable("temp");
                var rptFilePath = tmpDir + @"\rptHistory_tmp.xls";
                FileInfo fileInf = new FileInfo(rptFilePath);
                if (fileInf.Exists)
                {
                    fileInf.Delete();
                }

                using (FilmDB1Entities db = new FilmDB1Entities())
                {
                    string userId = User.Identity.GetUserId();

                    CultureInfo culture = new CultureInfo("en-US");
                    var date1 = Convert.ToDateTime(beginDate, culture);
                    var date2 = Convert.ToDateTime(endDate, culture).AddDays(1);

                    var dataSource = from c in db.View_History
                                     where c.AspUserId.Equals(userId) &&
                                           DateTime.Compare(date1, c.hdate) <= 0 &&
                                           DateTime.Compare(c.hdate, date2) <= 0
                                     select new { c.history_id, c.fname, c.tname, c.sname, c.ename, c.hdate, c.AspUserId };

                    GlobalData.logger.Info("dataSource.Count = " + dataSource.Count());
                    FileInfo excelFile = new FileInfo(rptFilePath);

                    using (ExcelPackage package = new ExcelPackage(excelFile))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("Report");

                        var date3 = Convert.ToDateTime(endDate, culture);
                        worksheet.Cells[1, 1].Value = "Пользователь:" + sp + User.Identity.Name + sp + sp + sp + "просмотр с" + sp + date1.ToShortDateString() + sp + "по" + sp + date3.ToShortDateString();
                        worksheet.Cells[1, 1, 1, 10].Merge = true; //Merge columns start and end range
                        worksheet.Cells[1, 1, 1, 10].Style.Font.Bold = true; //Font should be bold

                        // Add the headers
                        worksheet.Cells[3, 1].Value = "ID";
                        worksheet.Cells[3, 2].Value = "Название";
                        worksheet.Cells[3, 3].Value = "Жанр";
                        worksheet.Cells[3, 4].Value = "Сезон";
                        worksheet.Cells[3, 5].Value = "Серия";
                        worksheet.Cells[3, 6].Value = "Дата и время";

                        using (var range = worksheet.Cells[3, 1, 3, 6])
                        {
                            // Setting bold font
                            range.Style.Font.Bold = true;
                            // Setting fill type solid
                            range.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                            // Setting background color dark blue
                            range.Style.Fill.BackgroundColor.SetColor(Color.DarkBlue);
                            // Setting font color
                            range.Style.Font.Color.SetColor(Color.White);
                            range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        }

                        var count = 3;
                        foreach (var rec in dataSource)
                        {
                            count++;
                            worksheet.Cells[count, 1].Value = rec.history_id.ToString();
                            worksheet.Cells[count, 2].Value = rec.fname.ToString();
                            worksheet.Cells[count, 3].Value = rec.tname.ToString();
                            worksheet.Cells[count, 4].Value = rec.sname.ToString();
                            worksheet.Cells[count, 5].Value = rec.ename.ToString();
                            worksheet.Cells[count, 6].Value = rec.hdate.ToString();
                            /*
                            // DateTime dt = Convert.ToDateTime(reader["PerformedAt"]);
                            // worksheet.Cells[count, 9].Value = dt.ToShortDateString() + sp + dt.ToLongTimeString();
                            */
                        }

                        if (count > 3)
                        {
                            using (var range = worksheet.Cells[4, 1, count, 1])
                            {
                                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            }

                            using (var range = worksheet.Cells[4, 6, count, 6])
                            {
                                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            }
                        }

                        worksheet.Cells.AutoFitColumns(0);
                        package.Save();
                    }
                }

                Response.Buffer = false;
                Response.ClearContent();
                Response.ClearHeaders();

                FileStream stream = System.IO.File.Open(rptFilePath, FileMode.Open);
                return File(stream, "application/xls", "Report.xls");
            }
            catch (Exception ex)
            {
                msg = "1) Ошибка: " + ex.Message;
                if (ex.InnerException != null)
                {
                    msg += "\r\n2) " + ex.InnerException.Message;

                    if (ex.InnerException.InnerException != null)
                    {
                        msg += "\r\n3) " + ex.InnerException.InnerException.Message;

                        if (ex.InnerException.InnerException.InnerException != null)
                            msg += "\r\n4) " + ex.InnerException.InnerException.InnerException.Message;
                    }
                }
                GlobalData.logger.Error(ex.ToString());
            }

            /*
            try
            {
                ReportDocument rd = new ReportDocument();

                rd.Load(Path.Combine(Server.MapPath("~/CrystalReports"), "CrystalReport1.rpt"));
                using (FilmDB1Entities db = new FilmDB1Entities())
                {
                    rd.SetDataSource(from c in db.View_History
                                     select new { c.history_id, c.fname, c.tname, c.sname, c.ename, c.hdate, c.user_id });

                    string userId = User.Identity.GetUserId();

                    // 
                    var date1 = Convert.ToDateTime(beginDate);
                    // 
                    var date2 = Convert.ToDateTime(endDate);
                    // var date1 = DateTime.Today.AddMonths(-1);
                    // var date2 = DateTime.Today;

                    rd.SetParameterValue(0, date1);
                    rd.SetParameterValue(1, date2);
                    rd.SetParameterValue(2, userId);
                }

                Response.Buffer = false;
                Response.ClearContent();
                Response.ClearHeaders();

                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                // msg = "Отчет успешно загружен!";
                return File(stream, "application/pdf", "Report.pdf");
            }
            catch (Exception ex)
            {
                msg = "1) Ошибка: " + ex.Message;
                if (ex.InnerException != null)
                {
                    msg += "\r\n2) " + ex.InnerException.Message;

                    if (ex.InnerException.InnerException != null)
                    {
                        msg += "\r\n3) " + ex.InnerException.InnerException.Message;

                        if (ex.InnerException.InnerException.InnerException != null)
                            msg += "\r\n4) " + ex.InnerException.InnerException.InnerException.Message;
                    }
                }
            }
            */

            MemoryStream mStream = new MemoryStream();
            StreamWriter writer = new StreamWriter(mStream);
            writer.Write(msg);
            writer.Flush();
            mStream.Position = 0;
            return File(mStream, "application/txt", "Error.txt");
        }
    }
}