import 'package:bijaktrade/pages/stocklist_page.dart';
import 'package:flutter/material.dart';

import 'pages/community_page.dart';
import 'pages/homepage.dart';
import 'pages/main_learn_page.dart';
import 'pages/profile_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentPage = 0;

  List<Widget> pages = [
    HomePage(),
    MainLearnPage(),
    StockListPage(),
    CommunityPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentPage),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.show_chart_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigate to the Trade page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StockListPage()),
            );
          },
          shape: const CircleBorder(),
          backgroundColor: Color(0xFF234891)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Learn',
          ),
          SizedBox(
              child: Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Center(child: Text("Trade")))),
          NavigationDestination(
            icon: Icon(Icons.groups),
            label: 'Community',
          ),
          NavigationDestination(
            icon: Icon(Icons.pie_chart),
            label: 'Portfolio',
          )
        ],
        selectedIndex: currentPage,
        onDestinationSelected: (int value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
