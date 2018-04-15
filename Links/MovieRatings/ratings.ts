import { Component } from '@angular/core';

@Component({
  selector: 'sb-movieRatings',
  template: '<h1>MovieRatingsPage</h1>'
})

export class sbMovieRatingsComponent {
  SriramRating: string;
  SrivathsaRating: string;
  Year: number;
  Rated: string;
  Released: string;
  Runtime: string;
  Genre: string;
  Director: string;
  Writer: string;
  Actors: string;
  Language: string;
  Country: string;
  Awards: string;
  Metascore: string;
  imdbRating: string;
  imdbVote: string;

  private GetAllMovieNames():Array<string>
  {
    
  } 
}