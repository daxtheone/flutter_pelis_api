// este repositorio es inmutable es de solo lectura, es decir listados
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_api/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:pelis_api/infrastructure/repositories/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});

