using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using Enum;
using HtmlAgilityPack;

public partial class Links_Reviews_Default : Page
{
    private const int LatestUpdateListCount = 6;
    private const string AspxExtension = "*.aspx";
    public List<ReviewInfo> MovieReviews
    {
        get
        {
            /*if (Global.MovieReviews != null)
                return Global.MovieReviews;*/

            Global.MovieReviews = new List<ReviewInfo>();
            foreach (string s in System.IO.Directory.GetFiles(Server.MapPath("../Reviews/MovieReviews/"), AspxExtension))
            {
                string filename = new System.IO.FileInfo(s).Name;
                DateTime lastmodified = new System.IO.FileInfo(s).LastWriteTime;
                Global.MovieReviews.Add(new ReviewInfo
                {
                    ReviewType = ReviewType.Movie,
                    LinkName = filename,
                    Name = filename.RemoveExtension(),
                    DateModified = lastmodified
                });
            }
            foreach (string s in System.IO.Directory.GetFiles(Server.MapPath("../Reviews/ShortMovieReviews/"), AspxExtension))
            {
                string filename = new System.IO.FileInfo(s).Name;
                DateTime lastmodified = new System.IO.FileInfo(s).LastWriteTime;
                HtmlDocument doc = new HtmlDocument();
                doc.Load(s);
                foreach (HtmlNode link in doc.DocumentNode.SelectNodes("//a[@name]"))
                {
                    HtmlAttribute att = link.Attributes["name"];
                    Global.MovieReviews.Add(new ReviewInfo
                    {
                        ReviewType = ReviewType.ShortMovie,
                        Name = att.Value,
                        LinkName = string.Format("{0}#{1}", filename, att.Value),
                        DateModified = lastmodified
                    });
                }
            }
            Global.MovieReviews.Sort(new ReviewInfoNameComparer());
            return Global.MovieReviews;
        }
    }
    public List<ReviewInfo> MusicReviews
    {
        get
        {
            /*if (Global.MusicReviews != null)
                return Global.MusicReviews;*/

            Global.MusicReviews = new List<ReviewInfo>();
            foreach (string s in System.IO.Directory.GetFiles(Server.MapPath("../Reviews/MusicReviews/"), AspxExtension))
            {
                string filename = new System.IO.FileInfo(s).Name;
                DateTime lastmodified = new System.IO.FileInfo(s).LastWriteTime;
                Global.MusicReviews.Add(new ReviewInfo
                {
                    ReviewType = ReviewType.Music,
                    Name = filename.RemoveExtension(),
                    LinkName = filename,
                    DateModified = lastmodified
                });
            }
            Global.MusicReviews.Sort(new ReviewInfoNameComparer());
            return Global.MusicReviews;
        }
    }
    public List<ReviewInfo>PerfumeReviews
    {
        get
        {
            /*if (Global.MusicReviews != null)
                return Global.MusicReviews;*/

            Global.PerfumeReviews = new List<ReviewInfo>();
            foreach (string s in System.IO.Directory.GetFiles(Server.MapPath("../Reviews/PerfumeReviews/"), AspxExtension))
            {
                string filename = new System.IO.FileInfo(s).Name;
                DateTime lastmodified = new System.IO.FileInfo(s).LastWriteTime;
                Global.PerfumeReviews.Add(new ReviewInfo
                {
                    ReviewType = ReviewType.Perfume,
                    Name = filename.RemoveExtension(),
                    LinkName = filename,
                    DateModified = lastmodified
                });
            }
            Global.PerfumeReviews.Sort(new ReviewInfoNameComparer());
            return Global.PerfumeReviews;
        }
    }
    public List<ReviewInfo> DeodrantReviews
    {
        get
        {
            /*if (Global.MovieReviews != null)
                return Global.MovieReviews;*/

            Global.DeodrantReviews = new List<ReviewInfo>();
            foreach (string s in System.IO.Directory.GetFiles(Server.MapPath("../Reviews/DeoReviews/"), AspxExtension))
            {
                string filename = new System.IO.FileInfo(s).Name;
                DateTime lastmodified = new System.IO.FileInfo(s).LastWriteTime;
                HtmlDocument doc = new HtmlDocument();
                doc.Load(s);
                foreach (HtmlNode link in doc.DocumentNode.SelectNodes("//a[@name]"))
                {
                    HtmlAttribute att = link.Attributes["name"];
                    Global.DeodrantReviews.Add(new ReviewInfo
                    {
                        ReviewType = ReviewType.Deodrant,
                        Name = att.Value,
                        LinkName = string.Format("{0}#{1}", filename, att.Value),
                        DateModified = lastmodified
                    });
                }
            }
            Global.DeodrantReviews.Sort(new ReviewInfoNameComparer());
            return Global.DeodrantReviews;
        }
    }
    public List<ReviewInfo> LatestUpdates
    {
        get
        {
            /*if (Global.LatestReviewUpdates != null)
                return Global.LatestReviewUpdates;*/

            Global.LatestReviewUpdates = new List<ReviewInfo>(LatestUpdateListCount);
            List<ReviewInfo> tempList =
                new List<ReviewInfo>(MovieReviews.Count + MusicReviews.Count + PerfumeReviews.Count + DeodrantReviews.Count);
            tempList.AddRange(MovieReviews);
            tempList.AddRange(MusicReviews);
            tempList.AddRange(PerfumeReviews);
            tempList.Sort(new ReviewInfoDateComparer());
            Global.LatestReviewUpdates.AddRange(tempList.Take(LatestUpdateListCount));
            return Global.LatestReviewUpdates;
        }
    }
}
