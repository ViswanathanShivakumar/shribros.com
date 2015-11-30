<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultHeadContentPlaceHolder" runat="Server">
    <title>Shribros - Who What and Why</title>
    <script type="text/javascript">
        $(document).ready(function () {
            $("html").scalableBackground("<%=Page.ResolveUrl("bg.jpg") %>", 2500, 1270);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultBodyContentPlaceHolder" runat="Server">
    <h1>The Site and Content
    </h1>
    <p>
        We are a team of two (Srivathsa and Vishwa), supported personally, by a few and inspired by a countless others. This website is a reflection of our craving for what we love the most, but what might interest the readers and viewers is what we do with our passion. 
        We are movie buffs, music freaks, perfumistas , photography lovers and much more. But we restrict ourselves to movies, music and perfumes for this site, with which we could offer the visitors something with. Please run through the links above to know more.
    </p>

    <p>These pages also serve as the portfolio of the creative works we've been doing, including film making (mostly shorts), photography etc.., this website will keep growing as we update it with information that would be helpful to all the friends who are interested in what we have to offer.</p>
</asp:Content>
