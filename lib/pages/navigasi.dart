import 'package:flutter/material.dart';
import 'package:rentcar/pages/history.dart';
import 'package:rentcar/pages/homepage.dart';
import 'package:rentcar/pages/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class navigasi extends StatefulWidget {
  static const nameroute = '/navigasi';

  @override
  State<navigasi> createState() => _navigasiState();
}

class _navigasiState extends State<navigasi> {
  final List<Widget> _pages = [history(), Homepage(), profile()];

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        backgroundColor: Color.fromARGB(255, 4, 28, 50),
        bottomNavigationBar: SalomonBottomBar(
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.work_history),
              title: Text("History"),
              selectedColor: Color.fromARGB(255, 236, 179, 101),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Color.fromARGB(255, 236, 179, 101),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Color.fromARGB(255, 236, 179, 101),
            ),
          ],
        ));
  }
}
