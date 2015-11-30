<%@ Page Title="" Language="C#" MasterPageFile="~/Links/Reviews/Reviews.master" %>
<%@ Import Namespace="Shribros.Website" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ReviewsHeaderContentPlaceHolder" runat="Server">
    <title>A Serious Man (2009), Movie Review</title>
    <meta name="description" content="Coen Bros. impress with another brilliant work of cinema." />
    <meta name="keywords" content="Shribros, A Serious Man, Coen Bros, 2009," />
    <meta name="author" content="Shribros" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ReviewsBodyContentPlaceHolder" runat="Server">
    <div itemscope itemtype="http://schema.org/Movie">
        <table>
            <tr>
                <td>
                    <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt1019452")%>" />
                </td>
                <td style="vertical-align: bottom;">
                    <h2><span itemprop="name">A Serious Man</span> | 2009</h2>
                    <p>Genre: <span itemprop="genre">Drama</span></p>
                    <p>Author : Srivathsa</p>
                </td>
            </tr>
        </table>
        <h4>Synopsis: Coen Bros. impress with another brilliant work of cinema.</h4>
        <p itemprop="review">
            <span itemprop="director">Ethan Coen and Joel Coen </span> are without doubt, one of the best film makers of this
            era. Right from "Blood Simple" to "Burn After Reading", every new movie from their
            camp comes out as a relentlessly bewildering cinematic brilliance. Their latest
            dramedy "A Serious Man" is one of their most matured works. It is darkly comic,
            very thoughtful and all the more a treat to watch and think.
        </p>
        <p>
            "A Serious Man" stands tall in its casting. Michael Stuhlbarg ,who plays Larry Gopnik,
            deserves an Oscar nomination for his performance as a man , who is very pious to
            his religion and canonical and doesn't commit any known crimes, but still suffers
            from pain in every instance. The Coen Bros' open , run and end the movie with no
            answer to these questions and if answered , they were extremely subtle. But, that
            again doesn't stop you from getting mesmerized with the near perfect screenplay
            that tops all the way.
        </p>
        <p>
            The film begins with a beautiful, haunting yet comical prologue,a Yiddish folktale,
            which again makes you gaze at the directors' mastery over their art.And the mastery
            continues over the protagonist's struggle as a teacher, as a husband, as a father,
            a brother and any other role he might take in his life. Even when he thinks and
            wonders , why Hashem (God) doesn't give him good, he doesn't complain, unlike his
            brother. He takes his worries to lawyers, Rabbis and only in vain. But the subtle
            comedy is a trademark of the Coens.
        </p>
        <p>
            Undeniably, in any Coens' film, the supporting actors play a splendid role and "A
            Serious Man" is no exception to this. All the characters are so perfectly etched
            from the sheer power of imagination and so deeply do they remain.<br />
        </p>
        <p>
            Many questions raise ; What is good and bad?; Why is Hashem doing all this? and
            many more. But not many answers and we cannot stop for ever to wait for the answers.
            Life must go on. In the final scene, Larry's son sees a tornado coming his way.
            It tells you everything. Kudos , Coens!
        </p>
    </div>
</asp:Content>
