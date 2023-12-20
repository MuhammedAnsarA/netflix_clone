import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/downloads/repositories/i_download_repo.dart';
import 'package:netflix_clone/domain/search/models/search_response/search_response.dart';
import 'package:netflix_clone/domain/search/repositories/i_search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo;
  final ISearchRepo _searchRepo;
  SearchBloc(this._downloadsRepo, this._searchRepo)
      : super(SearchState.initial()) {
    on<Initialized>(
      (event, emit) async {
        if (state.idleList.isNotEmpty) {
          emit(SearchState(
              searchResultList: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false));
          return;
        }
        emit(
          state.copyWith(
            searchResultList: [],
            idleList: [],
            isError: false,
            isLoading: true,
          ),
        );
        final Either<MainFailure, List<Downloads>> result =
            await _downloadsRepo.getDownloadsImage();
        emit(
          result.fold(
            (failure) => state.copyWith(
              idleList: [],
              isError: true,
              isLoading: false,
              searchResultList: [],
            ),
            (success) => state.copyWith(
              idleList: success,
              isError: true,
              isLoading: false,
              searchResultList: [],
            ),
          ),
        );
      },
    );

    on<SearchMovie>((event, emit) async {
      emit(
        state.copyWith(
          searchResultList: [],
          idleList: [],
          isError: false,
          isLoading: true,
        ),
      );
      final Either<MainFailure, SearchResponse> result =
          await _searchRepo.searchMovies(movieQuery: event.movieQuery);
      emit(
        result.fold(
          (failure) => state.copyWith(
            searchResultList: [],
            idleList: [],
            isError: true,
            isLoading: false,
          ),
          (success) => state.copyWith(
            searchResultList: success.results,
            idleList: [],
            isError: false,
            isLoading: false,
          ),
        ),
      );
    });
  }
}
