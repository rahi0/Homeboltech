import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/Agent/screensAgent/BottomNavigationAgentPages/ProfilePageAgent/taskFileUploadAgentPage.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

class TaskDetailsAgentPage extends StatefulWidget {
  @override
  _TaskDetailsAgentPageState createState() => _TaskDetailsAgentPageState();
}

class _TaskDetailsAgentPageState extends State<TaskDetailsAgentPage> {
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
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'In Progress',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF4A4B57),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      ///////////////////// tab bar start ///////////////////////
                      TabBar(
                        labelColor: Color(0xFF0101D3),
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontFamily: 'poppins',
                        ),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xFF0101D3),
                          ),
                          insets: EdgeInsets.symmetric(
                              horizontal: 35.0, vertical: 5),
                        ),
                        tabs: [
                          Tab(text: "Overview"),
                          Tab(text: "Activity"),
                          Tab(text: "Today’s Task"),
                        ],
                      ),
                      ///////////////////////// tab bar end ///////////////////////

                      ///////////////////////// tab bar views start ///////////////////////
                      Expanded(
                        child: Container(
                          child: TabBarView(
                            children: [
                              ///////////////// Overview TabBarView start //////////////////
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Container(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  margin: EdgeInsets.only(top: 25),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      /////////////////// task name start //////////////////
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 30, bottom: 15),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Create site map',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            // fontFamily: 'poppins',
                                          ),
                                        ),
                                      ),
                                      /////////////////// task name end //////////////////

                                      /////////////////// task description start //////////////////
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: RichText(
                                          // textAlign: TextAlign.start,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'We need a website which will fullfill our desirable goal, function and where user expernce can intaract with user...',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.6,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'DISCOVER MORE',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.6,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      /////////////////// task description end //////////////////

                                      ////////////////// task details list start //////////////////
                                      _buildContainer(
                                        'Project:',
                                        'Web Designing',
                                      ),
                                      _buildDivider(),
                                      _buildContainer(
                                        'Category:',
                                        'Web Designing',
                                      ),
                                      _buildDivider(),
                                      _buildContainer(
                                        'Assign Date:',
                                        'Novermber 12, 2020',
                                      ),
                                      _buildDivider(),
                                      _buildContainer(
                                        'Due Date:',
                                        'Novermber 14, 2020',
                                      ),
                                      _buildDivider(),
                                      _buildContainer(
                                        'Status:',
                                        'In Progress',
                                      ),
                                      ////////////////// task details list end //////////////////

                                      ////////////////// assignee start /////////////////////
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 35, bottom: 15),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Assign To',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color:
                                                Color.fromRGBO(45, 45, 45, 1),
                                          ),
                                        ),
                                      ),
                                      ////////////////// assignee end /////////////////////
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundImage: AssetImage(
                                                      'assets/images/man1.png',
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 35,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.white,
                                                        width: 1,
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 25,
                                                      backgroundImage:
                                                          AssetImage(
                                                        'assets/images/man1.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 65,
                                                  child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.white,
                                                        width: 1,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      color: Color(0xFF0101D3),
                                                    ),
                                                    child: Text(
                                                      '1+',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DottedBorder(
                                            borderType: BorderType.Circle,
                                            dashPattern: [6, 3],
                                            padding: EdgeInsets.zero,
                                            color:
                                                Color.fromRGBO(45, 45, 45, 0.5),
                                            child: Container(
                                              padding: EdgeInsets.all(13.5),
                                              child: Icon(
                                                Icons.add,
                                                size: 15,
                                                color: Color.fromRGBO(
                                                    45, 45, 45, 0.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 50),
                                    ],
                                  ),
                                ),
                              ),
                              ///////////////// Overview TabBarView end //////////////////

                              ///////////////// Activity TabBarView start //////////////////
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Container(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  margin: EdgeInsets.only(top: 25),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /////////////////// task name start //////////////////
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 30, bottom: 15),
                                        child: Text(
                                          'Create site map',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            // fontFamily: 'poppins',
                                          ),
                                        ),
                                      ),
                                      /////////////////// task name end //////////////////
                                      Text(
                                        'You moved task in progress',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(45, 45, 45, 0.7),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 15),
                                        child: Text(
                                          'Just Now',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(45, 45, 45, 1),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Added an attachment',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(45, 45, 45, 0.7),
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 15),
                                        child: Text(
                                          'ios app design home page',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(45, 45, 45, 1),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 124,
                                              width: 110,
                                              margin: EdgeInsets.only(
                                                  top: 0, left: 0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/rectangle87.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 124,
                                              width: 110,
                                              margin: EdgeInsets.only(
                                                  top: 0, left: 10),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/rectangle89.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),

                                      //////////////////// upload file part start ////////////////////
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 10, bottom: 3),
                                        child: Text(
                                          'Upload your files',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'poppins',
                                            color:
                                                Color.fromRGBO(45, 45, 45, 1),
                                          ),
                                        ),
                                      ),

                                      Text(
                                        'File Should be .doc, Zip, Eps or Pdf',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF9CA1B2),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            ScaleRoute(
                                                page:
                                                    TaskFileUploadAgentPage()),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 15, bottom: 35),
                                          child: DottedBorder(
                                            borderType: BorderType.RRect,
                                            radius: Radius.circular(15),
                                            dashPattern: [6, 3],
                                            padding: EdgeInsets.zero,
                                            color: Color.fromRGBO(
                                                39, 67, 246, 0.2),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Color.fromRGBO(
                                                  39, 67, 246, 0.1),
                                              padding: EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    FlutterIcons
                                                        .folder_open_mco,
                                                    size: 30,
                                                    color: Color(0xFF2743F6),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Browse your files here',
                                                    style: TextStyle(
                                                      color: Color(0xFF9CA1B2),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //////////////////// upload file part end ////////////////////
                                    ],
                                  ),
                                ),
                              ),
                              ///////////////// Activity TabBarView end //////////////////

                              ///////////////// Today’s Task TabBarView start //////////////////
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                margin: EdgeInsets.only(top: 25),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        physics: BouncingScrollPhysics(),
                                        itemCount: 10,
                                        itemBuilder:
                                            (BuildContext ctx, int index) {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 15),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 0,
                                                      left: 20,
                                                      right: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sep 20, 2020',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color.fromRGBO(
                                                              45, 45, 45, 0.8),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          FlutterIcons
                                                              .dots_two_vertical_ent,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 0,
                                                      bottom: 4,
                                                      left: 20),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Create Site map',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'poppins',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10, left: 20),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'by Andrew',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'poppins',
                                                          color: Color.fromRGBO(
                                                              45, 45, 45, 0.6),
                                                        ),
                                                      ),
                                                      SizedBox(width: 25),
                                                      Text(
                                                        'Design',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'poppins',
                                                          color: Color.fromRGBO(
                                                              45, 45, 45, 0.6),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 15,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                  'assets/images/man1.png',
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1,
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    CircleAvatar(
                                                                  radius: 15,
                                                                  backgroundImage:
                                                                      AssetImage(
                                                                    'assets/images/man1.png',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  DottedBorder(
                                                                borderType:
                                                                    BorderType
                                                                        .Circle,
                                                                dashPattern: [
                                                                  6,
                                                                  3
                                                                ],
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        45,
                                                                        45,
                                                                        45,
                                                                        0.5),
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6.5),
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    size: 15,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            45,
                                                                            45,
                                                                            45,
                                                                            0.5),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        'In Progress',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // fontFamily: 'poppins',
                                                          color: Color.fromRGBO(
                                                              45, 45, 45, 1),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color:
                                                              Color(0xFF4A4B57),
                                                          size: 20,
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
                                  ],
                                ),
                              ),
                              ///////////////// Today’s Task TabBarView end //////////////////
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildContainer(var option, var value) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            // 'Project:',
            option,
            style: TextStyle(
              color: Color.fromRGBO(45, 45, 45, 0.7),
            ),
          ),
          Text(
            // 'Web Designing',
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color.fromRGBO(45, 45, 45, 1),
            ),
          )
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Divider(
        color: Color.fromRGBO(45, 45, 45, 0.1),
        height: 1,
      ),
    );
  }
}
