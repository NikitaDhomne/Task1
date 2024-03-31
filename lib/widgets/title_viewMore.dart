import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWithViewMore extends StatelessWidget {
  String title;
  final Function() onViewMore;
  TitleWithViewMore({super.key, required this.title, required this.onViewMore});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lora(
                color: Color(0xff000000),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          InkWell(
              onTap: () {
                onViewMore();
              },
              child: Row(
                children: [
                  Text(
                    'View More',
                    style: GoogleFonts.inter(
                        color: Color(0xff6D747A),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 15,
                    color: Color(0xff6D747A),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
