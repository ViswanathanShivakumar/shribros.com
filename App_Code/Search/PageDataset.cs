using System;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;

namespace SearchDotnet.Searchs
{

    //*********************************************************************
    //
    // PagesDataset class
    //
    // Defines shared methods to create and add records to dataset
    //
    //*********************************************************************
    public class PagesDataset
    {

        //*********************************************************************
        //
        // Create Method - Shared method
        //
        // Creates a datset for the pages and returns the result
        //
        //*********************************************************************
        public static DataSet Create()
        {
            //Objects are defined
            DataSet pgDataSet = new DataSet();
            DataColumn[] keys = new DataColumn[2];

            //Table is created and added to table collection
            pgDataSet.Tables.Add(new DataTable("Pages"));

            //Schema of table is defined
            pgDataSet.Tables["Pages"].Columns.Add("PageId", Type.GetType("System.Int32"));
            pgDataSet.Tables["Pages"].Columns.Add("Title", System.Type.GetType("System.String"));
            pgDataSet.Tables["Pages"].Columns.Add("Description", System.Type.GetType("System.String"));
            pgDataSet.Tables["Pages"].Columns.Add("Path", System.Type.GetType("System.String"));
            pgDataSet.Tables["Pages"].Columns.Add("MatchCount", System.Type.GetType("System.Int32"));
            pgDataSet.Tables["Pages"].Columns.Add("Size", System.Type.GetType("System.Decimal"));

            //PageId is defined as indentity
            pgDataSet.Tables["Pages"].Columns["PageID"].AutoIncrement = true;
            pgDataSet.Tables["Pages"].Columns["PageID"].AutoIncrementSeed = 1;

            //PageId is defined as the primary key
            keys[0] = pgDataSet.Tables["Pages"].Columns["PageId"];
            pgDataSet.Tables["Pages"].PrimaryKey = keys;

            return pgDataSet;
        }

        //*********************************************************************
        //
        // StoreFile Method - Shared method
        //
        // Creates a datset for the pages and returns the result
        //
        //*********************************************************************
        public static void StoreFile(DataSet dstPgs, Searchs.Page srchPg)
        {
            //Objects are defined
            DataRow pageRow = default(DataRow);

            //New row is created
            pageRow = dstPgs.Tables["Pages"].NewRow();

            //Data is added
            if (srchPg.Title.Contains("<%"))
            {
                var matches = Regex.Matches(srchPg.Title, "(?:<% =)(.*?)(?: %>)");
                var titleString = new StringBuilder();
                foreach (object match in matches)
                {
                    titleString.Append(match.ToString().Replace("<% =", string.Empty).Replace(" %>", string.Empty));
                }
            }

            pageRow["Title"] = srchPg.Title;
            pageRow["Description"] = srchPg.Description;
            pageRow["Path"] = srchPg.Path;
            pageRow["MatchCount"] = srchPg.MatchCount;
            pageRow["Size"] = srchPg.Size;

            //Row is added to the dataset
            dstPgs.Tables["Pages"].Rows.Add(pageRow);
        }
    }
}