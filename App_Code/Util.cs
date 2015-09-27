using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public class Util
{
	public string Date
	{
		get
        { return DateTime.Now.Month + "/" + DateTime.Now.Day + "/" + DateTime.Now.Year; }
	}
}
