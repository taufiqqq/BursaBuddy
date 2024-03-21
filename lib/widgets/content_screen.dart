import 'package:bijaktrade/widgets/like_icon.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final String? src;

  const ContentScreen({Key? key, this.src}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _chewieController != null &&
                  _chewieController!.videoPlayerController.value.isInitialized
              ? GestureDetector(
                  child: Chewie(
                    controller: _chewieController!,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Loading...')
                  ],
                ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/images/user_picture.jpg'),
                    ),
                    SizedBox(height: 10),
                    LikeButton(
                      size: 50,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    SizedBox(height: 10),
                    Icon(
                      Icons.comment,
                      size: 50,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(color: Colors.black, blurRadius: 15.0)
                      ],
                    ),
                    SizedBox(height: 10),
                    Icon(
                      Icons.saved_search_rounded,
                      size: 50,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(color: Colors.black, blurRadius: 15.0)
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
