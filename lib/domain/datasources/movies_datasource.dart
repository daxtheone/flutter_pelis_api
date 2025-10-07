
import 'package:pelis_api/domain/entities/movie.dart';

abstract class MovieDatasource {


  Future<List<Movie>> getNowPlaying({int page = 1});


}