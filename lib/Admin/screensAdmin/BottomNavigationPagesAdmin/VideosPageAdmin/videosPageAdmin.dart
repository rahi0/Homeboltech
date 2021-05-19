import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homeboltech/Admin/screensAdmin/AdminModels/AdminAllVideoModel.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/VideosPageAdmin/playVideoPageAdmin.dart';
import 'package:homeboltech/api/api.dart';
import 'package:homeboltech/main.dart';
import 'package:homeboltech/redux/action.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
//import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideosAdminPage extends StatefulWidget {
  @override
  _VideosAdminPageState createState() => _VideosAdminPageState();
}

class _VideosAdminPageState extends State<VideosAdminPage> {
  bool isLoading = true;
  bool noData = false;
  bool isSearching = false;
  bool _isLoadingMore = false;

  int _lastId;
  int _searchlastId;

  var allVideoData;
  var allVideoRes;
  var filePath;

  List vidUrlCOntrollerList =[];

  //List myList;
  ScrollController _scrollController = ScrollController();
 // int _currentMax = 10;
 //VideoPlayerController _videoController;

 YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();_scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          if (!mounted) return;
          setState(() {
            print("top");
          });
        }
        // you are at top position

        else {
          print("bottom");
          if(isSearching){
            if(_isLoadingMore == false){
             // _loadMoreSearchTask();
            }else{
              print('loading data');
            }
          }
          else{
            if(_isLoadingMore == false){
              _loadMoreAllVideo(_lastId); //api will be call at the bottom at the list
            }else{
              print('loading data');
            }
          }
        }
        // you are at bottom position
      }
    });

    _getAllVideoData();

  //   _videoController = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
  // ..initialize().then((_) {
  //   setState(() {});  //when your thumbnail will show.
  // });

    // myList = List.generate(10, (i) => "Item : ${i + 1}");
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     _getMoreData();
    //   }
    // });
  }

  // _getMoreData() {
  //   for (int i = _currentMax; i < _currentMax + 10; i++) {
  //     myList.add("Item : ${i + 1}");
  //   }
  //   _currentMax = _currentMax + 10;
  //   setState(() {});
  // }
// @override
// void dispose() {
// super.dispose();
// _videoController.dispose();
// }

  ////////////////////// Get All Video Data Start ///////////////////////
  Future<void> _getAllVideoData() async {

    setState(() {
      isLoading = true;
      vidUrlCOntrollerList =[];
    });

    var res = await CallApi().getDataWithTokenNPercent('sadmin/getALlVideo', '');
    final body = json.decode(res.body);
    
    //print(body);

     if (res.statusCode == 401) {

      print("Something went wrong 402");
      setState(() {
      isLoading = false;
      });
    }
    else if (res.statusCode == 200) {
      print("oise oise oise");
      allVideoRes = adminAllVideoModelFromJson(res.body);

       store.dispatch(AdminAllVideoAction(allVideoRes.data)); // update data in store...
       
       //print(store.state.biographicalInfoState);
       if (!mounted) return;
       setState(() {
         allVideoData = store.state.adminAllVideoState;
       });

       if (allVideoData.length > 0) {
        _lastId = allVideoData[allVideoData.length - 1].id;

        for (var x in allVideoData) {
        vidUrlCOntrollerList.add(
          _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId("${x.url}"),
              flags: YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
                disableDragSeek: false,
                loop: false,
                isLive: false,
                forceHD: false,
                hideControls: true,
              ),
          )
        );
        // _controller = YoutubePlayerController(
        //       initialVideoId: YoutubePlayer.convertUrlToId("${x.url}"),
        //       flags: YoutubePlayerFlags(
        //         autoPlay: false,
        //         mute: false,
        //         disableDragSeek: false,
        //         loop: false,
        //         isLive: false,
        //         forceHD: false,
        //         hideControls: true,
        //       ),
        //   );
      }
      }
       print("_lastId......................");
       print(_lastId);
     //  print(vidUrlList);


    setState(() {
      isLoading = false;
      });
    }
    else if (res.statusCode == 402) {
      print("beng amar");
      setState(() {
      noData = true;
      isLoading = false;
      });
    }
    
    else{
      print("else o asi");
      setState(() {
      isLoading = false;
      });
    }


