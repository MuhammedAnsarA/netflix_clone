import 'package:flutter/material.dart';

class MainCardd extends StatelessWidget {
  const MainCardd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
              "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/91wVL2amQouWhbMfvrVeFNrrHmR.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
