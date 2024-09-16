import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'features/home/presentaion/screen/home_screen.dart';
import 'features/posts/presentaion/screen/posts_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    PostScreen(),
    Text('Profile',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
    Text('Profile',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: const Color(0xff235C75),
              hoverColor: const Color.fromARGB(255, 124, 117, 117),
              gap: 8,
              activeColor: const Color(0xff235C75),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(122, 83, 120, 135),
              color: Colors.black,
              tabBorderRadius: 15,
              tabs: textIconBottom!
                  .map((map) => GButton(
                        icon: map['icon'] as IconData,
                        text: map['text'],
                        textColor: Colors.white,
                        iconActiveColor: Colors.white,
                      ))
                  .toList(),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>>? textIconBottom = [
  {'text': 'home', 'icon': Icons.home},
  {'text': 'post', 'icon': Icons.post_add},
  {'text': 'home', 'icon': Icons.margin},
  {'text': 'settings', 'icon': Icons.settings},
];
