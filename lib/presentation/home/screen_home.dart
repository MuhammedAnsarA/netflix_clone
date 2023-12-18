import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return Scaffold(
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
                  ListView(
                    children: const [
                      BackgroundCard(),
                      MainTitleCard(title: "Released in the past year"),
                      MainTitleCard(title: "Trending Now"),
                      NumberTitleCard(title: "Top 10 Tv Shows In India Today"),
                      MainTitleCard(title: "Tense Dramas"),
                      MainTitleCard(title: "South Indian Cinema"),
                    ],
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
    );
  }
}
