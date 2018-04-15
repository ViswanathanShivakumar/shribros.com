<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeFile="MovieRatings.aspx.cs"
    Inherits="Links_MovieRatings"
    MasterPageFile="~/Default.master" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="DefaultHeadContentPlaceHolder" runat="Server">
        <title>Movie Ratings</title>

        <meta name="description" content="Provides an exhaustive list of ratings for movies." />
        <meta name="keywords" content="Shribros, Movie Reviews, 12 Years a slave" />
        <meta name="author" content="Shribros" />

        <script src="node_modules/core-js/client/shim.min.js"></script>
        <script src="node_modules/zone.js/dist/zone.js"></script>
        <script src="node_modules/reflect-metadata/Reflect.js"></script>
        <script src="node_modules/systemjs/dist/system.src.js"></script>
        <!-- 2. Configure SystemJS -->
        <script src="systemjs.config.js"></script>
        <script>
            /*$(document).ready(function() {
                                                $("html").scalableBackground("<%=Page.ResolveUrl("                            bg.jpg ") %>, 2500, 1270);
                                                });*/

            System.import('main.js').catch(function(err) {
                console.error(err);
            });
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="DefaultBodyContentPlaceHolder" runat="Server">
        <sb-movieRatings>Loading</sb-movieRatings>
        <!--<form id="form2" runat="server" style="height: 400px;">
            <input type="text" id="MovieRatingSearchTextBox" class="SearchTextbox" />
            <table style="margin: 10px 20px 10px 0px;" id="ReviewInformationHeader">
                <tr>
                    <td colspan="2">
                        <div id="Title"></div>
                    </td>
                </tr>
                <tr>
                    <td>Sriram</td>
                    <td>
                        <div id="SriramRating"></div>
                    </td>
                </tr>
                <tr>
                    <td>Srivathsa</td>
                    <td>
                        <div id="SrivathsaRating"></div>
                    </td>
                </tr>
            </table>
            <table id="ReviewInformationBody">
                <tr>
                    <td rowspan="15">
                        <div id="Poster"></div>
                    </td>
                    <td>Year</td>
                    <td>
                        <div id="Year"></div>
                    </td>
                </tr>
                <tr>
                    <td>Rated</td>
                    <td>
                        <div id="Rated"></div>
                    </td>
                </tr>
                <tr>
                    <td>Released</td>
                    <td>
                        <div id="Released"></div>
                    </td>
                </tr>
                <tr>
                    <td>Runtime</td>
                    <td>
                        <div id="Runtime"></div>
                    </td>
                </tr>
                <tr>
                    <td>Genre</td>
                    <td>
                        <div id="Genre"></div>
                    </td>
                </tr>
                <tr>
                    <td>Director</td>
                    <td>
                        <div id="Director"></div>
                    </td>
                </tr>
                <tr>
                    <td>Writer</td>
                    <td>
                        <div id="Writer"></div>
                    </td>
                </tr>
                <tr>
                    <td>Actors</td>
                    <td>
                        <div id="Actors"></div>
                    </td>
                </tr>
                <tr>
                    <td>Language</td>
                    <td>
                        <div id="Language"></div>
                    </td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>
                        <div id="Country"></div>
                    </td>
                </tr>
                <tr>
                    <td>Awards</td>
                    <td>
                        <div id="Awards"></div>
                    </td>
                </tr>
                <tr>
                    <td>Metascore</td>
                    <td>
                        <div id="Metascore"></div>
                    </td>
                </tr>
                <tr>
                    <td>imdbRating</td>
                    <td>
                        <div id="imdbRating"></div>
                    </td>
                </tr>
                <tr>
                    <td>imdbVotes</td>
                    <td>
                        <div id="imdbVotes"></div>
                    </td>
                </tr>
            </table>

            <div id="Plot" class="Quote"></div>

        </form>-->
    </asp:Content>