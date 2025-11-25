


import 'package:pelis_api/config/database/database.dart';
import 'package:pelis_api/domain/datasources/local_storage_datasrouce.dart';
import 'package:pelis_api/domain/entities/movie.dart';

class DriftDatasource extends LocalStorageDatasource{

  final AppDatabase database;

  DriftDatasource([AppDatabase? databaseToUse]) : database = databaseToUse ?? db;


  @override
  Future<bool> isFavoriteMovie(int movieId) async{
    // Construir el query
    final query = database.select(database.favoriteMovies)..where((table)=>table.movieId.equals(movieId));

    // Ejecutar el query
    final favoriteMovie = await query.getSingleOrNull();

    // Retornar el resutlado
    return favoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, int offset = 0}) {
    // TODO: implement loadFavoriteMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) async{
    final isFavorite = await isFavoriteMovie(movie.id);
    if(isFavorite){
      final deleteQuery = database.delete(database)
    }
  }
  
}
