import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/downloads/repositories/i_download_repo.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

ValueNotifier<Set<int>> likedVideoIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downloadsRepo,
  ) : super(FastLaughState.initial()) {
    on<Initialize>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
            isError: false,
            videoList: [],
          ),
        );
        final result = await _downloadsRepo.getDownloadsImage();
        emit(
          result.fold(
            (failure) => state.copyWith(
              isError: true,
              isLoading: false,
              videoList: [],
            ),
            (success) => state.copyWith(
              isError: false,
              isLoading: false,
              videoList: success,
            ),
          ),
        );
      },
    );
  }
}
