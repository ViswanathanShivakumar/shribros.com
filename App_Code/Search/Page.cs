using System.Text.RegularExpressions;
using Microsoft.VisualBasic;

namespace SearchDotnet.Searchs
{
    //*********************************************************************
    //
    // SearchCriteria enumeration
    //
    // An enumeration to the save the type of search
    //
    //*********************************************************************
    public enum SearchCriteria : short
    {
        AllWords,
        AnyWords,
        Phrase
    }

    //*********************************************************************
    //
    // Page class
    //
    // Page class to store data of individual files on the website
    //
    //*********************************************************************
    public class Page
    {
        //Private 
        private string m_path = "";
        private string m_title = "";
        private string m_keywords = "";
        private string m_description = "";
        private string m_contents = "";
        private int m_matchcount = 0;

        private decimal m_size = 0;
        //*********************************************************************
        //
        // Size Property
        //
        // Assign and retreive Size of the file
        //
        //*********************************************************************
        public decimal Size
        {
            get { return m_size; }
            set { m_size = value; }
        }

        //*********************************************************************
        //
        // Path Property
        //
        // Assign and retreive path of the file
        //
        //*********************************************************************

        public string Path
        {
            get { return m_path; }
            set { m_path = value; }
        }

        //*********************************************************************
        //
        // Title Property
        //
        //Assign and retreive title of the file
        //
        //*********************************************************************
        public string Title
        {
            get { return m_title; }
            set { m_title = value; }
        }

        //*********************************************************************
        //
        // Keywords Property
        //
        // Assign and retreive Keywords ( meta tags ) of the file
        //
        //*********************************************************************
        public string Keywords
        {
            get { return m_keywords; }
            set { m_keywords = value; }
        }


        //*********************************************************************
        //
        // Description Property
        //
        // Assign and retreive description ( meta tags ) of the file
        //
        //*********************************************************************
        public string Description
        {
            get { return m_description; }
            set { m_description = value; }
        }

        //*********************************************************************
        //
        // Contents Property
        //
        // Assign and retreive contents of the file
        //
        //*********************************************************************
        public string Contents
        {
            get { return m_contents; }
            set { m_contents = value; }
        }


        //*********************************************************************
        //
        // Contents Property
        //
        // Assign and retreive MatchCount of the file
        //
        //*********************************************************************
        public int MatchCount
        {
            get { return m_matchcount; }
            set { m_matchcount = value; }
        }

        //*********************************************************************
        //
        // CheckFileInfo method
        //
        // Subroutine to the check the file contains title and decription 
        //
        //*********************************************************************

        public void CheckFileInfo()
        {
            //If the page contains no title then Page Title variable the appropriate message to display
            if ((m_title == null) | m_title.Trim().Equals(""))
            {
                m_title = "No Title";
            }


            //If the page contains no title then Page Description variable the appropriate message to display
            if ((m_description == null) | m_description.Trim().Equals(""))
            {
                if ((m_contents == null) | m_contents.Trim().Equals(""))
                {
                    m_description = "There is no description available for this page";
                }
                else
                {
                    if (m_contents.Length > 200)
                    {
                        m_description = m_contents.Substring(0, 200);
                    }
                    else
                    {
                        m_description = m_contents;
                    }
                }
            }
        }

        //*********************************************************************
        //
        // Search method
        //
        // Subroutine to the search file 
        //
        //*********************************************************************

        public void Search(string strSearchWords, SearchCriteria SrchCriteria)
        {
            //If the user has choosen to search by phrase 
            if (SrchCriteria == SearchCriteria.Phrase)
            {
                SearchPhrase(strSearchWords);
                //Else the search is either by all or any words
            }
            else
            {
                SearchWords(strSearchWords, SrchCriteria);
            }

        }

        //*********************************************************************
        //
        // SearchPhrase method
        //
        // Subroutine to the search file 
        //
        //*********************************************************************
        private void SearchPhrase(string strSearchWords)
        {
            Regex regexp = default(Regex);
            MatchCollection mtches = default(MatchCollection);

            //Search the file for the phrase
            mtches = Regex.Matches(m_contents, string.Format("\\b{0}\\b", strSearchWords), RegexOptions.IgnoreCase);

            //Check to see if the phrase has been found
            if (mtches.Count > 0)
            {
                //Get the number of times the phrase is matched
                m_matchcount = mtches.Count;
            }
        }

        //*********************************************************************
        //
        // SearchWords method
        //
        // Subroutine to the search file 
        //
        //*********************************************************************
        private void SearchWords(string strSearchWords, SearchCriteria SrchCriteria)
        {
            Regex regexp = default(Regex);
            int intSearchLoopCounter = 0;
            string[] sarySearchWord = null;
            //Array to hold the words to be searched for
            MatchCollection mtches = default(MatchCollection);

            //Split each word to be searched up and place in an array
            sarySearchWord = Strings.Split(Strings.Trim(strSearchWords), " ");

            //Loop round to search for each word to be searched

            for (intSearchLoopCounter = 0; intSearchLoopCounter <= Information.UBound(sarySearchWord); intSearchLoopCounter++)
            {
                //Set the pattern to search for
                mtches = Regex.Matches(m_contents, string.Format("\\b{0}\\b", sarySearchWord[intSearchLoopCounter]), RegexOptions.IgnoreCase);

                if (SrchCriteria == SearchCriteria.AnyWords)
                {
                    m_matchcount = m_matchcount + mtches.Count;
                }
                else if (SrchCriteria == SearchCriteria.AllWords)
                {
                    //Check to see if any of the words have been found
                    if (mtches.Count > 0)
                    {
                        //Get the number of times the search word is matched

                        if (m_matchcount == 0 | (m_matchcount > 0 & m_matchcount > mtches.Count))
                        {
                            m_matchcount = mtches.Count;
                        }
                    }
                    else
                    {
                        //If the search word is not found then set the search found variable back to false as one of the words has not been found
                        m_matchcount = 0;
                        return;

                    }
                }
            }
        }

    }

}