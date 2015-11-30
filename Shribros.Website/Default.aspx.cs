using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.Services;
using SearchDotnet.Searchs;

/// <summary>
/// Summary description for Default
/// </summary>
public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { }

    [WebMethod]
    public static string SearchSite(string strSearch, string path)
    {
        //This allows user to search across the website from any page on the website
        //Use the parameter value to search only the current directory where the page resides
        path = AppDomain.CurrentDomain.BaseDirectory;

        var srchSite = new UserSearch
        {
            SearchWords = strSearch,
            SearchCriteria = SearchCriteria.AllWords
        };
        srchSite.Search(path.Replace("|", "\\"));
        DataTable searchResult = srchSite.PageDataset.Tables[0];
        var jsonSerializer = new JavaScriptSerializer();
        var outputString = new StringBuilder();
        
        var searchResults = new List<SearchResult>();

        foreach (DataRow row in searchResult.Rows)
        {
            string filePath = row["Path"].ToString();
            string pageTitle = row["Title"].ToString();
            string pageDescription = row["Description"].ToString();
            //Movie ratings page has is driven by MovieRatings.xml. But the link has to route to MovieRatings.aspx
            const string movieRatingsXmlFileString = "MovieRatings.xml";
            const string movieRatingsAspxFileString = "MovieRatings.aspx";
            if (filePath.Contains(movieRatingsXmlFileString))
            {
                pageTitle = "Movie Ratings";
                pageDescription = "Provides an exhaustive list of ratings for movies.";
                filePath = filePath.Replace(movieRatingsXmlFileString, movieRatingsAspxFileString);
            }

            searchResults.Add(new SearchResult
            {
                Title = pageTitle,
                Path = filePath,
                Description = pageDescription,
            });
        }
        jsonSerializer.Serialize(searchResults, outputString);
        return outputString.ToString();
    }
}

public class SearchResult
{
    public string Title { get; set; }
    public string Path { get; set; }
    public string Description { get; set; }

}