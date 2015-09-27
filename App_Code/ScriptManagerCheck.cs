using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class ScriptManagerCheck
{
    public ScriptManagerCheck(Page PageToValidate, PlaceHolder PlaceHolderToAddScriptManager)
    {
        if (ScriptManager.GetCurrent(PageToValidate) == null)
        {
            ScriptManager sManager = new ScriptManager();
            sManager.ID = "sManager_" + DateTime.Now.Ticks;
            PlaceHolderToAddScriptManager.Controls.AddAt(0, sManager);
        }
    }
}