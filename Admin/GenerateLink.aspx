<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateLink.aspx.cs" Inherits="GenerateLink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">

    <asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" BorderStyle="None" 
        onclick="Button1_Click" Text="Button" />
    <br />

    <asp:Label ID="Label1" runat="server" Width="500px" ForeColor="#FFFFFF"></asp:Label>

    </form>
</body>
</html>
