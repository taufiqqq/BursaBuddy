import 'package:flutter/material.dart';

class TopTrader extends StatelessWidget {
  const TopTrader({super.key});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
        child: Container(
      height: myHeight * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
    ));
  }
}
