import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
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
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveronesWatchingWidget(),
    );
  }
}
