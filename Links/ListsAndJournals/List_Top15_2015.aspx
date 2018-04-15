<%@ Page Title="" Language="C#" MasterPageFile="List.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ListsAndJournalHeaderContent" runat="Server">
    <title>Top 15 Movies of 2015</title>
    <meta name="description" content="List of the best 15 movies in 2015" />
    <style>
        .List li {
            height: 105px;
        }

        .List img {
            float: left;
            margin-right: 25px;
            border: 1px solid #636363;
            padding: 2px;
            background: #FFFFFF;
        }

        .List h2 {
            padding-top: 60px;
        }

        .List h3 {
            padding-top: 60px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ListsAndJournalBodyContent" runat="Server">
    <h1>Top 15 movies of 2015</h1>
    <ul class="List">
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt4374460",100)%>" />
            <h2>AFERIM!</h2>
            <h3>RADU JUDE</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt2330746",100)%>" /><h2>A GIRL WALKS HOME ALONE AT NIGHT</h2>
            <h3>ANA LILY AMIRPOUR</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt1883180",100)%>" /><h2>A PIGEON SAT ON A BRANCH REFLECTING EXISTENCE</h2>
            <h3>ROY ANDERSSON</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt3682448",100)%>" />
            <h2>BRIDGE OF SPIES</h2>
            <h3>STEVEN SPIELBERG</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt3717068",100)%>" />
            <h2>COURT</h2>
            <h3>CHAITANYA TAMHANE</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt4082068",100)%>" />
            <h2>DHEEPAN</h2>
            <h3>JACQUES AUDIARD</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt2884018",100)%>" />
            <h2>MACBETH</h2>
            <h3>JUSTIN KURZEL</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt3013610",100)%>" />
            <h2>MIA MADRE</h2>
            <h3>NANNI MORETTI</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt2328813",100)%>" />
            <h2>HARD TO BE A GOD</h2>
            <h3>ALEKSEY GERMAN</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt3460252",100)%>" />
            <h2>HATEFUL EIGHT, THE</h2>
            <h3>QUENTIN TARANTINO</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt2096673",100)%>" />
            <h2>INSIDE OUT</h2>
            <h3>PETE DOCTER, RONNIE DEL CARMEN</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt1392190",100)%>" />
            <h2>MAD MAX : FURY ROAD</h2>
            <h3>GEORGE MILLER</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt1663202",100)%>" />
            <h2>REVENANT, THE</h2>
            <h3>ALEJANDRO GONZALEZ INARRITU</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt2488496",100)%>" />
            <h2>STAR WARS: THE FORCE AWAKENS</h2>
            <h3>J J ABRAMS</h3>
        </li>
        <li>
            <img src="<%=IMDBMovieID.GetMoviePosterLinkFromID("tt4359416",100)%>" />
            <h2>TAXI</h2>
            <h3>JAFAR PANAHI</h3>
        </li>
    </ul>
    <h4>Close Calls</h4>
    <ul>
        <li>
            <h6>EX-MACHINA</h6>
        </li>
        <li>
            <h6>LOBSTER, THE</h6>
        </li>
        <li>
            <h6>MARTIAN, THE</h6>
        </li>
        <li>
            <h6>ROOM</h6>
        </li>
        <li>
            <h6>SPOTLIGHT</h6>
        </li>
        <li>
            <h6>THEEB</h6>
        </li>
        <li>
            <h6>VICTORIA</h6>
        </li>
        <li>
            <h6>WHEN MARNIE WAS THERE</h6>
        </li>
    </ul>
    <h4>Honorouble Mentions</h4>
    <ul>
        <li>
            <h6>ANOMALISA</h6>
        </li>
        <li>
            <h6>ASSASSIN, THE</h6>
        </li>
        <li>
            <h6>BIG SHORT, THE</h6>
        </li>
        <li>
            <h6>BROOKLYN</h6>
        </li>
        <li>
            <h6>BOY AND THE WORLD, THE</h6>
        </li>
        <li>
            <h6>CAROL</h6>
        </li>
        <li>
            <h6>CATCH ME DADDY</h6>
        </li>
        <li>
            <h6>KAJAKI (KILO TWO BRAVO)</h6>
        </li>
        <li>
            <h6>KRIGEN (A WAR)</h6>
        </li>
        <li>
            <h6>ME AND EARL AND THE DYING GIRL</h6>
        </li>
        <li>
            <h6>MISTRESS AMERICA</h6>
        </li>
        <li>
            <h6>MUSTANG</h6>
        </li>
        <li>
            <h6>PEANUTS MOVIE, THE</h6>
        </li>
        <li>
            <h6>PHOENIX</h6>
        </li>
        <li>
            <h6>SICARIO</h6>
        </li>
        <li>
            <h6>SLOW WEST</h6>
        </li>
        <li>
            <h6>STEVE JOBS</h6>
        </li>
        <li>
            <h6>WHILE WE'RE YOUNG</h6>
        </li>
    </ul>
    <h4>Notable Mentions</h4>
    <ul>
        <li>
            <h6>ANT-MAN</h6>
        </li>
        <li>
            <h6>BEASTS OF NO NATION</h6>
        </li>
        <li>
            <h6>LAVA</h6>
        </li>
        <li>
            <h6>GOOD DINOSAUR, THE</h6>
        </li>
        <li>
            <h6>MISSION IMPOSSIBLE : ROGUE NATION</h6>
        </li>
        <li>
            <h6>SANJAY'S SUPER TEAM</h6>
        </li>
        <li>
            <h6>SHAUN THE SHEEP</h6>
        </li>
        <li>
            <h6>TRAINWRECK</h6>
        </li>
        <li>
            <h6>WALK, THE</h6>
        </li>
        <li>
            <h6>X+Y (A BRILLIANT YOUNG MIND)</h6>
        </li>
    </ul>
</asp:Content>
