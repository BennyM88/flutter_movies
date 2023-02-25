import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/common_widgets/custom_error_widget.dart';
import 'package:flutter_interview/common_widgets/empty_result_screen.dart';
import 'package:flutter_interview/common_widgets/loading_widget.dart';
import 'package:flutter_interview/di/dependencies.dart';
import 'package:flutter_interview/domain/movie/entities/movie_entity.dart';
import 'package:flutter_interview/network_configuration/result.dart';
import 'package:flutter_interview/presentation/pages/movie_list/bloc/movie_list_cubit.dart';
import 'package:flutter_interview/presentation/pages/movie_list/widgets/movie_list.dart';
import 'package:flutter_interview/presentation/pages/movie_list/widgets/search_box.dart';
import 'package:flutter_interview/presentation/routing/app_route.gr.dart';

class MovieListPage extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Movie Browser'),
        ),
        body: BlocBuilder<MovieListCubit, Result<List<MovieEntity>>>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                SearchBox(
                  onSubmitted: (keyword) => keyword.isEmpty
                      ? context.read<MovieListCubit>().init()
                      : context.read<MovieListCubit>().searchMovies(keyword),
                ),
                Expanded(
                  child: state.when(
                    () => Container(),
                    loading: () => const LoadingWidget(),
                    initial: () => Container(),
                    error: (String? message, _) => CustomErrorWidget(
                      retry: context.read<MovieListCubit>().init,
                      message: message,
                    ),
                    success: (data, isLoading) {
                      if (data is List<MovieEntity> && data.isEmpty) {
                        return EmptyResultScreen();
                      }
                      return MovieList(
                        scrollController:
                            context.read<MovieListCubit>().scrollController,
                        isLoading: isLoading == true,
                        movies: data,
                        onTap: (MovieEntity movie) {
                          AutoRouter.of(context).push(
                            MovieDetailsRoute(
                              movieId: movie.id,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => getIt<MovieListCubit>()..init(),
        child: this,
      );
}
