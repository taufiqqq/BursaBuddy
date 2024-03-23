import 'package:flutter/material.dart';

import '../pages/beginner_page.dart';

class ModuleLearnCard extends StatelessWidget {
  const ModuleLearnCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.color});
  final String title;
  final String imagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BeginnerPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: color),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(imagePath),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
