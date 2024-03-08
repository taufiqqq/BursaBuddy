import 'package:flutter/material.dart';

import 'pages/community_page.dart';
import 'pages/homepage.dart';
import 'pages/portfolio_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentPage = 0;

  List<Widget> pages = [
    HomePage(),
    PortfolioPage(),
    CommunityPage(),
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
          onPressed: () {},
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
