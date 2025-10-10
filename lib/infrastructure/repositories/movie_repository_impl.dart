


import 'package:pelis_api/domain/datasources/movies_datasource.dart';
import 'package:pelis_api/domain/entities/movie.dart';
import 'package:pelis_api/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return this.datasource.getNowPlaying(page: page);
  }

}

