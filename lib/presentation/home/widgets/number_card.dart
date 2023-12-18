import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uwrQHMnXD2DA1rvaMZk4pavZ3CY.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 10,
          child: BorderedText(
            strokeWidth: 4,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: GoogleFonts.roboto(
                  fontSize: 160,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
