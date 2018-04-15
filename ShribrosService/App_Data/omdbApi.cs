namespace ShribrosService.App_Data
{
    public class omdbApi
    {
        public string Title { get; set; }
        public string Year { get; set; }
        public string Rated { get; set; }
        public string Released { get; set; }
        public string Runtime { get; set; }
        public string Genre { get; set; }
        public string Director { get; set; }
        public string Writer { get; set; }
        public string Actors { get; set; }
        public string Plot { get; set; }
        public string Language { get; set; }
        public string Country { get; set; }
        public string Awards { get; set; }
        public string Poster { get; set; }

        public string Poster1
        {
            get { return string.Format("http://img.omdbapi.com/?i={0}&apikey={1}&h=400", imdbID, Config.OMDBAPIKey); }
        }

        public string Metascore { get; set; }
        public string imdbRating { get; set; }
        public string imdbVotes { get; set; }
        public string imdbID { get; set; }

        public string SearchResultString
        {
            get
            {
                return string.Join("|",
                    Title,
                    Year,
                    Rated,
                    Released,
                    Runtime,
                    Genre,
                    Director,
                    Writer,
                    Actors,
                    Plot,
                    Language,
                    Country,
                    Awards,
                    Poster,
                    Metascore,
                    imdbRating,
                    imdbVotes,
                    imdbID
                    );
            }
        }
    }
}