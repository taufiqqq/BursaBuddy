import 'package:bijaktrade/model/coinModel.dart';

class Stock {
  String name, fullName;
  CoinModel cm;

  Stock(String n, String fn, CoinModel c)
      : name = n,
        fullName = fn,
        cm = c;
}
