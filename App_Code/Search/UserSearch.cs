using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using Microsoft.VisualBasic;

namespace SearchDotnet.Searchs
{

    //*********************************************************************
    //
    // Site class
    //
    // Properties are used to store search data of the user
    //
    //*********************************************************************
    public class UserSearch
    {
        private int m_totalFilesSearched = 0;
        private int m_totalFilesFound = 0;
        private SearchCriteria m_searchCriteria = SearchCriteria.AllWords;
        private string m_searchWords = "";
        //Private m_serverPath As String = ""
        private DataSet m_dstPages;

        private System.Web.UI.Page m_page = new System.Web.UI.Page();

        //*********************************************************************
        //
        // TotalFilesSearched Property
        //
        // Retreive TotalFilesSearched of the site
        //
        //*********************************************************************
        public int TotalFilesSearched
        {
            get { return m_totalFilesSearched; }
        }

        //*********************************************************************
        //
        // TotalFilesFound Property
        //
        // Retreive TotalFilesFound of the site
        //
        //*********************************************************************
        public int TotalFilesFound
        {
            get { return m_totalFilesFound; }
        }

        //*********************************************************************
        //
        // PageDataset Shared Property
        //
        // Retreive data of tzh entire site of the site
        //
        //*********************************************************************
        public DataSet PageDataset
        {
            get { return m_dstPages; }
        }

        //*********************************************************************
        //
        // SearchCriteria Property
        //
        // Assign and retreive SearchCriteria of the site
        //
        //*********************************************************************
        public Searchs.SearchCriteria SearchCriteria
        {
            get { return m_searchCriteria; }
            set { m_searchCriteria = value; }
        }

        //*********************************************************************
        //
        // SearchWords Property
        //
        //Assign and retreive SearchWords of the site
        //
        //*********************************************************************
        public string SearchWords
        {
            get { return m_searchWords; }
            set { m_searchWords = value; }
        }



        //*********************************************************************
        //
        // Search Method
        //
        // Search the entire site
        //
        //*********************************************************************
        public DataSet Search(string targetDirectory)
        {
            //If the site is in English then use the server HTML encode method
            if (Site.EnglishLanguage == "True")
            {
                //Replace any HTML tags with the HTML codes for the same characters (stops people entering HTML tags)
                m_searchWords = m_page.Server.HtmlEncode(m_searchWords);
                //If the site is not english just change the script tags
            }
            else
            {
                //Just replace the script tag <> with HTML encoded &lt; and &gt;
                m_searchWords = Strings.Replace(m_searchWords, "<", "&lt;", 1, -1, CompareMethod.Text);
                m_searchWords = Strings.Replace(m_searchWords, ">", "&gt;", 1, -1, CompareMethod.Text);
            }
            if (m_dstPages == null)
            {
                m_dstPages = PagesDataset.Create();
            }
            ProcessDirectory(targetDirectory);

            return m_dstPages;
        }

        //*********************************************************************
        //
        // ProcessDirectory Method
        //
        // Files in the directories are searched
        //
        //*********************************************************************
        private void ProcessDirectory(string targetDirectory)
        {
            string[] fileEntries = null;
            string[] subdirectoryEntries = null;
            string filePath = null;
            string subdirectory = null;

            fileEntries = Directory.GetFiles(targetDirectory);

            // Process the list of files found in the directory

            foreach (string filePath_loopVariable in fileEntries)
            {
                filePath = filePath_loopVariable;
                m_totalFilesSearched += 1;
                ProcessFile(filePath);
            }

            subdirectoryEntries = Directory.GetDirectories(targetDirectory);
            // Recurse into subdirectories of this directory


            foreach (string subdirectory_loopVariable in subdirectoryEntries)
            {
                subdirectory = subdirectory_loopVariable;
                //Check to make sure the folder about to be searched is not a barred folder if it is then don't search
                if (!(Strings.InStr(1, SearchDotnet.Searchs.Site.BarredFolders, Path.GetFileName(subdirectory), Constants.vbTextCompare) > 0))
                {
                    //Call the search sub prcedure to search the web site
                    ProcessDirectory(subdirectory);
                }

            }

        }
        //ProcessDirectory

