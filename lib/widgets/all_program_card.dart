import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AllProgramCard extends StatefulWidget {
  final String category;
  final String name;
  final String lessons;

  const AllProgramCard(
      {super.key,
      required this.category,
      required this.name,
      required this.lessons});
  @override
  State<AllProgramCard> createState() => _AllProgramCardState();
}

class _AllProgramCardState extends State<AllProgramCard> {
  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQuery = MediaQuery.of(context);
    // var screenHeight = mediaQuery.size.height;
    // var screenWidth = mediaQuery.size.width;
    return Container(
      width: 280, // Width of each card
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.asset(
                "images/lifestyle.png", // Your image path
                height: 200, // Height of the image
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.category.toUpperCase(),
                      style: GoogleFonts.inter(
                          color: Color(0xff598BED),
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.name,
                    style: GoogleFonts.inter(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.lessons + " lessons",
                    style: GoogleFonts.inter(
                        color: Color(0xff6D747A),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
