import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/new_and_hot/models/new_and_hot.dart';
import 'package:netflix_clone/domain/new_and_hot/repositories/i_hot_and_new_repo.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final IHotAndNewRepository _hotAndNewRepository;
  HotAndNewBloc(this._hotAndNewRepository) : super(HotAndNewState.initial()) {
    on<LoadDataInComingSoon>(
      (event, emit) async {
        emit(
          state.copyWith(
              comingSoonList: [],
              everyoneWatchingList: [],
              isError: false,
              isLoading: true),
        );
        final Either<MainFailure, HotAndNewResp> result =
            await _hotAndNewRepository.getHotAndNewMovieData();
        emit(
          result.fold(
            (failure) => state.copyWith(
                comingSoonList: [],
                everyoneWatchingList: [],
                isError: true,
                isLoading: false),
            (success) => state.copyWith(
              comingSoonList: success.results,
              everyoneWatchingList: state.everyoneWatchingList,
              isError: false,
              isLoading: false,
            ),
          ),
        );
      },
    );
    on<LoadDataInEveryonesWatching>(
      (event, emit) async {
        emit(
          state.copyWith(
            comingSoonList: [],
            everyoneWatchingList: [],
            isError: false,
            isLoading: true,
          ),
        );
        final Either<MainFailure, HotAndNewResp> result =
            await _hotAndNewRepository.getHotAndNewTvData();
        emit(
          result.fold(
            (failure) => state.copyWith(
                comingSoonList: [],
                everyoneWatchingList: [],
                isError: true,
                isLoading: false),
            (success) => state.copyWith(
              comingSoonList: state.comingSoonList,
              everyoneWatchingList: success.results,
              isError: false,
              isLoading: false,
            ),
          ),
        );
      },
    );
  }
}
