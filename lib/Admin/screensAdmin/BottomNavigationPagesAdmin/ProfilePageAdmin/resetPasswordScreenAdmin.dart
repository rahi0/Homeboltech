import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/ProfilePageAdmin/resetPassVerificationPageAdmin.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

class ResetPasswordAdminScreen extends StatefulWidget {
  @override
  _ResetPasswordAdminScreenState createState() => _ResetPasswordAdminScreenState();
}

class _ResetPasswordAdminScreenState extends State<ResetPasswordAdminScreen> {
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
          'Reset password',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              ////////////////////// instruction text start //////////////////////
              Container(
                margin:
                    EdgeInsets.only(top: 55, bottom: 20, left: 60, right: 60),
                child: Text(
                  "Please select which option you prefer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ////////////////////// instruction text end //////////////////////

              ////////////////////// instruction text start //////////////////////
              Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 39, left: 50, right: 50),
                child: Text(
                  "Select which option should we use to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontFamily: 'poppins',
                      // fontSize: 22,
                      // fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              ////////////////////// instruction text end //////////////////////

              /////////////////// reset options card start ////////////////////

              // Via email
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    ScaleRoute(page: ResetPassVerificationAdminPage()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  padding: EdgeInsets.only(
                    top: 42,
                    bottom: 38,
                    left: 52,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.phone_android,
                          size: 50,
                          color: Color(0xFF0101D3),
                        ),
                      ),
                      SizedBox(width: 26),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Via SMS",
                          ),
                          SizedBox(height: 6),
                          Text(
                            ".... .... .... 4535",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Via SMS
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    ScaleRoute(page: ResetPassVerificationAdminPage()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  padding: EdgeInsets.only(
                    top: 42,
                    bottom: 38,
                    left: 52,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          FlutterIcons.email_zoc,
                          size: 50,
                          color: Color(0xFFEC7A60),
                        ),
                      ),
                      SizedBox(width: 26),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Via email",
                          ),
                          SizedBox(height: 6),
                          Text(
                            "demo@gmail.com",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /////////////////// reset options card end ////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
