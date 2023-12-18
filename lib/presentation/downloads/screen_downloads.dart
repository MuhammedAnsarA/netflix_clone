import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetsList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: const AppBarWidget(title: "Downloads"),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => _widgetsList[index],
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: _widgetsList.length,
        ),
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(Icons.settings),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jFuH0md41x5mB4qj5344mSmtHrO.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/zgBW2eNkN0Ez09GgRaWret90C1T.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jLLtx3nTRSLGPAKl4RoIv1FbEBr.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Indroducing Downloads for you",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          "We will download a personalised selection of \n movies and shows for yo, so there's \n alwayssomething to watch on your \n device.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: MediaQuery.sizeOf(context).width * 0.33,
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 180, top: 0),
                angle: 15,
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 180, top: 0),
                angle: -15,
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(top: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            color: kButtonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          onPressed: () {},
          color: kWhiteColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: MediaQuery.sizeOf(context).width * 0.35,
        height: MediaQuery.sizeOf(context).width * 0.50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
