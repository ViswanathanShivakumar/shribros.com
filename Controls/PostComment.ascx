<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PostComment.ascx.cs" Inherits="Controls.Links_PostComment" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" OnInit="UpdatePanel1_Init">
    <ContentTemplate>
        <div style="padding:2px; border-bottom:1px solid #555555; border-top:1px solid #555555;">
            <asp:Label ID="ErrorDetails_Label" runat="server" Width="600px" ForeColor="Red"></asp:Label><br />
            <div style="width: 660px; text-align: left;">
                <h4>Leave A Thought...</h4>
                <asp:Label ID="Name_Label" runat="server" Text="E-Mail" Width="40px"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" BackColor="#666666" BorderStyle="Solid"
                    ForeColor="#FFFFFF" BorderWidth="1px" Width="300px" BorderColor="#999999" Font-Size="15px" Font-Names="Arial Narrow"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Not a Valid Email Address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Comments_Label" runat="server" Text="Comment" Width="60px"></asp:Label>

                <asp:TextBox ID="Comments_Textbox" runat="server" BackColor="#666666" BorderStyle="Solid"
                    ForeColor="#FFFFFF" BorderWidth="1px" Width="100%" BorderColor="#999999" Height="100px"
                    TextMode="MultiLine" Font-Size="15px" Font-Names="Arial Narrow"></asp:TextBox><br />
                <br />
                <asp:Button ID="PostComment_Button" runat="server" Text="POST IT" BackColor="#999999" BorderColor="#555555"
                    BorderWidth="2px" Width="100%" OnClick="PostComment_Button_Click"></asp:Button>

                <asp:TextBox ID="WebcrawlerHiddenForm" runat="server" Visible="false"></asp:TextBox>
                <br />
                <br />
                <div id="Label_Comments" runat="server">
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