        //*********************************************************************
        //
        // ProcessFile Method
        //
        // Real logic for processing found files would go here.
        //
        //*********************************************************************
        private void ProcessFile(string FPath)
        {
            Searchs.Page srchFile = null;

            srchFile = GetInfo(FPath);

            if ((srchFile != null))
            {
                srchFile.Search(m_searchWords, m_searchCriteria);
                if (srchFile.MatchCount > 0)
                {
                    m_totalFilesFound += 1;
                    //Response.Write(srchFile.Contents)
                    srchFile.CheckFileInfo();
                    SearchDotnet.Searchs.PagesDataset.StoreFile(m_dstPages, srchFile);
                }

            }

        }
        //ProcessFile

        //*********************************************************************
        //
        // GetInfo Method
        //
        // File data is picked in this method
        //
        //*********************************************************************
        private Page GetInfo(string fPath)
        {
            var fileInform = new FileInfo(fPath);
            var srchFile = new Page();
            
            //Check the file extension to make sure the file is of the extension type to be searched
            if (Strings.InStr(1, Site.FilesTypesToSearch, fileInform.Extension, Constants.vbTextCompare) > 0)
            {
                //m_page.Trace.Warn("File ext.", fileInform.Extension)
                //Check to make sure the file about to be searched is not a barred file if it is don't search the file
                if (!(Strings.InStr(1, Site.BarredFiles, Path.GetFileName(fPath), Constants.vbTextCompare) > 0))
                {
                    //m_page.Trace.Warn("File", FPath)

                    if (!File.Exists(fPath))
                    {
                        //m_page.Trace.Warn("Error", String.Format("{0} does not exist.", FPath))
                        //Add throw excetion here
                        //
                        //
                        return null;
                    }

                    GetFileInfo(fPath, srchFile);

                    return srchFile;

                }
            }
            return null;
        }

        //*********************************************************************
        //
        // GetFilePath Method
        //
        // File path is modfied to be displayed as hyperlink in this method
        //
        //*********************************************************************
        private void GetFilePath(string strFileURL, Page srchFile)
        {
            //Turn the server path to the file into a URL path to the file
            strFileURL = Strings.Replace(strFileURL, m_page.Server.MapPath("./"), "");
            
            //Replace the NT backslash with the internet forward slash in the URL to the file

            strFileURL = Strings.Replace(strFileURL, "\\", "/");

            //Encode the file name and path into the URL code method
            strFileURL = m_page.Server.UrlEncode(strFileURL);

            //Just incase it's encoded any backslashes
            strFileURL = Strings.Replace(strFileURL.Trim(), "%2f", "/", 1, -1, CompareMethod.Text);
            strFileURL = strFileURL.Replace("+", "%20");
            srchFile.Path = BaseSiteUrl + strFileURL;

            m_page.Trace.Warn("Url", srchFile.Path);
        }

        public static string BaseSiteUrl
        {
            get
            {
                HttpContext context = HttpContext.Current;
                string baseUrl = context.Request.Url.Scheme + "://" + context.Request.Url.Authority + context.Request.ApplicationPath.TrimEnd('/') + '/';
                return baseUrl;
            }
        }

