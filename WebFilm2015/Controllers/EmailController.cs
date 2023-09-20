using System;
using System.Web.Mvc;
using MailKit.Net.Smtp;
using MimeKit;
using WebFilm2015.Models;

namespace WebFilm2015.Controllers
{
    public class EmailController : Controller
    {
        //
        // GET: /Email/

        public ActionResult SendEmail()
        {

            return View();
        }

        [HttpPost]
        public ActionResult SendEmail(EmailModel obj)
        {
            try
            {
                var from = "snexus753@gmail.com";

                MimeMessage mailMessage = new MimeMessage();
                mailMessage.From.Add(new MailboxAddress("ranger.somee.com", from));
                // mailMessage.Sender = new MailboxAddress(senderName, sender@address.com);

                // mailMessage.To.Add(new MailboxAddress(obj.ToEmail, obj.ToEmail));
                mailMessage.To.Add(new MailboxAddress("Developer", "pcaptor@gmail.com"));

                if (!string.IsNullOrEmpty(obj.EmailCC)) mailMessage.Cc.Add(new MailboxAddress(obj.EmailCC, obj.EmailCC));
                // if (!string.IsNullOrEmpty(obj.EmailBCC)) mailMessage.Bcc.Add(new MailboxAddress(obj.EmailBCC, obj.EmailBCC));

                mailMessage.Subject = obj.EmailSubject;
                // mailMessage.ReplyTo.Add(new MailboxAddress(replyToAddress));

                var builder = new BodyBuilder();
                builder.TextBody = obj.EMailBody;
                mailMessage.Body = builder.ToMessageBody();

                using (var smtpClient = new MailKit.Net.Smtp.SmtpClient())
                {
                    smtpClient.Connect("smtp.gmail.com", 465, MailKit.Security.SecureSocketOptions.Auto);

                    var username = "snexus753@gmail.com";
                    var pwd = @"xVE09SENk102b/e8?oou.r:$dfh4og";

                    smtpClient.Authenticate(username, pwd);
                    smtpClient.Send(mailMessage);
                }

                ViewBag.Status = "Email Sent Successfully.";
            }
            catch (SmtpCommandException ex)
            {
                GlobalData.logger.Error(ex.ToString());
                ViewBag.Status = "Problem while sending email, Please check details.";
            }
            catch (Exception ex)
            {
                GlobalData.logger.Error(ex.ToString());
                ViewBag.Status = "Problem while sending email, Please check details.";
            }

            return View();
        }
    }

}