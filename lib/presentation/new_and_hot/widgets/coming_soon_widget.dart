import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FEB",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "11",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(imageUrl: kComingSoonTempImage),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TALL GIRL 2",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: "Remind Me",
                        iconSize: 22,
                        textSize: 11,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: "Info",
                        iconSize: 22,
                        textSize: 11,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              Text("Coming on Friday"),
              kHeight,
              Text(
                "TALL GIRL 2",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              kHeight,
              Text(
                "Landing the lead in the school musical is a \n dream come true for Jodi, until the pressure \n sends her confidence -- and her relationship -- \n into a tailspin.",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
