import 'package:bijaktrade/pages/calculator_page.dart';
import 'package:bijaktrade/pages/portfolio_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int? sliding = 0;

  Widget buildSegmentedControlContent() {
    if (sliding == 0) {
      return PortfolioPage();
    } else if (sliding == 1) {
      return CalculatorPage();
    } else {
      return Container(); // Return an empty container by default or handle other cases
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 81, 94),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [SizedBox(width: 24),
                Center(
                  child: CupertinoSlidingSegmentedControl(
                    children: {
                      0: Text('Portfolio',
                          style: TextStyle(
                              color:
                                  sliding == 1 ? Colors.white : Colors.black)),
                      1: Text('Calculator',
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
