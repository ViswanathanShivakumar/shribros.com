<%@ Page Title="" Language="C#" MasterPageFile="~/Links/Reviews/Reviews.master" %>
<%@ Import Namespace="Resources" %>

<script language="c#" runat="server">
    private string Name { get { return "Mission: Impossible - Ghost Protocol"; } }
    private string Year { get { return "2011"; } }
    private string Author { get { return "Srivathsa"; } }
    private string Genre { get { return "Action"; } }
    private string Synopsis { get { return "Brad Bird makes one helluva entertainer."; } }   
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ReviewsHeaderContentPlaceHolder" runat="Server">
    <title><% = OMDBID.ASeriousMan %> (<% =Year %>), Movie Review</title>
    <meta name="description" content="<% =Synopsis %>" />
    <meta name="keywords" content="Shribros, Mission Impossible : The Ghost Protocol, Brad Bird, 2011,Incredible, Ratatouille, The Iron Giant, Ethan Hunt, Jeremy Renner, Simon Pegg, Tom Cruise, Michelle Monaghan, Burj, Dubai, India, Mumbai, Kremlin, Russia, prison" />
    <meta name="author" content="Shribros" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ReviewsBodyContentPlaceHolder" runat="Server">
    <table>
        <tr>
            <td>
                <img src="<%=IMDBMovieID.GetMoviePosterLink(Name)%>" />
            </td>
            <td style="vertical-align: bottom;">
                <h2><% =Name %> | <%=Year %></h2>
                <p>Genre: <% =Genre %></p>
                <p>Author : <% =Author %></p>
            </td>
        </tr>
    </table>
    <h4>Synopsis: <% =Synopsis %></h4>
    <p>
        Mission Impossible, for me, once was a franchise that I didn’t really care about, significantly. 
          Be it Brian De Palma’s hasty first installment, or John Woo, muddled, but chic second chapter. 
          But it was J J Abrams, third that made me sneak a look into the franchise.
           And now, Brad Bird’s breathtaking jaunt makes me wait for the next; 
          But, how did he make that happen is what I’m going to spew out now.
    </p>
    <p>
        All and sundry, I take for granted,  knows Ethan Hunt, played but still young in looks , Tom Cruise and with him,
          is the gang of “impossible” makers, Brandt (played fabulously by Jeremy Renner), 
          Benji (the resplendently uproarious Simon Pegg) and Jane (played by Paula Patton).
           But now the IMF is shutdown , with a bombing in Kremlin and the team sets off to prove with what is left.
            With nothing of a new theme for a Mission Impossible mission, Brad Bird, kicks it off with his fantastic,
      enthralling direction.
    </p>
    <p>
        And the best, first; The Burj action sequence;
        It is the best I’ve seen this year; may be ever? I’m just thinking of an action scene,
         which is so enormously transfixing; making you sweat, with your nerves getting rattled 
         and that also makes your vertigo pop up. Two Thumbs Up! And then there is the intelligent projection 
         scene at the Kremlin; Right at the moment, the films kicks off in the Russian Prison, we all know, 
         Brad Bird (the gifted director of “The Incredibles”,”Iron Giant” and “Ratatouille”) is at work.<br />
    </p>
    <p>
        But then, I have a problem. Yes, right after the Dubai episode and as they team lands in India. 
        The problems to the team might have come to an end, but not to the director. 
        Firstly, most of the scenes were shot in Dubai, Vancouver (Canada), and a non-Mumbai part of India, 
        but being shown as Mumbai. (For the Indian fans: And where was Anil Kapoor? Was he even there?). 
        Also, the cultural furrow by the Hollywood yet again. Even with no offense inhaled, No!
         India is not what they show and still their India is a mental perspective of what it really is.
          Secondly, Bird turns up towards the old Mission Impossible way of doing things. 
          Bird, probably should have realized that the Dubai Episode had worked out better 
          and should have been placed towards the end, at least to make the audience not crib, when they go out.
         Alas! When on paper, you might not realize that
    </p>
    <p>
        Now, when I realize what the movie had to offer, with its superb direction, 
       the India episode did not matter to me. At the end of the day, I was intensely occupied, emotionally too. 
       Mission Impossible : The Ghost Protocol, is a deftly directed movie by Brad Bird, that misses being one of
        the finest action pictures  ever made by a whisker; But then it still , 
       I feel remains as the best Mission Impossible movie yet.
    </p>

</asp:Content>
