import 'package:flutter/material.dart';
import 'package:grocery_app_ui/view/otherscreens/email_screen.dart';
import 'package:grocery_app_ui/view/home/home_screen.dart';
import 'package:grocery_app_ui/view/otherscreens/insert_chart_Screen.dart';
import 'package:grocery_app_ui/view/otherscreens/profile_screen.dart';
import 'package:grocery_app_ui/view/otherscreens/qr_scanner_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    InsertChartScreen(),
    QrScannerScreen(),
    EmailScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Colors.white,
        iconSize: 30,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey.shade500,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: ""),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Icon(Icons.qr_code_scanner, color: Colors.white),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
