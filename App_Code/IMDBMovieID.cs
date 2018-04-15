using System.IO;
using System.Net;
using System.Web.Script.Serialization;

/// <summary>
/// Contains list of IMDB movie ID's
/// </summary>
public static class IMDBMovieID
{
    public const string ASeriousMan = "tt1019452";
    public const string AliceInWonderland = "tt1926979";
    public const string Argo = "tt1024648";
    public const string Avatar = "tt0499549";
    public const string AwayWeGo = "tt1176740";
    public const string BlackSwan = "tt0947798";
    public const string Brave = "tt1217209";
    public const string Cars2 = "tt1216475";
    public const string DespicableMe = "tt1323594";
    public const string District9 = "tt1136608";

    public const string Drive = "tt1229238";
    public const string GranTorino = "tt1229238";
    public const string GreenZone = "tt1229238";
    public const string Hangover = "tt1229238";
    public const string HarryPotterAndTheDeathlyHallowsPart1 = "tt1229238";
    public const string Hereafter = "tt1229238";
    public const string HowToTrainYourDragon = "tt1229238";
    public const string Hugo = "tt1229238";
    public const string Inception = "tt1229238";
    public const string IndianaJonesAndTheKingdomOfCrystalSkull = "tt1229238";
    public const string IngloriousBastards = "tt1229238";
    public const string Interstellar = "tt1229238";
    public const string IronMan2 = "tt1229238";
    public const string LePetitSoldat = "tt1229238";
    public const string LifeOfPi = "tt1229238";
    public const string Lincoln = "tt1229238";
    public const string MissionImpossibleGhostProtocol = "tt1229238";
    public const string MonstersUniversity = "tt1229238";
    public const string Moon = "tt1229238";
    public const string PeepliLive = "tt1229238";
    public const string Rango = "tt1229238";
    public const string SherlockHolmes = "tt1229238";
    public const string Shrek = "tt1229238";
    public const string ShipOfTheseus = "tt1773764";
    public const string ShrekForeverAfter = "tt1229238";
    public const string ShutterIsland = "tt1229238";
    public const string SitaSingsTheBlues = "tt1229238";
    public const string SlumdogMillionaire = "tt1229238";
    public const string TheAdventuresOfTinTinTheSecretOfUnicorn = "tt1229238";
    public const string TheArtist = "tt1229238";
    public const string TheDarkKnigthRises = "tt1229238";
    public const string TheHappening = "tt1229238";
    public const string TheHurtLocker = "tt1229238";
    public const string TheSocialNetwork = "tt1229238";
    public const string TheTown = "tt1229238";
    public const string TheWildChild = "tt1229238";
    public const string ToyStory3 = "tt1229238";
    public const string TrueGrit = "tt1229238";
    public const string UpInTheAir = "tt1229238";
    public const string Up = "tt1229238";
    public const string WallE = "tt1229238";
    public const string WarHorse = "tt1229238";
    public const string JurassicWorld = "tt0369610";

    public static string GetMoviePosterLinkFromID(string imdbID, int posterHeight = 200)
    {
        if (string.IsNullOrEmpty(imdbID))
            return string.Empty;

        return string.Format("http://img.omdbapi.com/?i={0}&apikey={1}&h={2}", imdbID, Config.OMDBAPIKey, posterHeight);
    }

    public static string GetMoviePosterLink(string movieName, int posterHeight = 200)
    {
        SearchData movieData = null;
        string requestUriString = string.Format("http://www.omdbapi.com/?t={0}&r=json&plot=full",
            movieName.Replace(" ", "+"));
        WebRequest request = WebRequest.Create(requestUriString);
        using (var twitpicResponse = (HttpWebResponse) request.GetResponse())
        {
            if (twitpicResponse.StatusCode == HttpStatusCode.OK)
            {
                Stream responseStream = twitpicResponse.GetResponseStream();
                if (responseStream != null)
                {
                    using (var reader = new StreamReader(responseStream))
                    {
                        var js = new JavaScriptSerializer();
                        var responseText = reader.ReadToEnd();
                        movieData = (SearchData) js.Deserialize(responseText, typeof (SearchData));
                    }
                }
            }
        }

        if (movieData == null)
            return string.Empty;

        return string.Format("http://img.omdbapi.com/?i={0}&apikey={1}&h={2}", movieData.imdbID, Config.OMDBAPIKey,
            posterHeight);
    }

    public static string GetMoviePosterLinkID(string imdbID, int posterHeight = 200)
    {
        SearchData movieData = null;
        string requestUriString = string.Format("http://www.omdbapi.com/?i={0}&r=json&plot=full",
            imdbID);
        WebRequest request = WebRequest.Create(requestUriString);
        using (var twitpicResponse = (HttpWebResponse)request.GetResponse())
        {
            if (twitpicResponse.StatusCode == HttpStatusCode.OK)
            {
                Stream responseStream = twitpicResponse.GetResponseStream();
                if (responseStream != null)
                {
                    using (var reader = new StreamReader(responseStream))
                    {
                        var js = new JavaScriptSerializer();
                        var responseText = reader.ReadToEnd();
                        movieData = (SearchData)js.Deserialize(responseText, typeof(SearchData));
                    }
                }
            }
        }

        if (movieData == null)
            return string.Empty;

        return movieData.Poster.Replace("SX300", "SX100");
        /* return string.Format("http://img.omdbapi.com/?i={0}&apikey={1}&h={2}", movieData.imdbID, Config.OMDBAPIKey,
            posterHeight);*/
    }
}