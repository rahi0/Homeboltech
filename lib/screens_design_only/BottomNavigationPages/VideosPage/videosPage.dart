import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/VideosPage/playVideoPage.dart';

class VideosPage extends StatefulWidget {
  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
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
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 18, right: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: 5.0,
                childAspectRatio: 0.85,
                // childAspectRatio: MediaQuery.of(context).size.width /
                //     (MediaQuery.of(context).size.height / 1.45),
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, ScaleRoute(page: PlayVideoPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: index % 2 == 0 ? 8 : 0,
                      left: index % 2 == 0 ? 0 : 8,
                    ),
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 140,
                              margin: EdgeInsets.only(top: 17),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.all(Radius.circular(15)),
                              // color: Colors.red,
                              // ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  'assets/images/rectangle8.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.width / 5.7,
                              right: MediaQuery.of(context).size.width / 5.5,
                              child: Container(
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
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: Text(
                                  'Project Insights sfsgg',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                child: CircleAvatar(
                                  radius: 14,
                                  child: Image.asset('assets/images/man1.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Color(0xFFEC7A60),
                                      size: 20,
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
                              ),
                              Text(
                                'Afsa',
                                style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
