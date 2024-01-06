import 'package:flutter/material.dart';

import 'article_list_screen.dart';
import 'bookmark_screen.dart';
import 'settings_screen.dart';

class NewsAppScreen extends StatefulWidget {
  const NewsAppScreen({super.key});

  @override
  State<NewsAppScreen> createState() => _NewsAppScreenState();
}

class _NewsAppScreenState extends State<NewsAppScreen> {
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    const ArticleListScreen(),
    const BookmarkScreen(),
    const SettingsScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: 'News',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.collections_bookmark),
      label: 'Bookmark',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        selectedItemColor: Colors.deepOrangeAccent,
        currentIndex: _bottomNavIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
