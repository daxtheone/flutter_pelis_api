

import 'package:flutter_riverpod/legacy.dart';
import 'package:pelis_api/domain/entities/movie.dart';
import 'package:pelis_api/presentation/providers/movies/movies_repository_provider.dart';



final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref){
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});
/*
{
  '505642': Movie(),
  '505001': Movie(),
  '505002': Movie(),
  '505003': Movie(),
  '505004': Movie()
}
*/

typedef GetMovieCallback = Future<Movie>Function(String movieId);



class MovieMapNotifier extends StateNotifier<Map<String,Movie>>{
  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie
  }): super({});  // Creamos nuestro constructor y lo inicializamos con un mapa vacio


  Future<void> loadMovie(String movieId) async {
    if( state[movieId] != null ) return; // para verificar si tenemos la pelicula en memoria, tambien podriamos hacer una validacion de fecha o tiempo de expiracion
    print('Realizando petición HTTP');
    final movie = await getMovie(movieId);// aqui hacemos el get
    state = {...state, movieId:movie};
  }


}