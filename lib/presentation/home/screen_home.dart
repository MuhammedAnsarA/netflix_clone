import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';

import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
      },
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, value, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: SafeArea(
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.isError) {
                          return const Center(
                            child: Text("Error whilr getting data"),
                          );
                        } else if (state.pastYearMovieList.isEmpty ||
                            state.southIndianMovieList.isEmpty ||
                            state.tenseDramaMovieList.isEmpty ||
                            state.trendingMovieList.isEmpty ||
                            state.trendingTvList.isEmpty) {
                          return const Center(
                            child: Text("Loading"),
                          );
                        }
                        final _releasedPastYear =
                            state.pastYearMovieList.map((m) {
                          return "$imageAppendUrl${m.posterPath}";
                        }).toList();

                        final _trending = state.trendingMovieList.map((m) {
                          return "$imageAppendUrl${m.posterPath}";
                        }).toList();

                        final _tenseDramas = state.tenseDramaMovieList.map((m) {
                          return "$imageAppendUrl${m.posterPath}";
                        }).toList();

                        final _southIndianMovies =
                            state.southIndianMovieList.map((m) {
                          return "$imageAppendUrl${m.posterPath}";
                        }).toList();
                        // _southIndianMovies.shuffle();

                        final _top10List = state.trendingTvList.map((m) {
                          return "$imageAppendUrl${m.posterPath}";
                        }).toList();
                        return ListView(
                          children: [
                            BackgroundCard(
                                imageUrl: _releasedPastYear.first.toString()),
                            MainTitleCard(
                              title: "Released in the past year",
                              posterList: _releasedPastYear.sublist(10, 20),
                            ),
                            MainTitleCard(
                              title: "Trending Now",
                              posterList: _trending.sublist(5, 15),
                            ),
                            NumberTitleCard(
                              title: "Top 10 Tv Shows In India Today",
                              postersList: _top10List.sublist(0, 10),
                            ),
                            MainTitleCard(
                              title: "Tense Dramas",
                              posterList: _tenseDramas.sublist(7, 17),
                            ),
                            MainTitleCard(
                              title: "South Indian Cinema",
                              posterList: _southIndianMovies.sublist(3, 13),
                            ),
                          ],
                        );
                      },
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: double.infinity,
                            height: 80,
                            color: Colors.black.withOpacity(0.4),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    kWidth,
                                    Image.network(
                                      "https://static.vecteezy.com/system/resources/previews/017/396/804/original/netflix-mobile-application-logo-free-png.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.cast,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                    ),
                                    kWidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Tv Shows", style: kHomeTitleText),
                                    Text("Movies", style: kHomeTitleText),
                                    Text("Categories", style: kHomeTitleText),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : kHeight
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
