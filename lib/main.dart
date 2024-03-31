import 'package:flutter/material.dart';
import 'package:task_1/dashboard.dart';
import 'package:task_1/screens/lesson_screen.dart';
import 'package:task_1/screens/program_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Dashboard(),
        routes: {
          ProgramScreen.routeName: (context) => ProgramScreen(),
          LessonScreen.routeName: (context) => LessonScreen(),
        });
  }
}
