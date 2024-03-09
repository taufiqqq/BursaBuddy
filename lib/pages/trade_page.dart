import 'package:bijaktrade/widgets/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TradePage extends StatelessWidget {
  const TradePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(60),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00002136),
                    Color(0xFF104A57),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
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
                      Text("Stocks",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
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
                      SizedBox(width: 5,),
                      Text("Global", style: TextStyle(color: Colors.white)),
                      Icon(Icons.arrow_drop_down, color: Colors.white)
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
