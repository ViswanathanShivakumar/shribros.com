using System;
using System.Configuration;
using System.IO;
using System.Web.UI;

namespace Shribros.Website.Controls
{
    public partial class Links_PostComment : UserControl
    {
        #region Variables
        protected static string ShribrosUser = ConfigurationManager.AppSettings["CurrentUserNameSessionVariable"];
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                DisplayComments();
        }
        protected void UpdatePanel1_Init(object sender, EventArgs e)
        {
            ScriptManagerCheck smc = new ScriptManagerCheck(this.Page, PlaceHolder1);
        }
        protected void PostComment_Button_Click(object sender, EventArgs e)
        {
            //Avoid webcrawlers from automatically submitting the form
            if (!string.IsNullOrEmpty(WebcrawlerHiddenForm.Text.Trim()))
                return;
            if (!Page.IsValid)
                return;
            PostComment();

            new Mail().SendMail("New Comment Posted", Comments_Textbox.Text.Replace("\n", "<br/>"));
        }
        #endregion

        #region Methods
        private void PostComment()
        {
            ErrorDetails_Label.Text = "";
            /*
        if (string.IsNullOrEmpty(txtEmail.Text))
        {
            ErrorDetails_Label.Text = "Please enter comments before posting it.";
            return;
        }
        if (string.IsNullOrEmpty(Comments_Textbox.Text))
        {
            ErrorDetails_Label.Text = "Please enter your name before posting it.";
            return;
        }
        */
            StreamWriter objStreamWriter = default(StreamWriter);
            try
            {
                if (!File.Exists(Server.MapPath(Path.GetFileName(Request.PhysicalPath).Replace(".aspx", ".txt"))))
                {
                    FileStream fs = File.Create(Server.MapPath(Path.GetFileName(Request.PhysicalPath).Replace(".aspx", ".txt")));
                    fs.Close();
                }

                string FileName = Server.MapPath(Path.GetFileName(Request.PhysicalPath).Replace(".aspx", ".txt"));

                objStreamWriter = File.AppendText(FileName);

                objStreamWriter.WriteLine(txtEmail.Text + " | " + DateTime.Now);
                objStreamWriter.WriteLine(Comments_Textbox.Text.Replace("\n", "<br/>"));
                objStreamWriter.WriteLine();
                objStreamWriter.Close();
                DisplayComments();

                txtEmail.Text = "";
                Comments_Textbox.Text = "";
            }
            catch (Exception)
            {
                ErrorDetails_Label.Text = "Unable to Post comment. Please try again";
            }
            finally
            {
                objStreamWriter.Close();
            }
        }
        private void DisplayComments()
        {
            if (Session[ShribrosUser] != null)
                txtEmail.Text = Session[ShribrosUser].ToString();

            StreamReader objStreamReader = default(StreamReader);
            try
            {
                if (!File.Exists(Server.MapPath(Path.GetFileName(Request.PhysicalPath).Replace(".aspx", ".txt"))))
                    return;

                string FileName = Server.MapPath(Path.GetFileName(Request.PhysicalPath).Replace(".aspx", ".txt"));
                objStreamReader = File.OpenText(FileName);

                string contents = objStreamReader.ReadToEnd();
                Label_Comments.InnerHtml = contents.Replace(Environment.NewLine, "<br>");
                objStreamReader.Close();
            }
            catch (Exception)
            {
                Label_Comments.InnerHtml = "Error Reading user comments. Please try again";
            }
        }
        #endregion
    }
}