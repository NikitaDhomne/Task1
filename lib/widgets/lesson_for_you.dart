import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonForYou extends StatelessWidget {
  final String category;
  final String name;
  final String duration;
  final bool? locked;
  LessonForYou(
      {super.key,
      required this.category,
      required this.name,
      required this.duration,
      required this.locked});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;
    return Container(
      width: screenWidth * 0.75, // Width of each card
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
                "images/exercise1.png", // Your image path
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
                  Text(category.toUpperCase(),
                      style: GoogleFonts.inter(
                          color: Color(0xff598BED),
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: screenHeight * 0.05,
                    child: Flexible(
                      child: Text(
                        name,
                        style: GoogleFonts.inter(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        softWrap: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        duration + " min",
                        style: GoogleFonts.inter(
                            color: Color(0xff6D747A),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      locked == true
                          ? Icon(Icons.lock_open) // Display unlocked icon
                          : Image.asset(
                              'images/lock.png') // Display locked icon
                    ],
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