        //*********************************************************************
        //
        // GetFileInfo Method
        //
        // File data is picked in this method
        //
        //*********************************************************************
        private void GetFileInfo(string FPath, Searchs.Page srchFile)
        {
            FileInfo fileInform = new FileInfo(FPath);
            StringBuilder strBldFile = new StringBuilder();
            decimal fileSize = fileInform.Length / 1024;
            srchFile.Size = fileSize;
            
            GetFilePath(FPath, srchFile);
            
            if (Strings.InStr(1, Site.DynamicFilesTypesToSearch, fileInform.Extension, Constants.vbTextCompare) > 0)
            {
                m_page.Trace.Warn("Path", string.Format("{0}/{1}", "", srchFile.Path));
                GetDynamicFileContent(srchFile);
            }
            else
            {
                GetStaticFileContent(FPath, srchFile);
            }


            if (!srchFile.Contents.Equals(""))
            {
                //Read in the title of the file
                srchFile.Title = GetMetaContent(srchFile.Contents, "<title>", "</title>");
                //m_page.Trace.Warn("Page Title", strPageTitle)

                //Read in the description meta tag of the file
                srchFile.Description = GetMetaContent(srchFile.Contents, "<meta name=\"description\" content=\"", "\" />");
                //m_page.Trace.Warn("Page Desc", strPageDescription)

                //Read in the keywords of the file
                srchFile.Keywords = GetMetaContent(srchFile.Contents, "<meta name=\"keywords\" content=\"", "\" />");
                //m_page.Trace.Warn("Page Keywords", strPageKeywords)

                srchFile.Contents = CleanHtml.Clean(srchFile.Contents);

                srchFile.Contents = strBldFile.AppendFormat("{0} {1} {2} {3}", srchFile.Contents, srchFile.Description, srchFile.Keywords, srchFile.Title).ToString().Trim();
                //m_page.Trace.Warn("File Info", strBldFile.ToString) 
            }


        }

        //*********************************************************************
        //
        // GetStaticFileContent Method
        //
        // File Content is picked in this method
        //
        //*********************************************************************
        private void GetStaticFileContent(string FPath, Searchs.Page srchFile)
        {
            StreamReader sr = default(StreamReader);

            sr = File.OpenText(FPath);

            try
            {
                srchFile.Contents = sr.ReadToEnd();
                sr.Close();
            }
            catch (Exception ex)
            {
                //m_page.Trace.Warn("Error", ex.Message)
            }
        }

        //*********************************************************************
        //
        // GetDynamicFileContent Method
        //
        // File Content is picked in this method
        //
        //*********************************************************************
        private void GetDynamicFileContent(Searchs.Page srchFile)
        {
            System.Net.WebClient wcMicrosoft = default(System.Net.WebClient);
            UTF8Encoding objUTF8Encoding = default(UTF8Encoding);
            string strResponse = null;

            wcMicrosoft = new System.Net.WebClient();
            objUTF8Encoding = new UTF8Encoding();
            srchFile.Contents = objUTF8Encoding.GetString(wcMicrosoft.DownloadData(string.Format("{0}/{1}", SearchDotnet.Searchs.Site.ApplicationPath, srchFile.Path)));

        }

        //*********************************************************************
        //
        // GetMetaContent Method
        //
        // Metacontent is stripped in this method
        //
        //*********************************************************************
        private string GetMetaContent(string strFile, string strMetaStart, string strMetaEnd)
        {
            //List the text between the title tags:
            Regex regexp = default(Regex);
            string strMeta = null;
            string strPattern = null;
            string strInPattern = null;

            //'If no description or keywords are found then you may be using http-equiv= instead of name= in your meta tags
            //If InStr(1, LCase(strFile), strMetaStart, 1) = 0 And InStr(strMetaStart, "name=") Then
            //'Swap name= for http-equiv= 
            //strMetaStart = Replace(strMetaStart, "name=", "http-equiv=")
            //End If

            //Build Pattern
            strInPattern = "((.|\\n)*?)";
            strPattern = string.Format("{0}{1}{2}", strMetaStart, strInPattern, strMetaEnd);
            regexp = new Regex(strPattern, RegexOptions.IgnoreCase);

            //Match Pattern
            strMeta = regexp.Match(strFile).ToString();

            //Build Pattern
            strInPattern = "(.*?)";
            strPattern = string.Format("{0}{1}{2}", strMetaStart, strInPattern, strMetaEnd);

            //Get Pattern content
            strMeta = Regex.Replace(strMeta, strPattern, "$1", RegexOptions.IgnoreCase);

            return strMeta;
        }

    }

}