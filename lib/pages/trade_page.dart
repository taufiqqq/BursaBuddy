import 'package:bijaktrade/pages/calculator_page.dart';
import 'package:bijaktrade/pages/calendar_page.dart';
import 'package:bijaktrade/pages/stocklist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TradePage extends StatefulWidget {
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  int? sliding = 0;

  Widget buildSegmentedControlContent() {
    if (sliding == 0) {
      return StockListPage();
    } else if (sliding == 1) {
      return CalculatorPage();
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
                      0: Text('Stock',
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
                GestureDetector(
                    child: Icon(Icons.calendar_today_outlined,
                        color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalendarPage()),
                      );
                    })
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
