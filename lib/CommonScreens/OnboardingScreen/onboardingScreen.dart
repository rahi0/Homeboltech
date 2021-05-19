import 'package:flutter/material.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavBarScreenAdmin/bottomNavBarScreenAdmin.dart';
import 'package:homeboltech/Agent/screensAgent/BottomNavBarAgentScreen/bottomNavBarAgentScreen.dart';
import 'package:homeboltech/Client/screensClient/BottomNavBarClientScreen/bottomNavBarClientScreen.dart';
import 'package:homeboltech/CommonScreens/SignInScreen/signInScreen.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../main.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  ////////////////// Page View Controller essentials start ////////////////
  PageController _pageController;
  int currentIndex = 0;

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeIn;

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }
  ////////////////// Page View Controller essentials end ////////////////

  void route() async {
    await Future.delayed(new Duration(seconds: 3));
    nextFunction();
    await Future.delayed(new Duration(seconds: 3));
    nextFunction();
    await Future.delayed(new Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        SlideLeftRoute(
          page: store.state.userDataState['user_type_id'] == 5
              ? BottomNavBarAdminScreen()
              : store.state.userDataState['user_type_id'] == 3
                  ? BottomNavBarClientScreen()
                  : store.state.userDataState['user_type_id'] == 1
                      ? BottomNavBarAgentScreen()
                      : SignInScreen(),
        ));
  }

   void skipButton() async {
    await Future.delayed(new Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        SlideLeftRoute(
          page: store.state.userDataState['user_type_id'] == 5
              ? BottomNavBarAdminScreen()
              : store.state.userDataState['user_type_id'] == 3
                  ? BottomNavBarClientScreen()
                  : store.state.userDataState['user_type_id'] == 1
                      ? BottomNavBarAgentScreen()
                      : SignInScreen(),
        ));
  }

  @override
  void initState() {
    _pageController = PageController();
    route();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      body: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: onChangedFunction,
                  children: <Widget>[
                    ////////////////////// page view 1 start /////////////////////////
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 50, right: 50, top: 80),
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              child: Image.asset(
                                'assets/images/illust1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40, bottom: 20),
                              child: Text(
                                "Open a New Project",
                                style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Please turn on your system and so that we can provide you all update of job and you can get overall better experience",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ////////////////////// page view 1 end /////////////////////////

                    ////////////////////// page view 2 start /////////////////////////
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 80),
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              child: Image.asset(
                                'assets/images/illust2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40, bottom: 20),
                              child: Text(
                                "Manage your Project",
                                style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Please turn on your system and so that we can provide you all update of job and you can get overall better experience",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ////////////////////// page view 2 end /////////////////////////

                    ////////////////////// page view 3 start /////////////////////////
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 50, right: 50, top: 80),
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              child: Image.asset(
                                'assets/images/illust3.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40, bottom: 7),
                              child: Text(
                                "Send Payment and Get Delivered",
                                style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Please turn on your system and so that we can provide you all update of job and you can get overall better experience",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    ////////////////////// page view 3 end /////////////////////////
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ////////////////////// Indicator Start ///////////////////////
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(right: 25, left: 20),
                        child: SmoothPageIndicator(
                          controller: _pageController, // PageController
                          count: 3,
                          effect: ExpandingDotsEffect(
                            // dotWidth: 25,
                            expansionFactor: 4,
                            dotHeight: 16,
                            activeDotColor: Color(0xFF1F14D9),
                            dotColor: Color(0xFFC4C4C4),
                          ), // your preferred effect
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          nextFunction();
                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ////////////////////// Indicator End ///////////////////////

                  ////////////////////// Next Skip  Buttons Start ////////////////////

                  GestureDetector(
                    onTap: skipButton,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  ////////////////////// Next Skip Buttons End ////////////////////
                ],
              ),
              // Positioned(
              //   bottom: 30,
              //   left: 130,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //     child: Container(
              //       child: Row(
              //         mainAxisSize: MainAxisSize.max,
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: <Widget>[
              //           InkWell(
              //               onTap: () => previousFunction(),
              //               child: Text("Previous")),
              //           SizedBox(
              //             width: 50,
              //           ),
              //           InkWell(onTap: () => nextFunction(), child: Text("Next"))
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
