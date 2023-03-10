import 'package:flutter_interview/domain/movie/entities/movie_entity.dart';
import 'package:flutter_interview/domain/movie/repositories/movies_repository.dart';
import 'package:flutter_interview/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchMovieUseCase {
  final MoviesRepository repository;

  SearchMovieUseCase(this.repository);

  Future<Result<List<MovieEntity>>> searchMovie({
    String query = "",
    int page = 1,
    bool sortByVoteDesc = false,
  }) {
    return repository.searchMovie(
      query: query,
      page: page,
      sortByVoteDesc: sortByVoteDesc,
    );
  }
}
