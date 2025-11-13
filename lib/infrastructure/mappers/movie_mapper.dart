import 'package:pelis_api/domain/entities/movie.dart';
import 'package:pelis_api/infrastructure/models/moviedb/movie_moviedb.dart';

import '../models/moviedb/movie_details.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != '' ? 'https://image.tmdb.org/t/p/original/${moviedb.backdropPath}':'https://m.media-amazon.com/images/I/61s8vyZLSzL._UF894,1000_QL80_.jpg',
    genreIds: moviedb.genreIds.map((e)=>e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != '' ? 'https://image.tmdb.org/t/p/original/${moviedb.posterPath}' : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );


  static Movie movieDetailsToEntity( MovieDetails moviedb ) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != '' ? 'https://image.tmdb.org/t/p/original/${moviedb.backdropPath}':'https://m.media-amazon.com/images/I/61s8vyZLSzL._UF894,1000_QL80_.jpg',
    genreIds: moviedb.genres.map((e)=>e.name).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != '' ? 'https://image.tmdb.org/t/p/original/${moviedb.posterPath}' : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );



}
