import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/ProfilePageAdmin/privacySettingsPageAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/ProfilePageAdmin/resetPasswordScreenAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/ProfilePageAdmin/tNcScreenAdmin.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

class SettingsAdminPage extends StatefulWidget {
  @override
  _SettingsAdminPageState createState() => _SettingsAdminPageState();
}

class _SettingsAdminPageState extends State<SettingsAdminPage> {
  bool isSwitched = false;

  toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F8FB),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF0101D3),
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/proBg.png"),
                  // fit: BoxFit.cover,
                ),
              ),
              margin: EdgeInsets.only(top: 25, bottom: 15),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 50,
                        child: Image.asset('assets/images/man1.png'),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Andrew milan',
                      style: TextStyle(
                        color: Color(0xFF2D2D2D),
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 25, bottom: 15),
            //   child: Center(
            //     child: Image.asset(
            //       'assets/images/Group711.png',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            ScaleRoute(page: ResetPasswordAdminScreen()),
                          );
                        },
                        child: _buildListItemRow(
                          FlutterIcons.key_oct,
                          Color(0xFF0101D3),
                          Color.fromRGBO(1, 1, 211, 0.1),
                          'Reset Password',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   ScaleRoute(page: ()),
                              // );
                            },
                            child: _buildListItemRow(
                              FlutterIcons.bell_mco,
                              Color(0xFFF5BF43),
                              Color.fromRGBO(245, 191, 67, 0.15),
                              'Notification Settings',
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: Transform.scale(
                              scale: 1.25,
                              child: Switch(
                                onChanged: toggleSwitch,
                                value: isSwitched,
                                activeColor: Color(0xFF03AC62),
                                activeTrackColor:
                                    Color.fromRGBO(45, 45, 45, 0.1),
                                inactiveThumbColor: Color(0xFF03AC62),
                                inactiveTrackColor:
                                    Color.fromRGBO(45, 45, 45, 0.1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            ScaleRoute(page: PrivacySettingsAdmin()),
                          );
                        },
                        child: _buildListItemRow(
                          FlutterIcons.shield_key_mco,
                          Color(0xFF03AC62),
                          Color.fromRGBO(3, 172, 98, 0.15),
                          'Privacy Settings',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            ScaleRoute(page: TncAdminScreen()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 25, left: 10),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(236, 122, 96, 0.15),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  height: 20,
                                  child: Image.asset(
                                    'assets/images/tncIcon.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Terms & Condition',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
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

  _buildListItemRow(
      IconData icon, Color iconColor, Color iconContainerColor, var text) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 11, left: 13, top: 11, bottom: 11),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: iconContainerColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
