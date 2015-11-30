using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Collections.Generic;
using System.Xml;

public partial class Links_MovieRatings : System.Web.UI.Page
{
    private static List<MovieInfo> _movieInfo;
    private class MovieInfo
    {
        public string Name { get; set; }
        public string Year { get; set; }
        public string Sriram { get; set; }
        public string Srivathsa { get; set; }
    }

    #region WebMethods
    [WebMethod]
    public static List<string> AllMovieInfo(string term)
    {
        var allMovieInfo = _movieInfo.Where(x => x.Name.IndexOf(term, StringComparison.OrdinalIgnoreCase) >= 0).Select(x => x.Name).ToList();
        return allMovieInfo;
    }

    [WebMethod]
    public static string GetMovieInfo(string term)
    {
        term = term.Replace("|", "'");
        var movieInfo = _movieInfo.FirstOrDefault(x => x.Name == term);
        if (movieInfo != null)
        {
            SearchData movieData = null;
            string requestUriString = string.Format("http://www.omdbapi.com/?t={0}&y={1}&r=json&plot=full",
                movieInfo.Name.Replace(" ", "+"),
                movieInfo.Year);
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

            if (movieData == null || string.IsNullOrEmpty(movieData.Title))
            {
                movieData = new SearchData {Title = movieInfo.Name};
            }

            return string.Join("|", movieData.SearchResultString, movieInfo.Sriram, movieInfo.Srivathsa);
        }
        return string.Empty;
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (_movieInfo != null)
                return;

            var movieRatingsFile = new XmlDocument();
            movieRatingsFile.Load(Server.MapPath("MovieRatings.xml"));
            XmlElement root = movieRatingsFile.DocumentElement;
            _movieInfo = new List<MovieInfo>();
            if (root != null)
            {
                XmlNodeList nodes = root.SelectNodes("record");
                if (nodes != null)
                {
                    foreach (XmlNode node in nodes)
                    {
                        _movieInfo.Add(new MovieInfo
                        {
                            Name = node["Movie"].InnerText,
                            Year = node["Year"].InnerText,
                            Sriram = node["Sriram"].InnerText,
                            Srivathsa = node["Srivathsa"].InnerText,
                        });
                    }
                }
            }
        }
    }
}
