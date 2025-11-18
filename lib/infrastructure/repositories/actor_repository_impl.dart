
import 'package:pelis_api/domain/datasources/actors_datasource.dart';
import 'package:pelis_api/domain/entities/actor.dart';
import 'package:pelis_api/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDatasource datasrouce;
  ActorRepositoryImpl(this.datasrouce);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
   return datasrouce.getActorsByMovie(movieId);
  }

}