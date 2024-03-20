import 'package:bijaktrade/pages/feed_page.dart';
import 'package:bijaktrade/pages/trader_ranking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int? sliding = 0;

  Widget buildSegmentedControlContent() {
    if (sliding == 0) {
      return FeedPage();
    } else if (sliding == 1) {
      return TopTrader();
    } else {
      return Container(); // Return an empty container by default or handle other cases
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xFF3C3279),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 24),
                Center(
                  child: CupertinoSlidingSegmentedControl(
                    children: {
                      0: Text('Feed',
                          style: TextStyle(
                              color:
                                  sliding == 1 ? Colors.white : Colors.black)),
                      1: Text('Top Trader',
                          style: TextStyle(
                              color:
                                  sliding == 0 ? Colors.white : Colors.black)),
                    },
                    groupValue: sliding,
                    onValueChanged: (int? newValue) {
                      setState(
                        () {
                          sliding = newValue;
                        },
                      );
                    },
                  ),
                ),
                Icon(Icons.settings, color: Colors.white)
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Display content based on the selected value of the segmented control
            buildSegmentedControlContent(),
          ],
        ),
      );

  Widget buildSegment(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 17, color: Colors.black),
    );
  }
}
