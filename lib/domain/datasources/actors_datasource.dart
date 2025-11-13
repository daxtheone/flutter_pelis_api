

import 'package:pelis_api/domain/entities/actor.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie( String movieId );
}
