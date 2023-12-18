// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
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
      ],
    );
  }
}
