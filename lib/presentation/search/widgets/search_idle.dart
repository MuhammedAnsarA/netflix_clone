import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/constants/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/fm6KqXpk3M2HVveHwCrBSSBaO0V.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Top Searches"),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const TopSearchItem(),
            separatorBuilder: (context, index) => kHeight20,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  const TopSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.45,
          height: MediaQuery.sizeOf(context).width * 0.25,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        kWidth,
        const Expanded(
          child: Text(
            "Movie Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          size: 35,
        )
      ],
    );
  }
}
