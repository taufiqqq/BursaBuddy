import 'package:bijaktrade/pages/trader_mirror.dart';
import 'package:flutter/material.dart';

class TopTrader extends StatelessWidget {
  TopTrader({super.key});
  Map<String, double> dataMap = {
    "Afiq": 140.44,
    "Aidil": 60.21,
    "Yasmeen": 54.43,
    "Shahir": 51.71,
  };
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topLeft,
      height: myHeight * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: dataMap.length,
                itemBuilder: (context, index) {
                  String traderName = dataMap.keys.elementAt(index);
                  double amount = dataMap.values.elementAt(index);
                  return buildTraderList(traderName, amount, index, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTraderList(
      String name, double price, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
                backgroundColor: index % 2 == 0 ? Colors.brown : Colors.orange,
                child: Text("?")),
          ),
          SizedBox(width: 5),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [Text(name), Text("@${name}")],
                ),
                Text("Current Return"),
                Text("+${price.toString()}%",
                    style: TextStyle(color: Colors.green, fontSize: 20)),
              ],
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text("Ranking"),
                Container(
                  child: Text(
                    (index + 1).toString(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TraderMirror(
                                  name: name,
                                  currentReturn: price,
                                )));
                  },
                  child: Text("Mirror"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
