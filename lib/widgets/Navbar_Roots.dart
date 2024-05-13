import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/Home_Screen.dart';
import 'package:test/Messages_Screen.dart';
import 'package:test/Personal_Care_Screen.dart';
import 'package:test/Schedule_Screen.dart';
import 'package:test/Settings_Screen.dart';
import 'package:test/Bmi_Screen.dart';

class Navbar_Roots extends StatefulWidget {
  final User currentUser; // Use the User object here
  const Navbar_Roots({Key? key, required this.currentUser, required userName}) : super(key: key);

  @override
  State<Navbar_Roots> createState() => _Navbar_RootsState();
}

class _Navbar_RootsState extends State<Navbar_Roots> {
  int selectedIndex = 0;

  // Use the userName from the currentUser object
  String get userName => widget.currentUser.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff7165d6),
        unselectedItemColor: Colors.black26,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_text_fill),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_sharp),
            label: "BMI",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_sharp),
            label: "Personal care",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  List<Widget> get screens {
    return [
      Home_Screen(userName: userName, currentUser: widget.currentUser), // Pass the whole user
      Messages_Screen(),
      Schedule_Screen(),
      Bmi_Screen(),
      Personal_Care(),
      Settings_Screen(),
    ];
  }
}
