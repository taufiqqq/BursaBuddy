import 'dart:math';

import 'package:flutter/material.dart';

import 'question_page.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _HomePageState();
}

// don't forget "with SingleTickerProviderStateMixin"
class _HomePageState extends State<LessonPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
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
          ),
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
              "Lessons #1!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0015)
                    ..rotateY(pi * _animation.value),
                  child: Container(
                    height: 550,
                    width: 300,
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
                    child: _animation.value <= 0.5
                        ? Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment
                                        .center, // Aligning text vertically in the center
                                    child: Text(
                                      "Card 1/30 ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Breakout ",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/breakout.png',
                                    width: 250,
                                    height: 250,
                                  ),
                                  Text(
                                    "Violation of Trend Line, Support or Resistance, or previous reversal point.",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "It signifies that a change in buyer and seller behavior and signals the beginning or end of a trend.",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            child: Text("data"),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_status == AnimationStatus.dismissed) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                    },
                    child: const Text('Flip Me'))
              ],
            ),
          ),
          Positioned(
            bottom: 65,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionPage()),
                );
              },
              child: Icon(Icons.arrow_forward_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
