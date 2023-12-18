import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/5XVWHz5yiRoij9pW3Gb7qaeEYuu.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV"),
        kHeight,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
            shrinkWrap: true,
            childAspectRatio: 1 / 1.4,
            children: List.generate(20, (index) {
              return const MainCard();
            }),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
            image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
