import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/domain/movie/entities/movie_details_entity.dart';
import 'package:flutter_interview/domain/movie/use_cases/get_movie_details_use_case.dart';
import 'package:flutter_interview/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailsCubit extends Cubit<Result<MovieDetailsEntity>> {
  MovieDetailsCubit(this.getMovieDetailsUseCase)
      : super(const Result.initial());

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  Future getMovieDetails(int movieId) async {
    var response =
        await getMovieDetailsUseCase.getMovieDetails(movieId: movieId);
    emit(response);
  }
}
