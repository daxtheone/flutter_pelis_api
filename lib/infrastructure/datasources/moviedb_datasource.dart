import 'package:dio/dio.dart';

import 'package:pelis_api/config/constants/enviroment.dart';
import 'package:pelis_api/domain/datasources/movies_datasource.dart';
import 'package:pelis_api/domain/entities/movie.dart';
import 'package:pelis_api/infrastructure/mappers/movie_mapper.dart';
import 'package:pelis_api/infrastructure/models/moviedb/movie_details.dart';
import 'package:pelis_api/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String,dynamic> json){
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
        .where((e)=>e.posterPath != 'no-poster')  // funciona como middleware
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();
    return movies;
  }



  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
    queryParameters: {
          'page':page
        }
    );
   return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async{
    final response = await dio.get('/movie/popular',
        queryParameters: {
          'page':page
        }
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if(response.statusCode != 200 ) throw Exception('Movie with ID $id not found');
    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }





}
