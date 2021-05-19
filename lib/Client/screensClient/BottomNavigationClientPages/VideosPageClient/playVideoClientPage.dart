import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:video_player/video_player.dart';

class PlayVideoClientPage extends StatefulWidget {
  @override
  _PlayVideoClientPageState createState() => _PlayVideoClientPageState();
}

class _PlayVideoClientPageState extends State<PlayVideoClientPage> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      // videoPlayerController: VideoPlayerController.network("url"),
      videoPlayerController: VideoPlayerController.network(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: FlickVideoPlayer(flickManager: flickManager),
                ),
                SafeArea(
                  child: Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  reverse: true,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 70,
                                height: 56,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  child: Image.asset(
                                    'assets/images/rectangle11.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 25,
                                child: Container(
                                  height: 17,
                                  width: 17,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.only(left: 3),
                                  child: Icon(
                                    FlutterIcons.play_faw5s,
                                    color: Colors.white,
                                    size: 6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Software Ajore Description',
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2D2D2D),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Text(
                                          'Ran',
                                          style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: 12,
                                            color: Color(0xFF2D2D2D),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              '14:59 min',
                                              style: TextStyle(
                                                fontFamily: 'poppins',
                                                fontSize: 12,
                                                color: Color(0xFF2D2D2D),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 20,
                                              right: 10,
                                            ),
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Color(0xFFEC7A60),
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            '7',
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFEC7A60),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
