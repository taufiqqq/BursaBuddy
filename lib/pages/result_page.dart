import 'package:flutter/material.dart';

import 'learn_page.dart';

class ResultPage extends StatefulWidget {
  int score;
  ResultPage(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3C3279),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
            ),
          ),
          const Positioned(
            top: 40,
            left: 145,
            child: Text(
              "Let's Learn!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 100, left: 25, right: 25, bottom: 30),
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/mascot.png',
                          width: 200,
                          height: 200,
                        ),
                        const Text(
                          "Congratulations",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "You Score is",
                          style: TextStyle(fontSize: 34.0),
                        ),
                        Text(
                          "${widget.score}",
                          style: TextStyle(
                            color: Color(0xFF3C3279),
                            fontSize: 85.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LearnPage(),
                                ));
                          },
                          shape: StadiumBorder(),
                          color: Color(0xFF3C3279),
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "Back To Menu",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
