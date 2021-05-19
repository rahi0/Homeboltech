import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavBarScreenAdmin/bottomNavBarScreenAdmin.dart';
import 'package:homeboltech/Agent/screensAgent/BottomNavBarAgentScreen/bottomNavBarAgentScreen.dart';
import 'package:homeboltech/Client/screensClient/BottomNavBarClientScreen/bottomNavBarClientScreen.dart';
import 'package:homeboltech/CommonScreens/OnboardingScreen/onboardingScreen.dart';
import 'package:homeboltech/CommonScreens/SignInScreen/signInScreen.dart';
import 'package:homeboltech/main.dart';
import 'package:homeboltech/redux/action.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  bool isLoading = true;
  bool firstOpen = false;

  @override
  void initState() {
    super.initState();

    anim();
    startTime();
    //_checkIfLoggedIn();
    //route();
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


   /////////////////// Is the first time opended////
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');

   // var _duration = new Duration(seconds: 3);

    if (firstTime != null && !firstTime) {
      // Not first time
      _checkIfLoggedIn();
    } else {
      // First time
      prefs.setBool('first_time', false);
      setState(() {
        firstOpen = true;
        // isLoading = false;
      });

      await Future.delayed(new Duration(seconds: 3));
       Navigator.pushReplacement(context, FadeRoute(page: firstOpen ? OnBoardingScreen() : SignInScreen() ));
    }
  }
  /////////////////// Is the first time opended////

  // void route() async {
  //   await Future.delayed(new Duration(seconds: 3));

  //   Navigator.pushReplacement(context, FadeRoute(page: OnBoardingScreen()));
  // }

  anim() async {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(0.0, -1.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
  }

  ///////////////// checking if user logged in /////////////////
  bool _isLoggedIn = false;
  var userData;
  var userType;

  void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });

      var user = localStorage.getString('userData');
    if (user != null) {
      setState(() {
        userData = json.decode(user);
        userData['user_type_id'] == null
            ? userType = ""
            : userType = userData['userType'];

        localStorage.setString('userData', json.encode(userData));
      });

      store.state.userDataState = userData;
      store.dispatch(UserDataAction(store.state.userDataState));


      await Future.delayed(new Duration(seconds: 3));
      Navigator.pushReplacement( context, SlideLeftRoute(
          page: store.state.userDataState['user_type_id'] == 5
              ? BottomNavBarAdminScreen()
              : store.state.userDataState['user_type_id'] == 3
                  ? BottomNavBarClientScreen()
                  : store.state.userDataState['user_type_id'] == 1
                      ? BottomNavBarAgentScreen()
                      : SignInScreen(),
        ));
    } else{
      await Future.delayed(new Duration(seconds: 3));
      Navigator.pushReplacement( context, SlideLeftRoute(page:  SignInScreen()));
    }
    }


    else{
      setState(() {
        _isLoggedIn = false;
      });

      await Future.delayed(new Duration(seconds: 3));
      Navigator.pushReplacement( context, SlideLeftRoute(page:  SignInScreen()));
    }

    
  }
  ///////////////// checking if user logged in /////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/compressedimage.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 6,
                  right: MediaQuery.of(context).size.width / 6,
                  top: MediaQuery.of(context).size.width / 5,
                ),
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: Image.asset('assets/images/LoginLogo.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
