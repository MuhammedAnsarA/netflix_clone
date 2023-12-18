import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kMainImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(icon: Icons.add, title: "My Label"),
              _PlayButton(),
              const CustomButtonWidget(
                icon: Icons.info,
                title: "Info",
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(kWhiteColor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: kBlackColor,
      ),
      label: const Text(
        "Play",
        style: TextStyle(fontSize: 20, color: kBlackColor),
      ),
    );
  }
}
