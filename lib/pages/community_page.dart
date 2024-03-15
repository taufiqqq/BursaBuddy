import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../model/feed.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FeedPage(),
    );
  }
}

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPage();
}

class _FeedPage extends State<FeedPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  TextEditingController feedController = TextEditingController();
  List<Feed> feeds = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor:
          Colors.transparent, // Make Scaffold background transparent
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00002136),
              Color(0xFF104A57),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 90),
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Feed",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Top Trader",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 190,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: feedController,
                              decoration: const InputDecoration(
                                hintText: "Share Your Thought",
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, // Adjust the height as needed
                                  horizontal: 10.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              String feed = feedController.text.trim();
                              if (feed.isNotEmpty) {
                                setState(() {
                                  feeds.add(Feed(feedText: feed));
                                });
                              }
                            },
                            child: Icon(Icons.send),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      feeds.isEmpty
                          ? const Text("Still Empty . . .")
                          : Expanded(
                              child: ListView.builder(
                                itemCount: feeds.length,
                                itemBuilder: (context, index) => getRow(index),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundColor:
                        index % 2 == 0 ? Colors.brown : Colors.orange,
                    child: Text("?")),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "@anonymous",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      feeds[index].feedText,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, top: 5),
              child: Column(
                children: [
                  Text(
                    '16:35',
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  LikeButton(),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          indent: 70,
          height: 20,
        )
      ],
    );
  }
}
