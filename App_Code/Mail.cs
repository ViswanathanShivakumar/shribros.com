using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

/// <summary>
/// Summary description for Mail
/// </summary>
public class Mail
{
    public void SendMail(string subject, string message)
	{
        var client = new SmtpClient(Config.SmtpServer, 587)
        {
            Credentials = new NetworkCredential(Config.FromEmail, Config.Password),
            EnableSsl = true,
        };
        client.Send("support@ticketsales.com", "sriram.vishwa@gmail.com", subject, message);
	}
}