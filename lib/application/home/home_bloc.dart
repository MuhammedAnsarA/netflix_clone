import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/new_and_hot/models/new_and_hot.dart';
import 'package:netflix_clone/domain/new_and_hot/repositories/i_hot_and_new_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHotAndNewRepository _homeRepository;
  HomeBloc(this._homeRepository) : super(HomeState.initial()) {
    on<GetHomeScreenData>(
      (event, emit) async {
        // send loading to ui
        emit(state.copyWith(
          isLoading: true,
          isError: false,
        ));

        // get data
        final movieResult = await _homeRepository.getHotAndNewMovieData();
        final tvResult = await _homeRepository.getHotAndNewTvData();

        //transform data
        final _state1 = movieResult.fold(
          (MainFailure failure) {
            return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingMovieList: [],
              tenseDramaMovieList: [],
              southIndianMovieList: [],
              trendingTvList: [],
              isLoading: false,
              isError: true,
            );
          },
          (HotAndNewResp resp) {
            final pastYear = resp.results;
            pastYear.shuffle();
            final trending = resp.results;
            trending.shuffle();
            final dramas = resp.results;
            trending.shuffle();
            final southIndian = resp.results;
            southIndian.shuffle();

            return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: pastYear,
              trendingMovieList: trending,
              tenseDramaMovieList: dramas,
              southIndianMovieList: southIndian,
              trendingTvList: state.trendingTvList,
              isLoading: false,
              isError: false,
            );
          },
        );

        //send to ui
        emit(_state1);

        //transform data
        final _state2 = tvResult.fold(
          (MainFailure failure) {
            return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingMovieList: [],
              tenseDramaMovieList: [],
              southIndianMovieList: [],
              trendingTvList: [],
              isLoading: false,
              isError: true,
            );
          },
          (HotAndNewResp resp) {
            final to10List = resp.results;

            return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: state.pastYearMovieList,
              trendingMovieList: state.trendingMovieList,
              tenseDramaMovieList: state.tenseDramaMovieList,
              southIndianMovieList: state.southIndianMovieList,
              trendingTvList: to10List,
              isLoading: false,
              isError: false,
            );
          },
        );

        //send to ui
        emit(_state2);
      },
    );
  }
}
