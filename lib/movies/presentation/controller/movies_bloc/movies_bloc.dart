import 'package:bloc/bloc.dart';

import '../../../data/data_source/movies_remote_data_source.dart';
import '../../../data/repository/movies_repository.dart';
import '../../../domain/repository/base_movies_repository.dart';
import '../../../domain/usecases/get_now_playing_usecase.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

import '../../../../core/utils/enums.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRateMoviesUseCase getTopRateMoviesUseCase;
  MoviesBloc(this.getNowPlayingUseCase, this.getPopularMoviesUseCase,
      this.getTopRateMoviesUseCase)
      : super(MoviesState()) {
    BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
        MoviesRemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(
        baseMoviesRemoteDataSource: baseMoviesRemoteDataSource);
    /////////////////get Now Playing Movies
    on<GetNowPlayingEvent>((event, emit) async {
      final result =
          await GetNowPlayingUseCase(baseMoviesRepository: baseMoviesRepository)
              .execute();

      result.fold((l) {
        emit(
          state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          ),
        );
      },
          (r) => {
                emit(
                  state.copyWith(
                    nowPlayingState: RequestState.loaded,
                    nowPlayingMovies: r,
                  ),
                ),
              });
    });
    /////////////////// Popular Movies Date
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
      result.fold((l) {
        emit(
          state.copyWith(
            popularPlayingState: RequestState.error,
            popularPlayingMessage: l.message,
          ),
        );
      },
          (r) => {
                emit(
                  state.copyWith(
                    popularPlayingState: RequestState.loaded,
                    popularPlayingMovies: r,
                  ),
                ),
              });
    });
    ///////Get Top Rating Movies
    on<GetTopRatedEvent>((event, emit) async {
      final result = await getTopRateMoviesUseCase.execute();
      result.fold((l) {
        emit(state.copyWith(
          topRatingPlayingState: RequestState.error,
          topRatingPlayingMessage: l.message,
        ));
      },
          (r) => {
                emit(
                  state.copyWith(
                    topRatingPlayingState: RequestState.loaded,
                    topRatingPlayingMovies: r,
                  ),
                ),
              });
    });
  }
}
