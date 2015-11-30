using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace ExternalClasses
{
    public class SearchText
    {
        public void Search(HtmlGenericControl divToSearch, HtmlGenericControl divToUpdate, TextBox textControlToSearch, string SeachResultText)
        {
            HtmlGenericControl UpdateDiv = divToUpdate;
            if (string.IsNullOrEmpty(textControlToSearch.Text))
            {
                UpdateDiv.InnerHtml = "";
                textControlToSearch.Focus();
                return;
            }
            HtmlGenericControl SearchDiv = divToSearch;
            Boolean MatchFound = false;
            string[] Seperator = { "\n" };
            string Content = SearchDiv.InnerText;
            List<string> LinksList = new List<string>();
            List<string> MatchingList = new List<string>();
            LinksList.AddRange(Content.Split(Seperator, StringSplitOptions.RemoveEmptyEntries));
            foreach (string Link in LinksList)
            {
                string stripped = Regex.Replace(Link, @"<(.|\n)*?>", string.Empty).Trim();
                if (stripped.ToLower().Contains(textControlToSearch.Text.ToLower()))
                {
                    MatchingList.Add(Link);
                    MatchFound = true;
                }
            }
            if (MatchingList.Count != 0)
                UpdateDiv.InnerHtml = SeachResultText + "<br \\>";
            UpdateDiv.InnerHtml = UpdateDiv.InnerHtml + string.Join(Seperator[0], MatchingList.ToArray());
            if (!MatchFound)
                UpdateDiv.InnerHtml = "";
            textControlToSearch.Focus();
        }
    }
}