import 'package:bijaktrade/pages/community_page.dart';
import 'package:bijaktrade/pages/feed_page.dart';
import 'package:bijaktrade/pages/home_fyp.dart';
import 'package:bijaktrade/pages/stocklist_page.dart';
import 'package:bijaktrade/pages/trade_page.dart';
import 'package:flutter/material.dart';

import 'pages/homepage.dart';
import 'pages/main_learn_page.dart';
import 'pages/profile_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentPage = 2;

  List<Widget> pages = [
    HomeFYP(),
    TradePage(),
    MainLearnPage(),
    FeedPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: pages.elementAt(currentPage),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.my_library_books_outlined,
              color: currentPage==2 ?  Colors.white : Colors.black ,
              size: 30
            ),
            onPressed: () {
              // Navigate to the Trade page
              setState(() {
                currentPage = 2;
              });
            },
            shape: const CircleBorder(),
            backgroundColor: currentPage==2 ?  Colors.deepPurple : Colors.white ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.candlestick_chart,),
              label: 'Trade',
            ),
            SizedBox(
                child: Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: Center(child: Text("Learn")))),
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
      ),
    );
  }
}
