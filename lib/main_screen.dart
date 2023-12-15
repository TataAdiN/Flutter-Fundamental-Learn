
import 'package:flutter/cupertino.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(  items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.news),
          label: 'Feeds',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          label: 'Settings',
        ),
      ],),
      tabBuilder: (context, index) {
        switch (index) {
        case 0:
          return FeedsPage();
        case 1:
          return SearchPage();
        case 2:
          return SettingsPage();
        default:
          return Center(
            child: Text('Page not found!'),
          );
      }},
    );
  }
}
