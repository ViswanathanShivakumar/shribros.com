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

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {

            $("html").scalableBackground("<%=Page.ResolveUrl("bg.jpg") %>", 2500, 1270);

            $("#ReviewInformationHeader").hide();
            $("#ReviewInformationBody").hide();

            $("#MovieRatingSearchTextBox").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "MovieRatings.aspx/AllMovieInfo",
                        data: "{'term':'" + $("#MovieRatingSearchTextBox").val().replace('\'', '|') + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (xhr, status) {
                            alert(xhr.status);
                        },
                    });
                },
                select: function (event, ui) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "MovieRatings.aspx/GetMovieInfo",
                        data: "{'term':'" + ui.item.value + "'}",
                        dataType: "json",
                        success: function (data) {
                            $("#ReviewInformationHeader").hide();
                            $("#ReviewInformationBody").hide();
                            var movieInfo = data.d.split('|');

                            //Update details
                            $('#Title').html('<h2>' + movieInfo[0] + '</h2>');
                            $('#SriramRating').html('<div style="width:' + movieInfo[18] * 4 + 'px; height:20px;background-color:#333333;color:#FFFFFF;padding-left:5px;" >' + movieInfo[18] + '</div>');
                            $('#SrivathsaRating').html('<div style="width:' + movieInfo[19] * 4 + 'px; height:20px;background-color:#333333;color:#FFFFFF;padding-left:5px;" >' + movieInfo[19] + '</div>');
                            $('#Year').html(movieInfo[1]);
                            $('#Rated').html(movieInfo[2]);
                            $('#Released').html(movieInfo[3]);
                            $('#Runtime').html(movieInfo[4]);
                            $('#Genre').html(movieInfo[5]);
                            $('#Director').html(movieInfo[6]);
                            $('#Writer').html(movieInfo[7]);
                            $('#Actors').html(movieInfo[8]);
                            $('#Plot').html(movieInfo[9]);
                            $('#Language').html(movieInfo[10]);
                            $('#Country').html(movieInfo[11]);
                            $('#Awards').html(movieInfo[12]);
                            $('#Metascore').html(movieInfo[14]);
                            $('#imdbRating').html(movieInfo[15]);
                            $('#imdbVotes').html(movieInfo[16]);

                            $.ajax({
                                url: movieInfo[13],
                                cache: true,
                                processData: false,
                            }).always(function () {
                                $("#Poster").html('<img src="' + movieInfo[13] + '" />').fadeIn();
                            });

                            $("#ReviewInformationHeader").show();
                            if (movieInfo[1] != '') {
                                $("#ReviewInformationBody").show();
                            }

                            $("#MovieRatingSearchTextBox").val('');
                            $("#MovieRatingSearchTextBox").focus();
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultBodyContentPlaceHolder" runat="Server">
    <form id="form2" runat="server" style="height: 400px;">
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

    </form>
</asp:Content>
