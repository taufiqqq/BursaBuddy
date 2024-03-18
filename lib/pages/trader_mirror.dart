import 'package:flutter/material.dart';

class TraderMirror extends StatefulWidget {
  TraderMirror({Key? key, required this.name, required this.currentReturn})
      : super(key: key);

  final String name;
  final double currentReturn;

  @override
  State<TraderMirror> createState() => _TraderMirrorState();
}

class _TraderMirrorState extends State<TraderMirror> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Mirror",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 9, 81, 94),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topLeft,
          height: myHeight * 0.9,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/reference.png")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
