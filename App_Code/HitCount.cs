using System;
using System.IO;
using System.Web;

public class HitCount
{
    public HitCount()
    {
        Util ut=new Util();
        StreamReader objStreamReader;
        try
        {
            string FileName = HttpContext.Current.Server.MapPath("HitCount.txt");

            string HitCounterContent = null;
            string FullContent = null;
            string CurrentLine = null;

            objStreamReader = File.OpenText(FileName);

            CurrentLine = objStreamReader.ReadLine();
            while (CurrentLine != null)
            {
                HitCounterContent = CurrentLine;
                FullContent = FullContent + HitCounterContent + Environment.NewLine;
                CurrentLine = objStreamReader.ReadLine();
            }

            if (HitCounterContent.Substring(0, HitCounterContent.IndexOf("|")) == ut.Date)
            {
                FullContent = FullContent.Replace(HitCounterContent + Environment.NewLine, "");
                HitCounterContent = ut.Date + "|" + 
                    Convert.ToString(Convert.ToInt32(HitCounterContent.Substring(HitCounterContent.IndexOf("|") + 1, 
                    HitCounterContent.Length - (HitCounterContent.IndexOf("|") + 1))) + 1);
            }
            else
            {
                HitCounterContent = ut.Date + "|1";
            }

            FullContent = FullContent + HitCounterContent;
            objStreamReader.Close();

            FileStream fs = File.Create(FileName);
            StreamWriter sw = new StreamWriter(fs);
            sw.Write(FullContent);
            sw.Close();
            fs.Close();


        }
        catch (Exception ex)
        {
        }
    }

}
