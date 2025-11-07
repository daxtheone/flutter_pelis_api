import 'package:dio/dio.dart';

import 'package:pelis_api/config/constants/enviroment.dart';
import 'package:pelis_api/domain/datasources/movies_datasource.dart';
import 'package:pelis_api/domain/entities/movie.dart';
import 'package:pelis_api/infrastructure/mappers/movie_mapper.dart';
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

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
    queryParameters: {
          'page':page
        }
    );
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where((e)=>e.posterPath != 'no-poster')  // funciona como middleware
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();
    return movies;
  }
}
