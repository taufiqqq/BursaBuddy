import 'package:flutter/material.dart';

import '../model/question_model.dart';
import 'result_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionPos = 0;
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
                  Padding(
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Question ${index + 1}/10",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.all(12),
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 15.0,
                                      offset: Offset(0, 7),
                                    )
                                  ],
                                ),
                                child: Text(
                                  "${questions[index].question}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  fillColor: btnPressed
                                      ? questions[index]
                                              .answers!
                                              .values
                                              .toList()[i]
                                          ? Colors.green
                                          : Colors.red
                                      : Color(0xFF6A5ACD),
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
