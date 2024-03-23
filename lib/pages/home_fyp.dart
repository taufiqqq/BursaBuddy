import 'package:bijaktrade/pages/record_video.dart';
import 'package:bijaktrade/widgets/content_screen.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeFYP extends StatelessWidget {
  final List<String> videos = [
    'https://firebasestorage.googleapis.com/v0/b/vr-meeting-ad.appspot.com/o/vid3.mp4?alt=media&token=161cda65-1335-4db8-ae13-7f06898af7ff',
    'https://firebasestorage.googleapis.com/v0/b/vr-meeting-ad.appspot.com/o/vid2.mp4?alt=media&token=01e81c2c-dca3-4bdd-bc85-39ae8e405f70',
    'https://firebasestorage.googleapis.com/v0/b/vr-meeting-ad.appspot.com/o/vid4.mp4?alt=media&token=4d725b67-3b8e-4132-b811-e74bf40566cf',
    'https://assets.mixkit.co/videos/preview/mixkit-hand-of-a-man-tossing-a-coin-in-the-air-18307-large.mp4',
    'https://firebasestorage.googleapis.com/v0/b/vr-meeting-ad.appspot.com/o/vid1.mp4?alt=media&token=4f532ceb-5f59-4682-9efa-c827137e1258'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              //We need swiper for every content
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ContentScreen(
                    src: videos[index],
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 24),
                    Text(
                      'INVESTING FOR YOU',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecordVideo()));
                        },
                        child: Icon(Icons.camera_alt)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
