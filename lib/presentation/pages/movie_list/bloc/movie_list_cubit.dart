import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/domain/movie/entities/movie_entity.dart';
import 'package:flutter_interview/domain/movie/use_cases/search_movie_use_case.dart';
import 'package:flutter_interview/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieListCubit extends Cubit<Result<List<MovieEntity>>> {
  final SearchMovieUseCase searchMovieUseCase;
  final ScrollController scrollController = ScrollController();
  List<MovieEntity> allMovies = [];
  int pageIndex = 2;
  bool canLoad = true;

  MovieListCubit(this.searchMovieUseCase) : super(const Result.initial()) {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        fetchMovies(pageIndex++);
      }
    });
  }

  void fetchMovies(int page) async {
    if (state is! Success || !canLoad) return;
    allMovies = (state as Success).data;

    emit(Result.success(allMovies, isLoading: true));

    Result<List<MovieEntity>> response =
        await searchMovieUseCase.searchMovie(query: "spider-man", page: page);

    if (response is! Success) return;
    List<MovieEntity> tmpMovies =
        List<MovieEntity>.from((response as Success).data);

    if (tmpMovies.isEmpty) canLoad = false;
    allMovies.addAll(tmpMovies);

    emit(Result.success(allMovies, isLoading: false));
  }

  void init() async {
    emit(const Result.loading());

    Result<List<MovieEntity>> response =
        await searchMovieUseCase.searchMovie(query: "spider-man");
    emit(response);
  }

  void searchMovies(String keyword) async {
    if (state is Loading) return;
    emit(const Result.loading());

    Result<List<MovieEntity>> result =
        await searchMovieUseCase.searchMovie(query: keyword);
    emit(result);
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
