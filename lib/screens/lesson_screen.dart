import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/apis/lesson_for_you_api.dart';

import 'package:task_1/models/lessons_model.dart';

class LessonScreen extends StatelessWidget {
  static const routeName = '/lesson';
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loader = false;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xffeef3fd),
            elevation: 0,
            toolbarHeight: 70,
            title: Text("Lessons For You")),
        body: FutureBuilder<LessonModel>(
          future: lessonforyouapi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.items!.length,
                  itemBuilder: ((context, index) => Container(
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
                                    Text(
                                        snapshot.data!.items![index].category!
                                            .toUpperCase(),
                                        style: GoogleFonts.inter(
                                            color: Color(0xff598BED),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data!.items![index].name!
                                          .toString(),
                                      style: GoogleFonts.inter(
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                      softWrap: true,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data!.items![index].duration!
                                                  .toString() +
                                              " min",
                                          style: GoogleFonts.inter(
                                              color: Color(0xff6D747A),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        snapshot.data!.items![index].locked ==
                                                true
                                            ? Icon(Icons
                                                .lock_open) // Display unlocked icon
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
                      )));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
