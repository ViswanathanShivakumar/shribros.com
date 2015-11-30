<%@ Page Title="" Language="C#" MasterPageFile="~/Links/Reviews/Reviews.master" %>
<%@ Import Namespace="Shribros.Website" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ReviewsHeaderContentPlaceHolder" runat="Server">
    <title>Jurassic World (2015), Movie Review</title>
    <meta name="description" content="Jurassic world is a disappointing entry, but fun, nevertheless" />
    <meta name="keywords" content="Movies, Reviews, Movie reviews, Jurassic World, 2015, Colin Treverrow, Steven Spielberg" />
    <meta name="author" content="Shribros" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ReviewsBodyContentPlaceHolder" runat="Server">
    <div itemscope itemtype="http://schema.org/Movie">
        <table>
            <tr>
                <td>
                    <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID(IMDBMovieID.JurassicWorld)%>" />
                </td>
                <td style="vertical-align: bottom;">
                    <h2><span itemprop="name">Jurassic World</span> | 2015</h2>
                    <p>Genre: <span itemprop="genre">Adventure, Thriller</span></p>
                    <p>Author : Srivathsa</p>
                </td>
            </tr>
        </table>
        <h4>Synopsis: Jurassic world is a disappointing entry, but fun, nevertheless</h4>
        <p itemprop="review">
            Writing on the fourth episode of the “<span itemtype="http://schema.org/Movie" itemprop="name">Jurassic Park</span>” franchise, is very important to us. I was 11, when I watched <span itemtype="director">Steven Spielberg’s</span> jaw-dropping adventure thriller “Jurassic Park”. “Jurassic Park” is one of the major reasons, We're watching movies, writing about them and creating (short) films. It motivated us, like no other movie has ever done and that is why it is very imperative to pour down our thoughts on its latest instalment which in many ways is a revamp of the first, skipping the other two parts,, “The Lost world”, which we consider very good, though not as intimate as the first and the mostly ridiculous, but entertaining “Jurassic Park III”. Now, we’ve grown up and the way we watch movies have changed. We now, understand the language better. And still “Jurassic park” remains one of the best movies ever made and one of our favorites. <span itemprop="director">Colin Trevorrow’s</span>“Jurassic World” that falls into the era of reboot of these film series, attempts to cover up the flaws of the sequels, while falling into the same trap as others, even worse.
        </p>
        <p>
            Chris Pratt plays Owen, the raptor tamer (dino whisperer), <span itemprop="actor">Bryce Dallas</span> Howard as Claire, a typical stereo typed top level Jurassic World employee and Nick Robinson as Zach and Ty Simpkins as Gray, her nephews. All these characters are shallow, predictable and heavily clichéd. Whilst forbearing them, we wouldn’t be still be able to do it with characters like Vincent D’Onofrio playing a heavily cartoonish villain, Hoskins. While the creators might think it might not matter with the characters, when you got CG laden “extremely dangerous violent” dinosaurs, it in actuality is vital and that’s what made Spielberg’s first, the best. Irfan Khan keeps low and does his uninterested performance, as Masraani. The best two characters and performances were Jake Johnson and Lauren Lapkus as the control room operators. They did pretty well and so were their characters. 
        </p>
        <p>
            Undeniably, there are great moments like the terrifying sequence of Zara preyed on by the pterodactyls, letting out of Indominus Rex and the final-act-peak moment, but no “Wow” moments that would swept you off. Often, there was a feeling out too many homages and also substantial feeling of the dinosaurs being still digital. It was very good fun, yet not remarkable or spectacular. The cinematography was not as intimate as it could’ve been and we don’t get that “being there” mood. With outlandish ideas, unimaginative story, “Jurassic World” falls short of the expectations and we place it just above “Jurassic Park III” in the third position, as we rate the series.
        </p>
        <p>
            “Jurassic World” is definitely a decent pop-corn entertainer and a summer blockbuster, but with a lot of ridiculous moments (oh! That kissing scene amidst killer dinosaurs flying around) that make us cringe a bit. Colin Trevorrow can be appreciated for his effort and commitment to the reboot, but how does it matter, when you bring a sloppy script on screen. Nevertheless, “Jurassic World” substantially re-ignites the series ,as we lay back relaxed with a hope of “Jurassic World 2” being directed with a better script by a better director who can look through the loop holes well; perhaps J.J.Abrams or the master himself? 
        </p>
    </div>

</asp:Content>
