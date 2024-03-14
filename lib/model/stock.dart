import 'package:bijaktrade/model/coinModel.dart';

class Stock {
  String name;
  CoinModel cm;

  Stock(String n, CoinModel c)
      : name = n,
        cm = c;
}
