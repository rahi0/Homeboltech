import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoAdminPage extends StatefulWidget {
  final videoData;
  PlayVideoAdminPage(this.videoData);
  @override
  _PlayVideoAdminPageState createState() => _PlayVideoAdminPageState();
}

class _PlayVideoAdminPageState extends State<PlayVideoAdminPage> {
  bool isLoading = true;

   YoutubePlayerController _controller;

  FlickManager flickManager;
  @override
  void initState() {
    super.initState();

    _setVideo();
    // flickManager = FlickManager(
    //   // videoPlayerController: VideoPlayerController.network("url"),
    //   videoPlayerController: VideoPlayerController.network(
    //       "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
    // );
  }

  // @override
  // void dispose() {
  //   flickManager.dispose();
  //   super.dispose();
  // }

   _setVideo() async {

    setState(() {
      isLoading = true;
    });

    _controller = YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId("${widget.videoData.url}"),
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
              );


   setState(() {
      isLoading = false;
      });
    
  }

@override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: 
           (BuildContext context, Orientation orientation) {
      return Scaffold(
        body: isLoading
         ? Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 30),
            child: SpinKitWanderingCubes(
              color: Color(0xFF0101D3),
              size: 45,
              ),
            )
        :
        Container(
          padding: EdgeInsets.only(top: orientation == Orientation.landscape ? 0 : 25),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: orientation == Orientation.landscape ?  MediaQuery.of(context).size.height : MediaQuery.of(context).size.height/3,
                    //child: FlickVideoPlayer(flickManager: flickManager),
                    child: YoutubePlayer(
                             controller: _controller,
                             liveUIColor: Colors.amber,
                             //aspectRatio:16/9,
                          ),
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
                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20, right: 20),
                                    margin: EdgeInsets.only(top: 25),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        bottomLeft: Radius.circular(35),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        /////////////////// video name start //////////////////
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 30, bottom: 5),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${widget.videoData.title}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              // fontFamily: 'poppins',
                                            ),
                                          ),
                                        ),
                                        /////////////////// video name end //////////////////
                                        

                                        /////////////////// video category name start //////////////////
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 0, bottom: 15),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${widget.videoData.category.name}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w500,
                                              // fontFamily: 'poppins',
                                            ),
                                          ),
                                        ),
                                        /////////////////// video category name end //////////////////

                                        /////////////////// video description start //////////////////
                                        Container(
                                         // margin: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                                  '${widget.videoData.description}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.6,
                                                  ),
                                                )
                                        ),
                                        /////////////////// video description end //////////////////
                                        
                                        ////////////////// File title start /////////////////////
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 15),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Included File:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color:
                                                  Color.fromRGBO(45, 45, 45, 1),
                                            ),
                                          ),
                                        ),
                                        ////////////////// File title end /////////////////////

                                        ////////////////// File start //////////////////
                                        Container(
                                              margin: EdgeInsets.only(bottom: 40),
                                              width: MediaQuery.of(context).size.width / 1.5,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Color(0xFFF5F6FA),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      right: 15,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        right: 12, left: 14, top: 12, bottom: 12),
                                                    decoration: BoxDecoration(
                                                      color: Colors.teal[300],
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Icon(
                                                      FlutterIcons.file_alt_faw5s,
                                                      size: 28,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "yeyiayasd.pdf",
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),

                                                        // Container(
                                                        //   child: Text(
                                                        //   "${store.state.adminMessageList[ind].messages[index].fileList[docIndex].response.extension}",
                                                        //     overflow: TextOverflow.ellipsis,
                                                        //     style: TextStyle(
                                                        //       fontWeight: FontWeight.w600,
                                                        //       fontSize: 15,
                                                        //       color: Colors.grey[400]
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                        ////////////////// File end //////////////////
                                      ],
                                    ),
                                  ),
                                ),
                
                
                //Container(
                  // ///////////////////////////////////////////////////
                  // child: ListView.builder(
                  //   physics: BouncingScrollPhysics(),
                  //   itemCount: 5,
                  //   reverse: true,
                  //   itemBuilder: (BuildContext ctx, int index) {
                  //     return Container(
                  //       padding: EdgeInsets.all(15),
                  //       margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Stack(
                  //             children: [
                  //               Container(
                  //                 width: 70,
                  //                 height: 56,
                  //                 child: ClipRRect(
                  //                   borderRadius: BorderRadius.all(
                  //                     Radius.circular(5),
                  //                   ),
                  //                   child: Image.asset(
                  //                     'assets/images/rectangle11.png',
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Positioned(
                  //                 top: 20,
                  //                 right: 25,
                  //                 child: Container(
                  //                   height: 17,
                  //                   width: 17,
                  //                   decoration: BoxDecoration(
                  //                     color: Color.fromRGBO(0, 0, 0, 0.2),
                  //                     border: Border.all(
                  //                         color: Colors.white, width: 1),
                  //                     shape: BoxShape.circle,
                  //                   ),
                  //                   padding: EdgeInsets.only(left: 3),
                  //                   child: Icon(
                  //                     FlutterIcons.play_faw5s,
                  //                     color: Colors.white,
                  //                     size: 6,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           Expanded(
                  //             child: Container(
                  //              // color: Colors.red,
                  //               margin: EdgeInsets.only(left: 10),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Container(
                  //                     child: Text(
                  //                       'Software Ajore Description',
                  //                       overflow: TextOverflow.ellipsis,
                  //                       style: TextStyle(
                  //                         fontFamily: 'poppins',
                  //                         fontWeight: FontWeight.w500,
                  //                         color: Color(0xFF2D2D2D),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Container(
                  //                     child: Row(
                  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Container(
                  //                           child: Text(
                  //                             'Ran',
                  //                             style: TextStyle(
                  //                               fontFamily: 'poppins',
                  //                               fontSize: 12,
                  //                               color: Color(0xFF2D2D2D),
                  //                             ),
                  //                           ),
                  //                         ),

                  //                         Row(
                  //                           children: [
                  //                             Container(
                  //                               child: Text(
                  //                                 '14:59 min',
                  //                                 style: TextStyle(
                  //                                   fontFamily: 'poppins',
                  //                                   fontSize: 12,
                  //                                   color: Color(0xFF2D2D2D),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             Container(
                  //                               margin: EdgeInsets.only(
                  //                                 right: 10,
                  //                                 left: 20,
                  //                               ),
                  //                               child: Icon(
                  //                                 Icons.play_arrow,
                  //                                 color: Color(0xFFEC7A60),
                  //                                 size: 20,
                  //                               ),
                  //                             ),
                  //                             Text(
                  //                               '7',
                  //                               style: TextStyle(
                  //                                 fontFamily: 'poppins',
                  //                                 fontWeight: FontWeight.w600,
                  //                                 color: Color(0xFFEC7A60),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                  // //////////////////////////////////////////////////////
                //),
              ),
            ],
          ),
        ),
      );
  });
  }
}



///////////////////////////////
// OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
//       if (orientation == Orientation.landscape) {
//         return Scaffold(
//           body: youtubeHirarchy(),
//         );
//       } else {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(widget.title),
//           ),
//           body: youtubeHirarchy(),
//         );
//       }
//     })