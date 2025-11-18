

import 'package:flutter_riverpod/legacy.dart';
import 'package:pelis_api/domain/entities/actor.dart';
import 'package:pelis_api/domain/entities/movie.dart';
import 'package:pelis_api/presentation/providers/actors/actors_repository_provider.dart';
import 'package:pelis_api/presentation/providers/movies/movies_repository_provider.dart';



final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String,List<Actor>>>((ref){
  final actorsRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});
/*
{
  '505642':  <Actor>[],
  '505001':  <Actor>[],
  '505002':  <Actor>[],
  '505003':  <Actor>[],
  '505004':  <Actor>[]
}
*/

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);



class ActorsByMovieNotifier extends StateNotifier<Map<String,List<Actor>>>{
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors
  }): super({});  // Creamos nuestro constructor y lo inicializamos con un mapa vacio


  Future<void> loadActors(String movieId) async {
    if( state[movieId] != null ) return; // para verificar si tenemos la pelicula en memoria, tambien podriamos hacer una validacion de fecha o tiempo de expiracion
    print('Realizando petición HTTP');
    final List<Actor> actors = await getActors(movieId);// aqui hacemos el get
    state = {...state, movieId:actors};
  }


}