import 'package:flutter/material.dart';

import '../widgets/learn_card.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose Quiz',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Progress :',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 15.0,
                                offset: Offset(0, 7),
                              )
                            ],
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Beginner',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '1/10',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 0.0),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 15.0,
                                offset: Offset(0, 7),
                              )
                            ],
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Intermediate',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '1/10',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 0.0),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 15.0,
                                offset: Offset(0, 7),
                              )
                            ],
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Advanced',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '1/10',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 0.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Beginner',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                        size: 36.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Row(
                  children: [LearnCard(), LearnCard(), LearnCard()],
                ),
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Intermediate',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                        size: 36.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Row(
                  children: [LearnCard(), LearnCard(), LearnCard()],
                ),
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Advanced',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                        size: 36.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Row(
                  children: [LearnCard(), LearnCard(), LearnCard()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
