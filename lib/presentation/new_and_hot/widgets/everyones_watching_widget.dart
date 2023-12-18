import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveronesWatchingWidget extends StatelessWidget {
  const EveronesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          "Friends",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight,
        Text(
          "This hit sitcome follows the merry misadventures of six \n 20-something pals as they navigate the pitfalls of \n work, life and love in 1990s Manhattan.",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 50,
        ),
        VideoWidget(imageUrl: kEveryonesWatchingTempImage),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth20,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth20,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}
