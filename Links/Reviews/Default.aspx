<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.master" MaintainScrollPositionOnPostback="true"
    CodeFile="~/Links/Reviews/Default.aspx.cs" Inherits="Links_Reviews_Default" %>

<%@ Import Namespace="Enum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultHeadContentPlaceHolder" runat="Server">
    <title>Review Lounge</title>
    <script type="text/javascript" src='<%=ResolveUrl("../../JS/jquery.search.js") %>'></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#MovieReviews').SearchContent('#MovieReviewSearchTextBox');
            $('#MusicReviews').SearchContent('#MovieReviewSearchTextBox');
            $('#PerfumeReviews').SearchContent('#MovieReviewSearchTextBox');
            $('#DeodrantReviews').SearchContent('#MovieReviewSearchTextBox');
            $('#MovieReviewSearchTextBox').focus();
            $("html").scalableBackground("<%=Page.ResolveUrl("bg.jpg") %>", 2500, 1270);
        });
    </script>

    <meta name="description" content="Collection of Movie, Music and Perfume reviews." />
    <meta name="keywords" content="Shribros, Srivathsa Subramanian, Viswanathan Shivakumar, Srivathsa, Vishwa,
 movies, films, music, india, Rahman, reviews,Up, Moon, Pixar, Inglourious Basterds, Quentin Tarantino,Away we go, Sam mendes
 Dasavatharam, kamal haasan, District 9, Peter jackson,Hangover, Todd Philips, Steven Spielberg, Indiana Jones, Slumdog Millionaire,
 Danny Boyle, Night Shyamalan, The Happening, The Hurt Locker, Wall E, Blue, Ghajini, A R Rahman, Sakkarakati, Yuvraaj" />
    <meta name="author" content="Shribros" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultBodyContentPlaceHolder" runat="Server">

    <form id="form1" runat="server">
        <input type="text" id="MovieReviewSearchTextBox" class="SearchTextbox" />
    </form>

    <div class="OnePanelLayout">
        <h1>Latest Updates</h1>
        <ul>
            <% foreach (var review in LatestUpdates)
               {
                   if (review.ReviewType == ReviewType.Movie)
                   { %>
            <li><a href="<%= ResolveClientUrl("MovieReviews/" + review.LinkName) %>"><%= review.Name %></a></li>
            <% }
                   if (review.ReviewType == ReviewType.ShortMovie)
                   { %>
            <li><a href="<%= ResolveClientUrl("ShortMovieReviews/" + review.LinkName) %>"><%= review.Name %></a></li>
            <% }
                   if (review.ReviewType == ReviewType.Music)
                   { %>
            <li><a href="<%= ResolveClientUrl("MusicReviews/" + review.LinkName) %>"><%= review.Name %></a></li>
            <% }
                   if (review.ReviewType == ReviewType.Perfume)
                   { %>
            <li><a href="<%= ResolveClientUrl("PerfumeReviews/" + review.LinkName) %>"><%= review.Name %></a></li>
            <% }
               }
            %>
        </ul>
    </div>

    <div class="ThreePanelLayout">
        <h1>Movie</h1>
        <ul id="MovieReviews">
            <% string previousalphabet = null, currentalphabet;%>
            <%foreach (var review in MovieReviews)
              {
                  currentalphabet = review.Name.Substring(0, 1);
                  if (previousalphabet == null || previousalphabet != currentalphabet)
                  {%>
            <li>
                <h2><%=currentalphabet %></h2>
            </li>
            <%
                      previousalphabet = currentalphabet;
                  } if (review.ReviewType == ReviewType.ShortMovie)
                  {
            %>
            <li><a href="<%=ResolveClientUrl("ShortMovieReviews/"+review.LinkName)%>"><%=review.Name%></a></li>
            <%
                  }
                  if (review.ReviewType == ReviewType.Movie)
                  {
            %>
            <li><a href="<%=ResolveClientUrl("MovieReviews/"+review.LinkName)%>"><%=review.Name%></a></li>
            <%}
              } %>
        </ul>
    </div>
    <div class="ThreePanelLayout">
        <h1>Music</h1>
        <ul id="MusicReviews">
            <%previousalphabet = null; %>
            <%foreach (var review in MusicReviews)
              {
                  currentalphabet = review.Name.Substring(0, 1);
                  if (previousalphabet == null || previousalphabet != currentalphabet)
                  {%>
            <li>
                <h2><%=currentalphabet %></h2>
            </li>
            <%
                      previousalphabet = currentalphabet;
                  } %>
            <li><a href="<%=ResolveClientUrl("MusicReviews/"+review.LinkName)%>"><%=review.Name%></a></li>
            <%} %>
        </ul>
    </div>
    <div class="ThreePanelLayout">
        <h1>Perfume</h1>
        <ul id="PerfumeReviews">
            <%previousalphabet = null; %>
            <%foreach (var review in PerfumeReviews)
              {
                  currentalphabet = review.Name.Substring(0, 1);
                  if (previousalphabet == null || previousalphabet != currentalphabet)
                  {%>
            <li>
                <h2><%=currentalphabet %></h2>
            </li>
            <%
                      previousalphabet = currentalphabet;
                  } %>
            <li><a href="<%=ResolveClientUrl("PerfumeReviews/"+review.LinkName)%>"><%=review.Name%></a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
