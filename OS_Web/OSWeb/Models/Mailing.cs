using System;
using System.Collections.Generic;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.IO;

namespace OSWeb.Models
{
    public class Mailing
    {
        private string to;
        public string To
        {
            get { return to; }
            set { to = value; }
        }

        private string cc;
        public string Cc
        {
            get { return cc; }
            set { cc = value; }
        }

        private string from;
        public string From
        {
            get { return from; }
            set { from = value; }
        }

        private string asunto;
        public string Asunto
        {
            get { return asunto; }
            set { asunto = value; }
        }

        private string body;
        public string Body
        {
            get { return body; }
            set { body = value; }
        }

        public void Enviar()
        {


            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["SMTPFrom"], "TEST");
            mail.To.Add(new MailAddress(this.to));
            mail.CC.Add(new MailAddress(this.cc));
            mail.Subject = this.asunto;
            mail.IsBodyHtml = false;
            mail.Body = this.body;


            //mail.Attachments.Add(new Attachment(Environment.CurrentDirectory + System.Configuration.ConfigurationManager.AppSettings["AttachPath"]));

            SmtpClient client = new SmtpClient();
            client.Host = System.Configuration.ConfigurationManager.AppSettings["SMTP"];
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential(System.Configuration.ConfigurationManager.AppSettings["SMTPUsr"], System.Configuration.ConfigurationManager.AppSettings["SMTPPwd"]);

            try
            {
                client.Send(mail);

                mail = null;
                client = null;

                //Console.WriteLine("Mail hacia: " + this.to + " enviado correctamente");

            }
            catch (System.Net.Mail.SmtpException ex)
            {
                //Console.WriteLine("Mail hacia: " + mail.To + " no enviado - Motivo: " + ex.Message);
                throw ex;
            }
        }
    }
}