import 'package:flutter/material.dart';
import 'package:yallajeye/driver/tracking-cardNN.dart';

import '../constants/colors_textStyle.dart';
import '../driver/settings.dart';



class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final screens = [
    TrackingCardNN(),
    Settings(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: redColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: yellowColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'list'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
        ],
      ),
    );
  }
}
