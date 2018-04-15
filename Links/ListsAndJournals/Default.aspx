<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultHeadContentPlaceHolder" runat="Server">
    <title>Lists, Journals and Blogs</title>

    <meta name="description" content="Collection of Journals, Blogs and categorized lists" />
    <meta name="keywords" content="" />
    <meta name="author" content="Shribros" />

    <link type="text/css" href="<%=ResolveClientUrl("../../CSS/body.ListsAndJournals.css")%>" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("html").scalableBackground("<%=Page.ResolveUrl("bg.jpg") %>", 2500, 1270);
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="DefaultBodyContentPlaceHolder" runat="Server">
    <h1>Shribros' Lists</h1>
    <ul>
        <li><a href="<%=ResolveClientUrl("10_Greatest_movies_Of_All_Time.aspx") %>">
            <h2>10 Greatest Movies of All Time</h2>
        </a></li>
        <li><a href="<%=ResolveClientUrl("200_Must_Watch_Movies_Of_All_Time.aspx") %>">
            <h2>200 Must Watch Movies of All Time</h2>
        </a></li>
        <li><a href="<%=ResolveClientUrl("List_100_Greatest_Directors_A.aspx") %>">
            <h2>100 Greatest Directors of All Time</h2>
        </a></li>
        <li><a href="<%=ResolveClientUrl("15_Greatest_Film_Series.aspx") %>">
            <h2>15 Greatest Film Series of All Time</h2>
        </a></li>
        <li><a href="<%=ResolveClientUrl("List_Top15_AnimatedShorts.aspx") %>">
            <h2>15 Greatest Animated Shorts of All Time</h2>
        </a></li>
        <h2>Yearly Top Lists</h2>
        <ul>
            <li><a href="<%=ResolveClientUrl("Best_Picture_of_the_Year.aspx") %>">
                <h3>Best Picture of the Year</h3>
            </a></li>
             <li><a href="<%=ResolveClientUrl("List_Top15_2015.aspx") %>">
                <h3>Best 15 Movies of 2015</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("List_Top15_2014.aspx") %>">
                <h3>Best 15 Movies of 2014</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("List_Top15_2013.aspx") %>">
                <h3>Best 15 Movies of 2013</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("List_Top15_2012.aspx") %>">
                <h3>Best 15 Movies of 2012</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("List_Top15_2011.aspx") %>">
                <h3>Best 15 Movies of 2011</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("List_Top15_2010.aspx") %>">
                <h3>Best 15 Movies of 2010</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("List_Top15_2009.aspx") %>">
                <h3>Best 15 Movies of 2009</h3>
            </a></li>
        </ul>
    </ul>

    <h1>Journals</h1>
    <ul>
        <h2>Big Directors, Their Big Movies</h2>
        <ul>
            <li><a href="<%=ResolveClientUrl("Journal_BDBM_Darren_Aronofksy.aspx") %>">
                <h3>Darren Aronosfky</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("Journal_BDBM_Coens.aspx") %>">
                <h3>Ethan Coen, Joel Coen</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("Journal_BDBM_Sam_Mendes.aspx") %>">
                <h3>Sam Mendes</h3>
            </a></li>
            <li><a href="<%=ResolveClientUrl("Journal_BDBM_Nolan.aspx") %>">
                <h3>Christopher Nolan</h3>
            </a></li>
        </ul>
        <li><a href="<%=ResolveClientUrl("Journal_Excerpts_Rays_Book.aspx") %>">
            <h2>Excerpts from Ray's Books</h2>
        </a></li>
        <li><a href="<%=ResolveClientUrl("Journal_Where_Is_Indian_Pure_Cinema.aspx") %>">
            <h2>Where is Indian Pure Cinema</h2>
        </a></li>
    </ul>

    <h1>Perfume Lists</h1>
    <ul>
        <li><a href="<%=ResolveClientUrl("20_Best_Fragrances_Of_All_Time.aspx") %>">
            <h2>Best 20 Colognes for Men</h2>
        </a></li>
    </ul>

    <h1>Blogs</h1>
    <ul>
        <li><a href="<%=ResolveClientUrl("Blog_When_A_Country.aspx") %>">
            <h2>When A Country Bled blue</h2>
        </a></li>
    </ul>
</asp:Content>
