import 'package:bijaktrade/model/feed.dart';
import 'package:bijaktrade/pages/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

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
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    Feed chosenFeed;

    return Container(
        child: Container(
      height: myHeight * 0.8,
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
                  child: Icon(
                    Icons.send,
                    color: Color(0xFF3C3279),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            feeds.isEmpty
                ? const Text("Still Empty . . .")
                : Container(
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: feeds.length,
                        itemBuilder: (context, index) => getRow(index),
                      ),
                    ),
                  )
          ],
        ),
      ),
    ));
  }

  Widget getRow(int index) {
    return Column(
      children: [
        SizedBox(height: 5),
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
            Padding(
              padding: EdgeInsets.only(right: 25, top: 5, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '16:35',
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(Icons.comment),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  CommentFeedPage(feed: feeds[index])));
                        },
                      ),
                      SizedBox(width: 15),
                      LikeButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            height: 1,
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.8),
      ],
    );
  }
}
