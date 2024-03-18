import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/widgets/all_program_card.dart';
import 'package:task_1/widgets/buildItem.dart';
import 'package:task_1/widgets/events_experience_card.dart';
import 'package:task_1/widgets/lesson_for_you.dart';
import 'package:task_1/widgets/title_viewMore.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xffeef3fd),
          elevation: 0,
          toolbarHeight: 70,
          title: Container(
            height: screenHeight * 0.1,
            width: screenWidth * 0.1,
            child: Image.asset(
              'images/Menu.png',
              height: screenHeight * 0.1,
              width: screenWidth * 0.1,
            ),
          ),
          centerTitle: false,
          actions: [
            Image.asset(
              'images/message.png',
              height: screenHeight * 0.2,
              width: screenWidth * 0.12,
            ),
            Image.asset(
              'images/Notification.png',
              height: screenHeight * 0.04,
              width: screenWidth * 0.12,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Color(0xffeef3fd),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      Text("Hello, Priya!",
                          style: GoogleFonts.lora(
                              color: Color(0xff08090A),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 7,
                      ),
                      Text("What do you wanna learn today?",
                          style: GoogleFonts.inter(
                              color: Color(0xff6D747A),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              BuildItem(
                                icon: "images/program.png",
                                title: 'Programs',
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BuildItem(
                                icon: "images/learn.png",
                                title: 'Learn',
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              BuildItem(
                                icon: 'images/help.png',
                                title: 'Get help',
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BuildItem(
                                icon: 'images/ddtracker.png',
                                title: 'DD Tracker',
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 55,
                      )
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    TitleWithViewMore(
                        title: 'Programs for you', routeName: () {}),
                    SizedBox(
                      height: 35,
                    ),
                    AllProgramCard(),
                    SizedBox(
                      height: 45,
                    ),
                    TitleWithViewMore(
                        title: 'Events and experiences', routeName: () {}),
                    SizedBox(
                      height: 35,
                    ),
                    EventsExperienceCard(),
                    SizedBox(
                      height: 45,
                    ),
                    TitleWithViewMore(
                        title: 'Lessons for you', routeName: () {}),
                    SizedBox(
                      height: 35,
                    ),
                    LessonForYou()
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
