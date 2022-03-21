import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projectmovie/bloc/authentication_bloc.dart';
import 'package:projectmovie/screens/screens.dart';
// import 'package:projectmovie/events/authentication_event.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreen createState() => _NavScreen();
}

class _NavScreen extends State<NavScreen> {
  final List<Widget> _screen = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    SearchScreen(),
    CommingSoon(),
    Scaffold(),
    MoreScreen(),
  ];
  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming soon': Icons.queue_play_next,
    'Download': Icons.file_download,
    'More': Icons.menu,
  };
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: _icons
            .map((title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    icon: Icon(icon, size: 30.0),
                    // ignore: deprecated_member_use
                    title: Text(title),
                  ),
                ))
            .values
            .toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
