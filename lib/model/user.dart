import 'package:bijaktrade/model/portfolio.dart';
import 'package:bijaktrade/model/trade.dart';

class User {
  String name;
  Portfolio portfolio;
  List<Trade> trades;

  // Constructor
  User({required this.name})
      : portfolio = Portfolio(amount: 0.0, initialAmount: 0.0),
        trades = [];

  void setPortfolio(Portfolio p) {
    portfolio = p;
  }
}
