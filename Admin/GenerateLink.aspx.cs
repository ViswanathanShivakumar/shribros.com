using System;

using ExternalClasses;

public partial class GenerateLink : System.Web.UI.Page
{
    protected void Button1_Click(object sender, EventArgs e)
    {
       Label1.Text=Crypt.Encode(TextBox1.Text);
    }
}