// setState(() {
//       isLoading = false;
//       });
    
  }

  ////////////////////// Get All Video Data End ///////////////////////
  

   //////////////// get more Video start ///////////////
  Future<void> _loadMoreAllVideo(lastID) async {
    setState(() {
      _isLoadingMore = true;
    });

    var res = await CallApi().getDataWithTokenNPercent('sadmin/getALlVideo', '&lastId=$lastID');
    final body = json.decode(res.body);
    
    print(body);
    print('body - $body');
    print('..........more more more...........');

    if (res.statusCode == 200) {
      var loadList = adminAllVideoModelFromJson(res.body).data;
      if (loadList.length > 0) {
        _lastId = loadList[loadList.length - 1].id;
        print("_lastId....................................");
        print(_lastId);
        for (var x in loadList) {
        vidUrlCOntrollerList.add(
          _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId("${x.url}"),
              flags: YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
                disableDragSeek: false,
                loop: false,
                isLive: false,
                forceHD: false,
                hideControls: true,
              ),
          )
        );
        print(vidUrlCOntrollerList.length);
        // _controller = YoutubePlayerController(
        //       initialVideoId: YoutubePlayer.convertUrlToId("${x.url}"),
        //       flags: YoutubePlayerFlags(
        //         autoPlay: false,
        //         mute: false,
        //         disableDragSeek: false,
        //         loop: false,
        //         isLive: false,
        //         forceHD: false,
        //         hideControls: true,
        //       ),
        //   );
      }
      }
      for (int i = 0; i < loadList.length; i++) {
        store.state.adminAllVideoState.add(loadList[i]);
      }
    }

    if (!mounted) return;
    setState(() {
      _isLoadingMore = false;
    });
  }
  //////////////// get more Video end ////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F8FB),
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Color(0xFF0101D3),
        //   ),
        // ),
        title: Text(
          'Videos',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Color(0xFF0101D3),
            ),
          ),
        ],
      ),
      body:
       isLoading
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
        margin: EdgeInsets.only(top: 20),
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 18, right: 18, top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),

            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _getAllVideoData,
                    child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: allVideoData.length,
                    itemBuilder: (BuildContext context, int index) {
                      
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, ScaleRoute(page: PlayVideoAdminPage(allVideoData[index])));
                        },
                        child: Container(
                           margin: EdgeInsets.only(bottom: 20),
                           decoration: BoxDecoration(
                             color: Colors.grey[100],
                             borderRadius: BorderRadius.circular(15),
                            //  boxShadow: <BoxShadow>[
                            //   new BoxShadow(
                            //     color: Colors.black12,
                            //     blurRadius: 3.0,
                            //     offset: new Offset(0.0, 3.0),
                            //   ),
                            // ],
                           ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 180,

                                    ///////////// youtube Player //////////////
                                    child:  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)
                                      ),
                                      child: YoutubePlayer(
                                            controller: vidUrlCOntrollerList[index],
                                            liveUIColor: Colors.amber,
                                        ),
                                    ),
                                    ///////////// youtube Player //////////////

                                    // child:  _videoController.value.initialized ?
                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.only(
                                    //     topLeft: Radius.circular(15),
                                    //     topRight: Radius.circular(15)
                                    //   ),
                                    //   child: VideoPlayer(_videoController)
                                    // ) : CupertinoActivityIndicator(),
                                  ),
                                  Container(
                                     width: MediaQuery.of(context).size.width,
                                    height: 160,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(0, 0, 0, 0.2),
                                            border:
                                                Border.all(color: Colors.white, width: 1),
                                            shape: BoxShape.circle,
                                          ),
                                          padding: EdgeInsets.only(left: 3),
                                          child: Icon(
                                            // Icons.play_arrow,
                                            FlutterIcons.play_faw5s,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10
                                ),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Container(
                                    //   child: CircleAvatar(
                                    //     radius: 14,
                                    //     child: Image.asset('assets/images/man1.png'),
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "${allVideoData[index].title}",
                                                //'Project Insights rue wooweis fowei folo euid fysiud yfhsiru hf',
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),

                                            Container(
                                              child: Text(
                                                "${allVideoData[index].category.name}",
                                              //'Afsa uryithisru h',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 12,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  ),
                ),

                if (_isLoadingMore) Container(
                             height: 40,
                             child: Center(
                               child: CupertinoActivityIndicator()
                               ),
                           )
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}
