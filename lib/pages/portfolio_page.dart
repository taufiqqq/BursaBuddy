import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    Map<String, double> dataMap = {
      "Cash": 40000,
      "Maybank": 30000,
      "Gamuda": 15000,
    };
    return Container(
        child: Column(
      children: [
        Container(
          width: myWidth * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("2024",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text(
                    "February",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Text("RM",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text("100,000.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 1,
          margin: EdgeInsets.only(top: 10, bottom: 50, left: 30, right: 30),
        ),
        PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          chartRadius: 150,
          ringStrokeWidth: 50,
          legendOptions: LegendOptions(showLegends: true, legendTextStyle: TextStyle(color: Colors.white) ),
          chartValuesOptions: ChartValuesOptions(),
        ),
        SizedBox(height: 50),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 7,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: myHeight * 0.425,
          child: Container(
            width: myWidth,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Total Asset", style: TextStyle(fontSize: 15)),
                          Text(
                            "RM100,000.00",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      width: 1,
                      height: 80,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Earned", style: TextStyle(fontSize: 15)),
                          Text(
                            "RM21,000.00",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(8),
                  width: myWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Cash'),
                            Text('40%',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text('RM 40,000.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(color: Colors.grey, height: 1, width: myWidth * 0.8),
                Container(
                  margin: EdgeInsets.all(8),
                  width: myWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('MAYBANK'),
                            Text('30%',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text('RM 30,000.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(color: Colors.grey, height: 1, width: myWidth * 0.8),
                Container(
                  margin: EdgeInsets.all(8),
                  width: myWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('GAMUDA'),
                            Text('20%',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text('RM 15,000.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(color: Colors.grey, height: 1, width: myWidth * 0.8),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
