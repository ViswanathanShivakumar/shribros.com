using System.Text.RegularExpressions;

namespace SearchDotnet.Searchs
{
    //*********************************************************************
    //
    // CleanHtml class
    //
    // Properties are used to store search data of the user
    //
    //*********************************************************************

    public class CleanHtml
    {
        //*********************************************************************
        //
        // CleanFileContent Method
        //
        // Subroutine to the clean the file of html content
        //
        //*********************************************************************
        public static string Clean(string Contents)
        {
            Regex regexp = default(Regex);
            string strPattern = null;

            strPattern = "";
            regexp = new Regex(strPattern, RegexOptions.IgnoreCase);

            Contents = Regex.Replace(Contents, "<(select|option|script|style|title)(.*?)>((.|\\n)*?)</(select|option|script|style|title)>", " ", RegexOptions.IgnoreCase);

            Contents = Regex.Replace(Contents, "&(nbsp|quot|copy);", "");

            //Contents = regexp.Replace(Contents, "<[^>]*>", "")

            Contents = Regex.Replace(Contents, "<([\\s\\S])+?>", " ", RegexOptions.IgnoreCase).Replace("  ", " ");

            //Contents = regexp.Replace(Contents, "<[^<>]+>", " ", RegexOptions.IgnoreCase)

            //Contents = regexp.Replace("(<(\w+)[^>]*?>(.*?)</\1>", "$1")

            Contents = Regex.Replace(Contents, "\\W", " ");

            //Trace.Warn("File Contents", Contents)

            return Contents;

        }
    }

}