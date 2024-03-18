import 'package:bijaktrade/model/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:like_button/like_button.dart';

class CommentFeedPage extends StatefulWidget {
  Feed feed;
  CommentFeedPage({required this.feed});

  @override
  State<CommentFeedPage> createState() => _CommentFeedPageState();
}

class _CommentFeedPageState extends State<CommentFeedPage> {
  TextEditingController commentController = TextEditingController();
  List<String> comments = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.brown, child: Text("?")),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              "@anonymous",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Text('${widget.feed.feedText}',
                        style: TextStyle(fontSize: 20)),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Align(
                    child: Text('10:13 PM · Mar 17, 2024 · MYT',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Container(height: 1, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.comment_outlined, size: 18),
                            Text('10',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            LikeButton(
                              size: 18,
                            ),
                            Text('10',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.save_alt_outlined, size: 18),
                            Text('10',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                          ],
                        ),
                      ]),
                ),
                Container(height: 1, color: Colors.grey),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        decoration: const InputDecoration(
                          hintText: "Post Your Reply",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, // Adjust the height as needed
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String comment = commentController.text.trim();
                        if (comment.isNotEmpty) {
                          setState(() {
                            comments.add(comment);
                          });
                        }
                      },
                      child: Icon(Icons.send),
                    ),
                  ],
                ),
                Container(height: 1, color: Colors.grey),
                comments.isEmpty
                    ? const Text("Be the first one to comment")
                    : Container(
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: comments.length,
                            itemBuilder: (context, index) => getRow(index),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Column(
      children: [
        SizedBox(height: 10),
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
                      comments[index],
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
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
            height: 1,
            color: const Color.fromARGB(124, 158, 158, 158),
            width: MediaQuery.of(context).size.width * 0.8),
      ],
    );
  }
}
