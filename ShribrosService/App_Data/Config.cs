using System.Configuration;

namespace ShribrosService.App_Data
{
    public class Config
    {
        public static string OMDBAPIKey { get; private set; }

        static Config()
        {
            OMDBAPIKey = ConfigurationManager.AppSettings["OMDBAPIKey"];
        }
    }
}