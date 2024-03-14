import 'package:bijaktrade/model/stock.dart';

class Trade {
  double buyPrice = 0.0;
  late double sellPrice = 0.0;
  int unit = 0;
  late Stock stock;

  Trade(this.buyPrice, this.unit, this.stock);
}
