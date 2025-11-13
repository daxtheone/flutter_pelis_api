import 'package:pelis_api/domain/entities/actor.dart';
import 'package:pelis_api/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}' : 'https://i.pinimg.com/originals/15/0f/a8/150fa8800b0a0d5633abc1d1c4db3d87.jpg?nii=t',
    character: cast.character,
  );
}
