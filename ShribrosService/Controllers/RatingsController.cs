using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Script.Serialization;
using ShribrosService.App_Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;

namespace ShribrosService.Controllers
{
    [RoutePrefix("ratings")]
    public class RatingsController:ApiController
    {
        [HttpGet]
        [Route("")]
        public omdbApi Get()
        {
            return new omdbApi();
        }

        [HttpGet]
        [Route("{movieId}")]
        public omdbApi Get(string movieId)
        {
            try
            {
                omdbApi movieData = null;
                string requestUriString = string.Format("http://www.omdbapi.com/?i={0}&r=json&plot=full",
                    movieId);
                WebRequest request = WebRequest.Create(requestUriString);
                using (var twitpicResponse = (HttpWebResponse)request.GetResponse())
                {
                    if (twitpicResponse.StatusCode == HttpStatusCode.OK)
                    {
                        Stream responseStream = twitpicResponse.GetResponseStream();
                        if (responseStream != null)
                        {
                            using (var reader = new StreamReader(responseStream))
                            {
                                var js = new JavaScriptSerializer();
                                var responseText = reader.ReadToEnd();
                                movieData = (omdbApi)js.Deserialize(responseText, typeof(omdbApi));
                            }
                        }
                    }
                }

                return movieData;
            }
            catch (Exception ex)
            {
                throw GetErrorResponse(ex);
            }
        }

        [HttpGet]
        [Route()]
        public List<string> GetAllMovieNames()
        {
            using (SqlConnection connection = new SqlConnection(
               ConfigurationManager.ConnectionStrings["shribrosdb"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("SELECT * FROM movie_ratings (NOLOCK)", connection);
                command.Connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                { }
            }
            
        }

        public static HttpResponseException GetErrorResponse(Exception ex)
        {
            var resp = new HttpResponseMessage(HttpStatusCode.InternalServerError)
            {
                Content = new StringContent(ex.Message),
            };
            return new HttpResponseException(resp);
        }
    }
}