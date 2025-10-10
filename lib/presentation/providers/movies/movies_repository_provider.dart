

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_api/infrastructure/datasources/moviedb_datasource.dart';
import 'package:pelis_api/infrastructure/repositories/movie_repository_impl.dart';


// este repositorio es inmutable es de solo lectura, es decir listados
final movieRepositoryProvider = Provider((ref) {
    return MoviesRepositoryImpl(MoviedbDatasource());
});

