
import 'package:pelis_api/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie( String movieId);
}