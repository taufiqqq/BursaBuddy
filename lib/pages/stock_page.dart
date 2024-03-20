import 'dart:convert';

import 'package:bijaktrade/model/stock.dart';
import 'package:bijaktrade/pages/chatbot_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:http/http.dart' as http;
import '../model/chartModel.dart';

class StockPage extends StatefulWidget {
  Stock selectStock;
  StockPage({required this.selectStock});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  late TrackballBehavior trackballBehavior;
  int unit = 0;
  double totalPrice = 0;
  @override
  void initState() {
    getChart();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(60),
              ),
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter)),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      child: Icon(Icons.arrow_back_rounded,
                                          color: Colors.white),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                                Text(
                                  "Trading",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Icon(
                                  Icons.notifications_outlined,
                                  size: 35.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        width: myWidth * 0.8,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.selectStock.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white)),
                            Text(widget.selectStock.fullName,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.white)),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "RM${widget.selectStock.cm.currentPrice.toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white)),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.selectStock.cm
                                              .marketCapChangePercentage24H
                                              .toStringAsFixed(2) +
                                          '%',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: widget.selectStock.cm
                                                    .marketCapChangePercentage24H >=
                                                0
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                    Icon(
                                        size: 40,
                                        widget.selectStock.cm
                                                    .marketCapChangePercentage24H >=
                                                0
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down,
                                        color: widget.selectStock.cm
                                                    .marketCapChangePercentage24H >=
                                                0
                                            ? Colors.green
                                            : Colors.red)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text("KLSE.RM",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: myHeight * 0.7,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Container(
                            width: myWidth * 0.9,
                            child: Text('Price',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Container(
                              height: myHeight * 0.03,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: text.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: myWidth * 0.02),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          textBool = [
                                            false,
                                            false,
                                            false,
                                            false,
                                            false,
                                            false
                                          ];
                                          textBool[index] = true;
                                        });
                                        setDays(text[index]);
                                        getChart();
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: textBool[index] == true
                                              ? Color.fromARGB(
                                                      255, 126, 126, 126)
                                                  .withOpacity(0.3)
                                              : Colors.transparent,
                                        ),
                                        child: Text(
                                          text[index],
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: textBool[index] == true
                                                ? Color.fromARGB(
                                                    255, 255, 255, 255)
                                                : Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: textBool[index] == true
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: myHeight * 0.3,
                            width: myWidth * 0.95,
                            // color: Colors.amber,
                            child: isRefresh == true
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xffFBC700),
                                    ),
                                  )
                                : itemChart == null
                                    ? Padding(
                                        padding:
                                            EdgeInsets.all(myHeight * 0.06),
                                        child: Center(
                                          child: Text(
                                            'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      )
                                    : SfCartesianChart(
                                        primaryXAxis: DateTimeAxis(),
                                        trackballBehavior: trackballBehavior,
                                        zoomPanBehavior: ZoomPanBehavior(
                                          enablePinching: true,
                                          zoomMode: ZoomMode.x,
                                        ),
                                        series: <CandleSeries>[
                                          CandleSeries<ChartModel, DateTime>(
                                            enableSolidCandles: true,
                                            enableTooltip: true,
                                            bullColor: Colors.green,
                                            bearColor: Colors.red,
                                            dataSource: itemChart!,
                                            xValueMapper: (ChartModel sales,
                                                    _) =>
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        sales.time),
                                            lowValueMapper:
                                                (ChartModel sales, _) =>
                                                    sales.low,
                                            highValueMapper:
                                                (ChartModel sales, _) =>
                                                    sales.high,
                                            openValueMapper:
                                                (ChartModel sales, _) =>
                                                    sales.open,
                                            closeValueMapper:
                                                (ChartModel sales, _) =>
                                                    sales.close,
                                            animationDuration: 55,
                                          )
                                        ],
                                      ),
                          ),
                          Container(
                            width: myWidth * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('History',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                Text('View More')
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: myWidth * 0.9,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 215, 255, 213),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Icon(Icons.arrow_drop_up,
                                      size: 40, color: Colors.green),
                                ),
                                SizedBox(width: 20),
                                Text('BUY',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                              color: Colors.grey,
                              height: 1,
                              width: myWidth * 0.8),
                          SizedBox(height: 10),
                          Container(
                            width: myWidth * 0.9,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 213, 213),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Icon(Icons.arrow_drop_down,
                                      size: 40, color: Colors.red),
                                ),
                                SizedBox(width: 20),
                                Text('SELL',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: myWidth * 0.9,
                            child: Text('News about ${widget.selectStock.name}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          Card(
                            margin: EdgeInsets.all(20),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.white,
                            child: Container(
                              height: 175,
                              width: 340,
                              padding: EdgeInsets.all(16),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reuters',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'US STOCKS Wall St eyes muted open after rally on AI boost, inflation relief ',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Wall Street was set for a muted open on Friday after rally in the previous session driven by an inflation ... ',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: null,
                                      child: Text('View More >'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 100),
          child: Container(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              child: Image.asset(
                'assets/images/mascot_chat.png',
                width: 50,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => ChatbotPage(messageText: widget.selectStock.name))));
              },
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () async {
                      final TextEditingController _controller =
                          TextEditingController();
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text('Enter Number of Units'),
                              content: TextField(
                                controller: _controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter units',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    int newUnit =
                                        int.tryParse(_controller.text) ?? unit;
                                    setState(() {
                                      unit = newUnit;
                                      totalPrice =
                                          widget.selectStock.cm.currentPrice *
                                              newUnit;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 20)),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 80,
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('${totalPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Text('  RM',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('${unit}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Text('  UNIT',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('SELL',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.red)),
                ),
                Expanded(
                  flex: 1,
                  child: Text('BUY',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.green)),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  List<String> text = ['1D', '1W', '1M', '3M', '6M', '1Y'];
  List<bool> textBool = [true, false, false, false, false, false];

  int days = 1;

  setDays(String txt) {
    if (txt == '1D') {
      setState(() {
        days = 1;
      });
    } else if (txt == '1W') {
      setState(() {
        days = 7;
      });
    } else if (txt == '1M') {
      setState(() {
        days = 30;
      });
    } else if (txt == '3M') {
      setState(() {
        days = 90;
      });
    } else if (txt == '6M') {
      setState(() {
        days = 180;
      });
    } else if (txt == '1Y') {
      setState(() {
        days = 365;
      });
    }
  }

  List<ChartModel>? itemChart;

  bool isRefresh = true;

  Future<void> getChart() async {
    String url = 'https://api.coingecko.com/api/v3/coins/' +
        widget.selectStock.cm.id +
        '/ohlc?vs_currency=usd&days=' +
        days.toString();

    setState(() {
      isRefresh = true;
    });

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    setState(() {
      isRefresh = false;
    });
    if (response.statusCode == 200) {
      Iterable x = json.decode(response.body);
      List<ChartModel> modelList =
          x.map((e) => ChartModel.fromJson(e)).toList();
      setState(() {
        itemChart = modelList;
      });
    } else {
      print(response.statusCode);
    }
  }

  /* 
  Container(
        height: myHeight,
        width: myWidth,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: myHeight * 0.08,
                          child: Image.network(widget.selectStock.cm.image)),
                      SizedBox(
                        width: myWidth * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.selectStock.cm.id,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Text(
                            widget.selectStock.cm.symbol,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$' + widget.selectStock.cm.currentPrice.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: myHeight * 0.01,
                      ),
                      Text(
                        widget.selectStock.cm.marketCapChangePercentage24H
                                .toString() +
                            '%',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: widget.selectStock.cm
                                        .marketCapChangePercentage24H >=
                                    0
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Low',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Text(
                            '\$' + widget.selectStock.cm.low24H.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'High',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Text(
                            '\$' + widget.selectStock.cm.high24H.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Vol',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Text(
                            '\$' +
                                widget.selectStock.cm.totalVolume.toString() +
                                'M',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.015,
                ),
                Container(
                  height: myHeight * 0.4,
                  width: myWidth,
                  // color: Colors.amber,
                  child: isRefresh == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffFBC700),
                          ),
                        )
                      : itemChart == null
                          ? Padding(
                              padding: EdgeInsets.all(myHeight * 0.06),
                              child: Center(
                                child: Text(
                                  'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                          : SfCartesianChart(
                              trackballBehavior: trackballBehavior,
                              zoomPanBehavior: ZoomPanBehavior(
                                  enablePinching: true, zoomMode: ZoomMode.x),
                              series: <CandleSeries>[
                                CandleSeries<ChartModel, int>(
                                    enableSolidCandles: true,
                                    enableTooltip: true,
                                    bullColor: Colors.green,
                                    bearColor: Colors.red,
                                    dataSource: itemChart!,
                                    xValueMapper: (ChartModel sales, _) =>
                                        sales.time,
                                    lowValueMapper: (ChartModel sales, _) =>
                                        sales.low,
                                    highValueMapper: (ChartModel sales, _) =>
                                        sales.high,
                                    openValueMapper: (ChartModel sales, _) =>
                                        sales.open,
                                    closeValueMapper: (ChartModel sales, _) =>
                                        sales.close,
                                    animationDuration: 55)
                              ],
                            ),
                ),
                SizedBox(
                  height: myHeight * 0.01,
                ),
                Center(
                  child: Container(
                    height: myHeight * 0.03,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: text.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: myWidth * 0.02),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                textBool = [
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false
                                ];
                                textBool[index] = true;
                              });
                              setDays(text[index]);
                              getChart();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: myWidth * 0.03,
                                  vertical: myHeight * 0.005),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: textBool[index] == true
                                    ? Color(0xffFBC700).withOpacity(0.3)
                                    : Colors.transparent,
                              ),
                              child: Text(
                                text[index],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.04,
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.06),
                      child: Text(
                        'News',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: myWidth * 0.06,
                          vertical: myHeight * 0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                          ),
                          Container(
                            width: myWidth * 0.25,
                            child: CircleAvatar(
                              radius: myHeight * 0.04,
                              // backgroundImage:
                              // AssetImage('assets/images/bursabuddy_logo.png')
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
              ],
            )),
            Container(
              height: myHeight * 0.1,
              width: myWidth,
              // color: Colors.amber,
              child: Column(
                children: [
                  Divider(),
                  SizedBox(
                    height: myHeight * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: myWidth * 0.05,
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: myHeight * 0.015),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xffFBC700)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: myHeight * 0.02,
                              ),
                              Text(
                                'Add to portfolio',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: myWidth * 0.05,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: myHeight * 0.012),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.withOpacity(0.2)),
                          child: //Text('helo'),
                          Image.asset(
                            'assets/images/bursabuddy_logo.png',
                            height: myHeight * 0.03,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: myWidth * 0.05,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
  */
}
