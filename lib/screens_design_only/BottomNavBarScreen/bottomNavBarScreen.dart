import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/ChatPage/chatListPage.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/HomePage/HomePage.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/ProfilePage/addAgentScreen.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/ProfilePage/createNewProjectScreen.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/ProfilePage/createNewTaskScreen.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/ProfilePage/profilePage.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/VideosPage/videosPage.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _bottomNavPages = [
    HomePage(),
    VideosPage(),
    ChatListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 85,
        // padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(1, 1, 211, 0.08),
              blurRadius: 20,
              spreadRadius: 0,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              child: Icon(
                FlutterIcons.home_sli,
                color:
                    _currentIndex == 0 ? Color(0xFF0101D3) : Color(0xFFD8D8E1),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              child: Icon(
                // Icons.play_circle_outline,
                FlutterIcons.playcircleo_ant,
                size: 26,
                color:
                    _currentIndex == 1 ? Color(0xFF0101D3) : Color(0xFFD8D8E1),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showAddBottomSheet(context);
                // setState(() {
                //   _currentIndex = 5;
                // });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0101D3),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              child: Icon(
                FlutterIcons.bubble_sli,
                size: 25,
                color:
                    _currentIndex == 2 ? Color(0xFF0101D3) : Color(0xFFD8D8E1),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              child: Icon(
                FlutterIcons.user_faw5,
                // Icons.person_outline, size: 28,
                color:
                    _currentIndex == 3 ? Color(0xFF0101D3) : Color(0xFFD8D8E1),
              ),
            ),
          ],
        ),
      ),
      body: _bottomNavPages[_currentIndex],
    );
  }

  //////////////////// showAddBottomSheet start ///////////////////////
  _showAddBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        builder: (BuildContext bc) {
          return Container(
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 25, right: 20),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.videocam,
                    color: Color.fromRGBO(45, 45, 45, 0.8),
                  ),
                  title: Text(
                    'Add Agents',
                    style: TextStyle(
                      color: Color(0xFF282828),
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      ScaleRoute(page: AddAgentScreen()),
                    );
                  },
                ),
                Divider(
                  color: Color.fromRGBO(45, 45, 45, 0.1),
                  height: 1,
                ),
                ListTile(
                  leading: Icon(
                    Icons.add,
                    color: Color.fromRGBO(45, 45, 45, 0.8),
                  ),
                  title: Text(
                    'Create New Project',
                    style: TextStyle(
                      color: Color(0xFF282828),
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      ScaleRoute(page: CreateNewProjectScreen()),
                    );
                  },
                ),
                Divider(
                  color: Color.fromRGBO(45, 45, 45, 0.1),
                  height: 1,
                ),
                ListTile(
                  leading: Icon(
                    Icons.add,
                    color: Color.fromRGBO(45, 45, 45, 0.8),
                  ),
                  title: Text(
                    'Create New Task',
                    style: TextStyle(
                      color: Color(0xFF282828),
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      ScaleRoute(page: CreateNewTaskScreen()),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
  //////////////////// showAttachmentBottomSheet end  ///////////////////////

}
