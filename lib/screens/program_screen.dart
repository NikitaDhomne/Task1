import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/apis/program_for_you_api.dart';
import 'package:task_1/models/program_model.dart';

class ProgramScreen extends StatelessWidget {
  static const routeName = '/program';
  const ProgramScreen({super.key});

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
            title: Text("Programs For You")),
        body: FutureBuilder<ProgramForYouModel>(
          future: programforyouapi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.items!.length,
                  itemBuilder: ((context, index) => Container(
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
                                    Text(
                                      snapshot.data!.items![index].lesson!
                                              .toString() +
                                          " lessons",
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
                      )));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
