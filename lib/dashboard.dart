import 'package:flutter/material.dart';
import 'package:task_1/screens/chat.dart';
import 'package:task_1/screens/home.dart';
import 'package:task_1/screens/hub.dart';
import 'package:task_1/screens/learn.dart';
import 'package:task_1/screens/profile.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    _pages = [
      {
        'page': Home(),
      },
      {
        'page': Learn(),
      },
      {
        'page': Hub(),
      },
      {
        'page': Chat(),
      },
      {'page': Profile()},
    ];

    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/Home.png')), label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/Book-open.png')),
              label: 'Learn'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/Layout.png')), label: 'Hub'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/Comment.png')), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xffffffff),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff598BED),
        unselectedItemColor: const Color(0xff6D747A),
        onTap: onTapped,
        elevation: 0,
      ),
    );
  }
}
