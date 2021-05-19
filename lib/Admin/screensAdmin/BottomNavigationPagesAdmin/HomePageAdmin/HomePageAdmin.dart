import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/addendumAdminScreen.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/agentsListScreenAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/cancelledProjectsPageAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/completedProjectsPageAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/currentProjectsPageAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/currentTasksPageAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/notificationsPageAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/paymentAndBillingScreenAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/pendingProjectsPageAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/pendingTaskPageAdmin.dart';
import 'package:homeboltech/CommonScreens/SignInScreen/signInScreen.dart';
import 'package:homeboltech/api/api.dart';
import 'package:homeboltech/models/DashboardModel.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'allTaskPageAdmin.dart';
import 'completedTaskPageAdmin.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  TextEditingController searchController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _showProjectsSubList = false;
  bool _showTasksSubList = false;
  bool _isLoading = false;

  var dashboard;

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

  //////////////// logout method start /////////////////
  Future<void> _handleLogout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.clear();
    localStorage.remove('userData');
    localStorage.remove('token');

    Navigator.pushReplacement(context, SlideRightRoute(page: SignInScreen()));

    print('remove done');
  }
  //////////////// logout method end /////////////////

  /////////////// on will pop start //////////////////
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            //   title: new Text('Are you sure?'),
            content: new Text('Are you sure you want to exit this app?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'No',
                  // style: TextStyle(color: appColor),
                ),
              ),
              new FlatButton(
                onPressed: () => exit(0),
                child: new Text(
                  'Yes',
                  // style: TextStyle(color: appColor),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
  /////////////// on will pop start //////////////////

  ///////////////// get running_project_count_tech start //////////////////
  _getRunningProjectCount() async {
    setState(() {
      _isLoading = true;
    });

    var res =
        await CallApi().getDataWithToken('sadmin/running_project_count_tech');
    print('res - $res');
    var body = json.decode(res.body);
    print('body - $body');
    print('.....................');

    if (res.statusCode == 200) {
      dashboard = dashboardFromJson(res.body);
    }

    setState(() {
      _isLoading = false;
    });
  }
  ///////////////// get running_project_count_tech end //////////////////

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.75,
      initialPage: 0,
    );
    // route();
    _getRunningProjectCount();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: Drawer(
          child: new ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              new DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFF7F8FB),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /////////////////// hello user  row start ///////////////////
                      Container(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  child: Image.asset('assets/images/man1.png'),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hello',
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            color: Color(0xFF2D2D2D)
                                                .withOpacity(0.7)),
                                      ),
                                      Text(
                                        'Fernando P.',
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: Color(0xFF2D2D2D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      /////////////////// hello user  row end ///////////////////
                    ],
                  ),
                ),
              ),

              //////////// projects Button Start ////////////////
              InkWell(
                onTap: () {
                  setState(() {
                    _showProjectsSubList = !_showProjectsSubList;
                  });
                  // Navigator.of(context).pop();
                  // Navigator.push(context, FadeRoute(page: ProfilePage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonContainer(
                      FlutterIcons.text_document_inverted_ent,
                      Color(0xFFF5BF43),
                      Color.fromRGBO(245, 191, 67, 0.15),
                      'Projects',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 22, right: 20),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 28,
                        color: Color(0xFF9CA1B2),
                      ),
                    ),
                  ],
                ),
              ),

              if (_showProjectsSubList)
                Container(
                  margin: EdgeInsets.only(left: 85),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: CurrentProjectsAdminPage()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            'Current Projects',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: CompletedProjectsAdminPage()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 25, bottom: 25),
                          child: Text(
                            'Completed Projects',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: PendingProjectsAdminPage()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 25),
                          child: Text(
                            'Pending Projects',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: CancelledProjectsAdminPage()),
                          );
                        },
                        child: Container(
                          child: Text(
                            'Cancelled Projects',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              //////////// projects Button End ////////////////

              //////////// Payments & Billing Button Start ////////////////
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context, FadeRoute(page: PaymentAndBillingAdminScreen()));
                },
                child: buttonContainer(
                  FlutterIcons.user_faw,
                  Color(0xFF03AC62),
                  Color.fromRGBO(3, 172, 98, 0.15),
                  'Payments & Billing',
                ),
              ),
              //////////// Payments & Billing Button End ////////////////

              //////////// Task Button Start ////////////////
              InkWell(
                onTap: () {
                  setState(() {
                    _showTasksSubList = !_showTasksSubList;
                  });
                  // Navigator.of(context).pop();
                  // Navigator.push(
                  //     context, FadeRoute(page: PaymentAndBillingScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonContainer(
                      Icons.assignment_turned_in,
                      Color(0xFFEC7A60),
                      Color.fromRGBO(236, 122, 96, 0.15),
                      'Task',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 22, right: 20),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 28,
                        color: Color(0xFF9CA1B2),
                      ),
                    ),
                  ],
                ),
              ),
              if (_showTasksSubList)
                Container(
                  margin: EdgeInsets.only(left: 85),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: AllTaskAdminPage()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 15, bottom: 25),
                          child: Text(
                            'All Task',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: CompletedTAskAdminPAge()),
                          );
                        },
                        child: Container(
                         margin: EdgeInsets.only(top: 0, bottom: 25),
                          child: Text(
                            'Completed Task',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: CurrentTasksAdminPage()),
                          );
                        },
                        child: Container(
                         margin: EdgeInsets.only(top: 0, bottom: 25),
                          child: Text(
                            'Current Task',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: PendingTaskAdminPage()),
                          );
                        },
                        child: Container(
                          child: Text(
                            'Pending Task',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              //////////// Task Button End ////////////////

              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    FadeRoute(page: AgentsListAdminScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25, left: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(14),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(45, 45, 45, 0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/images/agentIcon.png'),
                      ),
                      Container(
                        child: Text(
                          'My Agents',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //////////// Addendum Button Start ////////////////
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    FadeRoute(page: AddendumAdminScreen()),
                  );
                },
                child: buttonContainer(
                  FlutterIcons.ios_options_ion,
                  Color(0xFFF5BF43),
                  Color.fromRGBO(245, 191, 67, 0.15),
                  'Addendum',
                ),
              ),
              //////////// Addendum Button End ////////////////

              //////////// Logout Button Start ////////////////
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _handleLogout();
                },
                child: buttonContainer(
                  FlutterIcons.logout_variant_mco,
                  Color(0xFF0101D3),
                  Color.fromRGBO(1, 1, 211, 0.1),
                  'Logout',
                ),
              ),
              //////////// Logout Button End ////////////////

              SizedBox(height: 100),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFF7F8FB),
          iconTheme: IconThemeData(
            color: Color(0xFF0101D3),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10, top: 5),
              child: Stack(
                children: [
                  Positioned(
                    right: 13,
                    top: 10,
                    child: Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFEC7A60),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      FlutterIcons.bell_sli,
                      color: Color(0xFF0101D3),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        ScaleRoute(page: NotificationsAdminPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Color(0xFFF7F8FB),
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      color: Colors.white,
                    ),
                    child:
                        ////////////////////// search text field start //////////////////////
                        Container(
                      margin: EdgeInsets.only(top: 19, left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromRGBO(45, 45, 45, 0.1),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF2D2D2D),
                          ),
                          hintText: "Search project, client or task",
                          hintStyle: TextStyle(
                            color: Color(0xFF9696A0),
                          ),
                          contentPadding:
                              EdgeInsets.only(left: 10, top: 17, bottom: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  ////////////////////// search text field end //////////////////////

                  // /////////////////
                  // Container(
                  //   height: 195,
                  //   padding: EdgeInsets.only(top: 20),
                  //   color: Colors.white,
                  //   child: PageView.builder(
                  //       physics: BouncingScrollPhysics(),
                  //       controller: _pageController,
                  //       onPageChanged: onChangedFunction,
                  //       pageSnapping: false,
                  //       itemCount: 3,
                  //       itemBuilder: (BuildContext ctx, int index) {
                  //         return Container(
                  //           width: 250,
                  //           margin:
                  //               EdgeInsets.only(top: 5, bottom: 10, right: 20),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(15),
                  //             color: index % 2 == 0
                  //                 ? Color(0xFF0101D3)
                  //                 : Color(0xFFEC7A60),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color: Color.fromRGBO(0, 0, 0, 0.2),
                  //                 blurRadius: 5,
                  //                 spreadRadius: 0,
                  //                 offset: Offset(0, 4),
                  //               ),
                  //             ],
                  //           ),
                  //           child: Container(
                  //             child: Column(
                  //               children: [
                  //                 Container(
                  //                   margin: EdgeInsets.only(
                  //                       top: 12, left: 22, right: 70),
                  //                   child: Text(
                  //                     'Need an elegant Mobile App',
                  //                     style: TextStyle(
                  //                       fontFamily: 'poppins',
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.w500,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Container(
                  //                   margin: EdgeInsets.only(
                  //                       right: 15, top: 3, left: 22),
                  //                   child: Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceBetween,
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Color(0xFFF5BF43),
                  //                           borderRadius:
                  //                               BorderRadius.circular(5),
                  //                         ),
                  //                         margin: EdgeInsets.only(top: 8),
                  //                         padding: EdgeInsets.only(
                  //                           left: 7,
                  //                           bottom: 9,
                  //                           right: 7,
                  //                           top: 9,
                  //                         ),
                  //                         child: Text(
                  //                           'Click Here',
                  //                           style: TextStyle(
                  //                             fontSize: 12,
                  //                             fontWeight: FontWeight.w500,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       Container(
                  //                         height: 80,
                  //                         child: Image.asset(
                  //                           'assets/images/needAppIllust.png',
                  //                           fit: BoxFit.contain,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                  // /////////////////

                  // ///////////////// indicator start ////////////////////
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   alignment: Alignment.center,
                  //   color: Colors.white,
                  //   child: Transform.scale(
                  //     scale: 0.4,
                  //     child: SmoothPageIndicator(
                  //       controller: _pageController, // PageController
                  //       count: 3,
                  //       effect: ExpandingDotsEffect(
                  //         // dotWidth: 25,
                  //         spacing: 12,
                  //         expansionFactor: 4,
                  //         dotHeight: 16,
                  //         activeDotColor: Color(0xFF1F14D9),
                  //         dotColor: Color(0xFFC4C4C4),
                  //       ), // your preferred effect
                  //     ),
                  //   ),
                  // ),
                  // ///////////////// indicator end ////////////////////

                  _isLoading
                      ? Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 30),
                          child: SpinKitWanderingCubes(
                            color: Color(0xFF0101D3),
                            size: 45,
                          ),
                        )
                      : Column(
                          children: [
                            Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 25,
                              ),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Income: ',
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    // '\$12,000.25',
                                    '\$${dashboard.totalIncome}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///////////////// payment amounts row start ////////////////////
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                top: 20,
                                left: 25,
                                right: 25,
                                bottom: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // '\$12,000.25',
                                        '\$${dashboard.paidAmount}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'Total paid amount',
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // '\$1,00.10',
                                        '\$${dashboard.remainingAmount}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'Left amount to pay',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ///////////////// payment amounts row  end ////////////////////

                            ///////////////// completed/running projects cards start ////////////////////
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        2.35,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7F8FB),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(11),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0101D3),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            FlutterIcons.file_multiple_mco,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 17, bottom: 5),
                                          child: Text(
                                            'Completed projects',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  0, 40, 40, 0.8),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            // '10',
                                            '${dashboard.completedProject}',
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        2.35,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7F8FB),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(11),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5BF43),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            FlutterIcons.file_multiple_mco,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 17, bottom: 5),
                                          child: Text(
                                            'Running projects',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  0, 40, 40, 0.8),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            // '8',
                                            '${dashboard.runningProjects}',
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ///////////////// completed/running projects cards end ////////////////////

                            ///////////////// pending projects/completed task cards start ////////////////////
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7F8FB),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(11),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEC7A60),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            FlutterIcons.file_multiple_mco,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 18),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Pending projects',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 40, 40, 0.8),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 3),
                                              Container(
                                                child: Text(
                                                  // '10',
                                                  '${dashboard.pendingProject}',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7F8FB),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(11),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF03AC62),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            FlutterIcons.check_ant,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 18),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Completed task',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 40, 40, 0.8),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 3),
                                              Container(
                                                child: Text(
                                                  // '8',
                                                  '${dashboard.completedTask}',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ///////////////// pending projects/completed task cards end ////////////////////
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /////////////////////

  Container buttonContainer(
      IconData icon, Color iconColor, Color iconContainerColor, var text) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10, left: 11, top: 10, bottom: 10),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: iconContainerColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              // FlutterIcons.user_faw,
              icon,
              // color: Color(0xFF0101D3),
              color: iconColor,
            ),
          ),
          Container(
            child: Text(
              // 'My Profile',
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
