import 'package:flutter_interview/data/movie/models/movie_dto.dart';
import 'package:flutter_interview/domain/movie/entities/movie_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDtoToMovieEntityMapper {
  MovieEntity mapToEntity(MovieDto movieDto) => MovieEntity(
        id: movieDto.id,
        title: movieDto.title,
        voteAveragePercentage: (movieDto.voteAverage * 10).toInt(),
        posterPath: movieDto.posterPath,
        overview: movieDto.overview,
      );
}
