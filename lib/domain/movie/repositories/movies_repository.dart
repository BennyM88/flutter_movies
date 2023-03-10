import 'package:flutter_interview/domain/movie/entities/movie_details_entity.dart';
import 'package:flutter_interview/domain/movie/entities/movie_entity.dart';
import 'package:flutter_interview/network_configuration/result.dart';

abstract class MoviesRepository {
  Future<Result<List<MovieEntity>>> searchMovie({
    String? query,
    int? page,
    bool? sortByVoteDesc,
  });

  Future<Result<MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  });
}
