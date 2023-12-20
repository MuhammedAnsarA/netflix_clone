import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          title: const AppBarWidget(
            title: "New & Hot",
          ),
          bottom: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelColor: kBlackColor,
            labelStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(30),
            ),
            tabs: const [
              Tab(
                text: "🍿 Coming soon",
              ),
              Tab(
                text: "👀 Everyone's watching",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonList(key: Key("coming_soon")),
            EveronesWatchingList(key: Key("everyones_watching")),
          ],
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(
        const LoadDataInComingSoon(),
      );
    });
    return RefreshIndicator(
      color: kWhiteColor,
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(
          const LoadDataInComingSoon(),
        );
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text("Error while loading coming soon list"),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text("Coming soon list is empty"),
            );
          } else {
            return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = "";
                String date = "";
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formattedDate =
                      DateFormat.yMMMMd("en_US").format(_date!);
                  month = formattedDate
                      .split(" ")
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split("-")[1];
                } catch (_) {
                  month = "";
                  date = "";
                }

                return ComingSoonWidget(
                  day: date,
                  description: movie.overview ?? "No Description",
                  id: movie.id.toString(),
                  month: month,
                  movieName: movie.originalTitle ?? "No Title",
                  posterPath: "$imageAppendUrl${movie.backdropPath}",
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveronesWatchingList extends StatelessWidget {
  const EveronesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryonesWatching());
    });
    return RefreshIndicator(
      color: kWhiteColor,
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryonesWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text("Error while loading coming soon list"),
            );
          } else if (state.everyoneWatchingList.isEmpty) {
            return const Center(
              child: Text("Coming soon list is empty"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.everyoneWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyoneWatchingList[index];
                if (tv.id == null) {
                  return const SizedBox();
                }
                return EveronesWatchingWidget(
                  description: tv.overview ?? "No Description",
                  movieName: tv.originalName ?? "No Title",
                  posterPath: "$imageAppendUrl${tv.backdropPath}",
                );
              },
            );
          }
        },
      ),
    );
  }
}
