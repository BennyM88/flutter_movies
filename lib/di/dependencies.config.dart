// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_interview/data/movie/mapper/movie_details_dto_to_movie_details_entity_mapper.dart'
    as _i5;
import 'package:flutter_interview/data/movie/mapper/movie_dto_to_movie_entity_mapper.dart'
    as _i6;
import 'package:flutter_interview/data/movie/network/movie_client.dart' as _i4;
import 'package:flutter_interview/data/movie/services/movies_repository_impl.dart'
    as _i8;
import 'package:flutter_interview/domain/movie/repositories/movies_repository.dart'
    as _i7;
import 'package:flutter_interview/domain/movie/use_cases/get_movie_details_use_case.dart'
    as _i11;
import 'package:flutter_interview/domain/movie/use_cases/search_movie_use_case.dart'
    as _i9;
import 'package:flutter_interview/presentation/pages/movie_details/bloc/movie_details_cubit.dart'
    as _i12;
import 'package:flutter_interview/presentation/pages/movie_list/bloc/movie_list_cubit.dart'
    as _i13;
import 'package:flutter_interview/presentation/pages/should_watch/bloc/should_watch_cubit.dart'
    as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../network_configuration/dio_setup.dart' as _i14;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioSetup = _$DioSetup();
  gh.factory<_i3.Dio>(() => dioSetup.dio);
  gh.singleton<_i4.MovieClient>(_i4.MovieClient(gh<_i3.Dio>()));
  gh.factory<_i5.MovieDetailsDtoToMovieEntityMapper>(
      () => _i5.MovieDetailsDtoToMovieEntityMapper());
  gh.factory<_i6.MovieDtoToMovieEntityMapper>(
      () => _i6.MovieDtoToMovieEntityMapper());
  gh.singleton<_i7.MoviesRepository>(_i8.MoviesRepositoryImpl(
    gh<_i4.MovieClient>(),
    gh<_i6.MovieDtoToMovieEntityMapper>(),
    gh<_i5.MovieDetailsDtoToMovieEntityMapper>(),
  ));
  gh.factory<_i9.SearchMovieUseCase>(
      () => _i9.SearchMovieUseCase(gh<_i7.MoviesRepository>()));
  gh.factory<_i10.ShouldWatchCubit>(() => _i10.ShouldWatchCubit());
  gh.factory<_i11.GetMovieDetailsUseCase>(
      () => _i11.GetMovieDetailsUseCase(gh<_i7.MoviesRepository>()));
  gh.factory<_i12.MovieDetailsCubit>(
      () => _i12.MovieDetailsCubit(gh<_i11.GetMovieDetailsUseCase>()));
  gh.factory<_i13.MovieListCubit>(
      () => _i13.MovieListCubit(gh<_i9.SearchMovieUseCase>()));
  return getIt;
}

class _$DioSetup extends _i14.DioSetup {}
