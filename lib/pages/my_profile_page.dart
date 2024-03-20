import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/images/user_picture.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("@Username", style: TextStyle(color: Colors.white)),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 7,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: myHeight * 0.6,
            child: Container(
              width: myWidth,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(child: Text("MyVid", style: TextStyle(fontSize: 15))),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        width: 1,
                        height: 30,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(child: Text("Saved", style: TextStyle(fontSize: 15))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildClickableRow(String title, Icon icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          icon, // Use the provided image path
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
