import 'package:flutter/material.dart';

class BuildItem extends StatelessWidget {
  final String icon;
  final String title;
  final double screenHeight;
  final double screenWidth;
  const BuildItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.screenHeight,
      required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      height: screenHeight * 0.06,
      width: screenWidth * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xff598BED),
        ),
      ),
      child: Row(
        children: [
          Container(
            child: Image.asset(
              icon,
            ),
          ),
          SizedBox(
            width: screenWidth * 0.02,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff598BED),
            ),
          ),
        ],
      ),
    );
  }
}
