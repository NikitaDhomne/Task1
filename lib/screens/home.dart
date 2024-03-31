import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/apis/lesson_for_you_api.dart';
import 'package:task_1/apis/program_for_you_api.dart';
import 'package:task_1/models/lessons_model.dart';
import 'package:task_1/models/program_model.dart';
import 'package:task_1/screens/lesson_screen.dart';
import 'package:task_1/screens/program_screen.dart';

import 'package:task_1/widgets/all_program_card.dart';
import 'package:task_1/widgets/buildItem.dart';
import 'package:task_1/widgets/events_experience_card.dart';
import 'package:task_1/widgets/lesson_for_you.dart';
import 'package:task_1/widgets/title_viewMore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loader = false;
  ProgramForYouModel? listProgramForYou = ProgramForYouModel();
  LessonModel? listLessonForYou = LessonModel();

  void fetch() async {
    loader = true;
    listProgramForYou = await programforyouapi();
    listLessonForYou = await lessonforyouapi();
    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    super.initState();

    fetch();
  }

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
        body: loader
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                            title: 'Programs for you',
                            onViewMore: () {
                              Navigator.of(context)
                                  .pushNamed(ProgramScreen.routeName);
                            },
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            height: 330, // Adjust the height as needed
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listProgramForYou!.items!
                                  .length, // Change the number of cards as needed
                              itemBuilder: (context, index) {
                                return AllProgramCard(
                                  category: listProgramForYou!
                                      .items![index].category
                                      .toString(),
                                  name: listProgramForYou!.items![index].name
                                      .toString(),
                                  lessons: listProgramForYou!
                                      .items![index].lesson
                                      .toString(),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          TitleWithViewMore(
                            title: 'Events and experiences',
                            onViewMore: () {},
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          EventsExperienceCard(),
                          SizedBox(
                            height: 45,
                          ),
                          TitleWithViewMore(
                            title: 'Lessons for you',
                            onViewMore: () {
                              Navigator.of(context)
                                  .pushNamed(LessonScreen.routeName);
                            },
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            height: 350, // Adjust the height as needed
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listLessonForYou!.items!
                                  .length, // Change the number of cards as needed
                              itemBuilder: (context, index) {
                                return LessonForYou(
                                  category: listLessonForYou!
                                      .items![index].category
                                      .toString(),
                                  name: listLessonForYou!.items![index].name
                                      .toString(),
                                  duration: listLessonForYou!
                                      .items![index].duration
                                      .toString(),
                                  locked:
                                      listLessonForYou!.items![index].locked,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
