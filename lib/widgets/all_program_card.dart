import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/models/cards_model.dart';

class AllProgramCard extends StatefulWidget {
  @override
  State<AllProgramCard> createState() => _AllProgramCardState();
}

class _AllProgramCardState extends State<AllProgramCard> {
  var all_programs = [
    Cards(
        title: 'A complete guide for your new born baby',
        image: 'images/lifestyle.png',
        subtitle: 'LIFESTYLE',
        lesson: '16 lessons'),
    Cards(
        title: 'Understanding of human behaviour',
        image: 'images/working_parent.png',
        subtitle: 'WORKING PARENTS',
        lesson: '12 lessons'),
    Cards(
        title: 'A complete guide for your new born baby',
        image: 'images/lifestyle.png',
        subtitle: 'LIFESTYLE',
        lesson: '16 lessons'),
    Cards(
        title: 'Understanding of human behaviour',
        image: 'images/working_parent.png',
        subtitle: 'WORKING PARENTS',
        lesson: '12 lessons'),
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQuery = MediaQuery.of(context);
    // var screenHeight = mediaQuery.size.height;
    // var screenWidth = mediaQuery.size.width;
    return Container(
      height: 330, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: all_programs.length, // Change the number of cards as needed
        itemBuilder: (context, index) {
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
                      all_programs[index].image, // Your image path
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
                        Text(all_programs[index].subtitle,
                            style: GoogleFonts.inter(
                                color: Color(0xff598BED),
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          all_programs[index].title,
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
                          all_programs[index].lesson,
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
        },
      ),
    );
  }
}
