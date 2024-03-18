import 'package:flutter/material.dart';

import '../model/question_model.dart';
import 'result_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
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
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: PageView.builder(
                          controller: _controller!,
                          onPageChanged: (page) {
                            if (page == questions.length - 1) {
                              setState(() {
                                btnText = "See Results";
                              });
                            }
                            setState(() {
                              answered = false;
                            });
                          },
                          physics: new NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Question ${index + 1}/10",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 100.0,
                                  child: Flexible(
                                    child: Text(
                                      "${questions[index].question}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                  ),
                                ),
                                for (int i = 0;
                                    i < questions[index].answers!.length;
                                    i++)
                                  Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    margin: EdgeInsets.only(
                                        bottom: 20.0, left: 12.0, right: 12.0),
                                    child: RawMaterialButton(
                                      padding: EdgeInsets.all(10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      fillColor: btnPressed
                                          ? questions[index]
                                                  .answers!
                                                  .values
                                                  .toList()[i]
                                              ? Colors.green
                                              : Colors.red
                                          : Colors.blue,
                                      onPressed: !answered
                                          ? () {
                                              if (questions[index]
                                                  .answers!
                                                  .values
                                                  .toList()[i]) {
                                                score++;
                                                print("yes");
                                              } else {
                                                print("no");
                                              }
                                              setState(() {
                                                btnPressed = true;
                                                answered = true;
                                              });
                                            }
                                          : null,
                                      child: Text(
                                          questions[index]
                                              .answers!
                                              .keys
                                              .toList()[i],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                          )),
                                    ),
                                  ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                RawMaterialButton(
                                  onPressed: () {
                                    if (_controller!.page?.toInt() ==
                                        questions.length - 1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ResultPage(score)));
                                    } else {
                                      _controller!.nextPage(
                                          duration: Duration(milliseconds: 250),
                                          curve: Curves.easeInExpo);

                                      setState(() {
                                        btnPressed = false;
                                      });
                                    }
                                  },
                                  shape: StadiumBorder(),
                                  fillColor: Colors.blue,
                                  padding: EdgeInsets.all(18.0),
                                  elevation: 0.0,
                                  child: Text(
                                    btnText,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            );
                          },
                          itemCount: questions.length,
                        )),
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
