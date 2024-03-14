import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bijaktrade/model/coinModel.dart';
import 'package:bijaktrade/model/stock.dart';
import 'package:bijaktrade/pages/stock_page.dart';
import 'package:bijaktrade/widgets/search_field.dart';

class StockListPage extends StatefulWidget {
  const StockListPage({Key? key}) : super(key: key);

  @override
  State<StockListPage> createState() => _StockListPageState();
}

class _StockListPageState extends State<StockListPage> {
  late List<Stock> stocks;
  late Future<List<CoinModel>?> _coinMarketFuture;

  @override
  void initState() {
    super.initState();
    _coinMarketFuture = getCoinMarket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(60),
            ),
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.fitWidth, alignment: Alignment.topCenter)

            ),
        child: FutureBuilder<List<CoinModel>?>(
          future: _coinMarketFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Data has been fetched successfully
              stocks = [
                Stock("MAYBANK", snapshot.data![0]),
                Stock("GAMUDA", snapshot.data![1]),
                Stock("RAPID", snapshot.data![2]),
                Stock("MAXIS", snapshot.data![3]),
                Stock("MAYBANK", snapshot.data![4]),
                Stock("GAMUDA", snapshot.data![5]),
                Stock("RAPID", snapshot.data![6]),
                Stock("MAXIS", snapshot.data![7]),
              ];

              return Column(
                children: [
                  CustomHeader(
                    onBackTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                        itemCount: stocks.length,
                        itemBuilder: (context, index) {
                          return buildTradePage(stocks[index]);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildTradePage(Stock stock) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(2, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stock.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(stock.cm.name), // Assuming cm has a property 'name'
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: myHeight * 0.05,
                  child: Sparkline(
                    data: stock.cm.sparklineIn7D.price,
                    lineWidth: 1.0,
                    lineColor: stock.cm.marketCapChangePercentage24H >= 0
                        ? Colors.green
                        : Colors.red,
                    fillMode: FillMode.below,
                    fillGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 1],
                        colors: stock.cm.marketCapChangePercentage24H >= 0
                            ? [Colors.green, Colors.green.shade100]
                            : [Colors.red, Colors.red.shade100]),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\RM ' + stock.cm.currentPrice.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      stock.cm.marketCapChangePercentage24H.toStringAsFixed(2) +
                          '%',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: stock.cm.marketCapChangePercentage24H >= 0
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StockPage(selectStock: stock),
          ),
        );
      },
    );
  }

  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      var x = response.body;
      var coinMarketList = coinModelFromJson(x);
      return coinMarketList;
    } else {
      throw Exception('Failed to load coin market');
    }
  }
}

class CustomHeader extends StatelessWidget {
  final VoidCallback? onBackTap;

  const CustomHeader({Key? key, this.onBackTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                    child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                    onTap: onBackTap,
                  )
                ],
              ),
              Text(
                "Stocks",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.more_horiz,
                size: 35.0,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 30),
          SearchTextField(),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Text("Global", style: TextStyle(color: Colors.white)),
              Icon(Icons.arrow_drop_down, color: Colors.white)
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
