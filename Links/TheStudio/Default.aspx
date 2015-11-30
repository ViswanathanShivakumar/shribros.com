<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultHeadContentPlaceHolder" runat="Server">
    <title>The Studio - Homepage</title>
    <meta name="description" content="Homepage of the list of all our movie making works including animated and live actions shorts." />
    <meta name="keywords" content="Shribros, The Studio, 11010, Animation, Short movie, experimental movie, 2001" />
    <meta name="author" content="Shribros" />
    <link type="text/css" href='<%=ResolveClientUrl("../../CSS/body.TheStudio.css")%>' rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("html").scalableBackground("<%=Page.ResolveUrl("bg.jpg") %>", 2500, 1200);
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="DefaultBodyContentPlaceHolder" runat="Server">
    <div class="TheStudioList">
        <h1>LIVE ACTION</h1>
        <table>

            <tr>
                <td><a href="sevenkings.aspx">
                    <img src="Studio_Resources/poster_sevenkings.jpg" alt="Seven Kings Poster Image" /></a>
                    Seven Kings
                </td>
                <td><a href="boredom4.aspx">
                    <img src="Studio_Resources/poster_boredom4.jpg" alt="Boredom IV Downside Up Poster Image" /></a>
                    Boredom IV Downside Up
                </td>
                <td><a href="boredom3.aspx">
                    <img src="Studio_Resources/poster_boredom3.jpg" alt="Boredom III British Moon Poster Image" /></a>
                    Boredom III British Moon
                </td>
                <td><a href="boredom2.aspx">
                    <img src="Studio_Resources/poster_boredom2.jpg" alt="Boredom II The Buffaloes are Gone Poster Image" /></a>
                    Boredom II The Buffaloes Are Gone
                </td>

                <td><a href="blankversenow.aspx">
                    <img src="Studio_Resources/poster_blankversenow.jpg" alt="Blank Verse Now Poster Image" /></a>
                    Blank Verse Now
                </td>
                <td><a href="boredom1.aspx">
                    <img src="Studio_Resources/poster_boredom1.jpg" alt="Boredom I Angels Recite Poster Image" /></a>
                    Boredom I Angels Recite
                </td>
            </tr>
            <tr>
                <td><a href="quasi.aspx">
                    <img src="Studio_Resources/poster_quasi.jpg" alt="Quasi Poster Image" /></a>
                    Quasi
                </td>

                <td><a href="cinemapur.aspx">
                    <img src="Studio_Resources/poster_cinemapur.jpg" alt="Cinema Pur Poster Image" /></a>
                    Cinema Pur
                </td>
                <td><a href="saturate.aspx">
                    <img src="Studio_Resources/poster_saturate.jpg" alt="Saturate Poster Image" /></a>
                    Saturate
                </td>
                <td><a href="thotrangalbimbangal.aspx">
                    <img src="Studio_Resources/poster_thotrangalbimbangal.jpg" alt="Thotrangal Bimbangal Poster Image" /></a>
                    Thotrangal Bimbangal
                </td>
                <td><a href="whenthedevilsays.aspx">
                    <img src="Studio_Resources/poster_whenthedevilsaysiknowyou.jpg" alt="When the devil says I know you Poster Image" /></a>
                    When The Devil Says I Know You
                </td>
                <td><a href="cloudedtextures.aspx">
                    <img src="Studio_Resources/poster_cloudedtextures.jpg" alt="Clouded Textures Poster Image" /></a>
                    Clouded Textures
                </td>
            </tr>
            <tr>
                <td><a href="yourestillalive.aspx">
                    <img src="Studio_Resources/poster_youarestillalive.jpg" alt="You are still alive Poster Image" /></a>
                    You Are Still Alive
                </td>

                <td><a href="somesaytheworldwillendinfire.aspx">
                    <img src="Studio_Resources/poster_somesaytheworldwillendinfire.jpg" alt="Some say the world will end in fire Poster Image" /></a>
                    Some Say The World Will End In Fire
                </td>
                <td><a href="aprogressivecall.aspx">
                    <img src="Studio_Resources/poster_aprogressivecall.jpg" alt="A Progressive Call Poster Image" /></a>
                    A Progessive Call
                </td>
            </tr>
        </table>


        <h1>ANIMATED</h1>
        <table>
            <tr>
                <td><a href="falltorise.aspx">
                    <img src="Studio_Resources/poster_falltorise.jpg" alt="Fall To Rise Poster Image" /></a>
                    Another Sky
                </td>
                <td><a href="anothersky.aspx">
                    <img src="Studio_Resources/poster_anothersky.jpg" alt="Another Sky Poster Image" /></a>
                    Another Sky
                </td>
                <td><a href="verbaldispute.aspx">
                    <img src="Studio_Resources/poster_verbaldispute.jpg" alt="Verbal Dispute Poster Image" /></a>
                    Verbal Dispute
                </td>
                <td><a href="blossomsrevival.aspx">
                    <img src="Studio_Resources/poster_blossomsrevival.jpg" alt="Blossoms Revival Poster Image" /></a>
                    Blossoms Revival
                </td>
                <td><a href="exclusiveaorn.aspx">
                    <img src="Studio_Resources/poster_exclusiveaorn.jpg" alt="Exclusive AORN Poster Image" /></a>
                    Exclusive AORN
                </td>
                <td><a href="thecatastrophe.aspx">
                    <img src="Studio_Resources/poster_thecatastrophe.jpg" alt="The Catastrophe Poster Image" /></a>
                    The Catastrophe
                </td>

            </tr>
            <tr>
                <td><a href="deathsentence.aspx">
                    <img src="Studio_Resources/poster_deathsentence.jpg" alt="Death Sentence Poster Image" /></a>
                    Death Sentence
                </td>
                <td><a href="digitali.aspx">
                    <img src="Studio_Resources/poster_digitali.jpg" alt="Digital I Poster Image" /></a>
                    Digital I
                </td>
                <td><a href="11010.aspx">
                    <img src="Studio_Resources/Poster_11010.jpg" alt="11010 Poster Image" /></a>
                    11010
                </td>
            </tr>
        </table>

        <h1>PRODUCTIONS ONLY</h1>
        <table>
            <tr>
                <td><a href="letscolorit.aspx">
                    <img src="Studio_Resources/poster_letscolorit.jpg" alt="Lets Color It Poster Image" /></a>
                    <br />
                    Lets Color It
                </td>
                <td><a href="irulvelicham.aspx">
                    <img src="Studio_Resources/poster_irulvelicham.jpg" alt="Irul Velicham Poster Image" /></a>
                    <br />
                    Irul Velicham
                </td>
            </tr>
        </table>

        <h1>EARLIER TRIALS</h1>
        <table>
            <tr>
                <td><a href="serenity.aspx">
                    <img src="Studio_Resources/poster_serinity.jpg" alt="Serenity Poster Image" /></a>
                    <br />
                    Serenity
                </td>
                <td><a href="blossoms.aspx">
                    <img src="Studio_Resources/poster_blossoms.jpg" alt="Blossoms Poster Image" /></a>
                    <br />
                    Blossoms
                </td>
                <td><a href="thehowl.aspx">
                    <img src="Studio_Resources/poster_thehowl.jpg" alt="The Howl Poster Image" /></a>
                    <br />
                    The Howl
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

