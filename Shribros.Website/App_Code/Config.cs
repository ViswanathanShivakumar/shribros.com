using System.Configuration;

namespace Shribros.Website
{
    /// <summary>
    /// Summary description for Config
    /// </summary>
    public static class Config
    {
        private static readonly string _password;
        public static string SmtpServer { get; private set; }
        public static string FromEmail { get; private set; }
        public static string OMDBAPIKey { get; private set; }

        public static string Password
        {
            get { return Crypt.Dencode(_password); }
        }

        static Config()
        {
            SmtpServer = ConfigurationManager.AppSettings["SMTPServer"];
            FromEmail = ConfigurationManager.AppSettings["FromMail"];
            _password = ConfigurationManager.AppSettings["Password"];
            OMDBAPIKey = ConfigurationManager.AppSettings["OMDBAPIKey"];
        }
    }
}