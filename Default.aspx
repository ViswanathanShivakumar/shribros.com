<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultHeadContentPlaceHolder" runat="Server">
    <title>Webpages of Srivathsa and Vishwa</title>

    <meta name="description" content="Home page of shribros.com" />
    <meta name="keywords" content="" />
    <meta name="author" content="Shribros" />

	
    <script src="JS/jquery.css.sizes.js" type="text/javascript"></script>
    <script src="JS/jquery.caption.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function () {
            //Align the links tiles to be at the center of the screen leaving
            var headerHeight = 129;
            var footerHeight = 130;
            var mainContentHolderHeight = $(document).height() - (headerHeight + footerHeight);
            var mainContentHolderPadding = (mainContentHolderHeight - 500) / 2;
            var mainContentHolderResizedHeight = mainContentHolderHeight - mainContentHolderPadding;
            $(".MainContentHolder").css("padding-top", mainContentHolderPadding);
            $(".MainContentHolder").css("height", mainContentHolderResizedHeight);

            //Add captions to the home page links
            $(".MainLink").AddCaption("MainLinkCaption");
            $(".SubLink1").AddCaption("SubLink1Caption");
            $(".SubLink2").AddCaption("SubLink2Caption");
            $(".SubLink3").AddCaption("SubLink3Caption");
            $(".SubLink4").AddCaption("SubLink4Caption");
        });


        $(document).ready(function () {
            $("html").scalableBackground("<%=Page.ResolveUrl("bg.jpg") %>", 2500, 1270);
        });

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="DefaultBodyContentPlaceHolder" runat="Server">
    <div class="PrimaryLink">
        <a href="Links/TheStudio/blankversenow.aspx" class="MainLink" id="MainLink"></a>
    </div>
    <div class="SecondaryLink">
        <ul>
            <li><a href="Links/Photography/Default.aspx" class="SubLink1"></a></li>
            <li><a href="Links/Reviews/MovieReviews/Interstellar.aspx" class="SubLink2"></a></li>
            <li><a href="Links/Reviews/PerfumeReviews/Hugo Boss Red.aspx" class="SubLink3"></a></li>
            <li><a href="Links/Photography/Default.aspx" class="SubLink4"></a></li>
        </ul>
    </div>
    <div id="MainLinkCaption">"Blank Verse Now"</div>
    <div id="SubLink1Caption">Grand Canyon Photo Tour</div>
    <div id="SubLink2Caption">Movie Reviews</div>
    <div id="SubLink3Caption">Hugo Boss - Perfume Review</div>
    <div id="SubLink4Caption">Food Photography</div>
</asp:Content>
