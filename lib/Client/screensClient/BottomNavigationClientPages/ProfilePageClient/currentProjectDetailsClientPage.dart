import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/Client/screensClient/BottomNavigationClientPages/ProfilePageClient/projectAnswersClientPage.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CurrentProjectDetailsClientPage extends StatefulWidget {
  @override
  _CurrentProjectDetailsClientPageState createState() =>
      _CurrentProjectDetailsClientPageState();
}

class _CurrentProjectDetailsClientPageState
    extends State<CurrentProjectDetailsClientPage> {
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
        // actions: [
        //   Container(
        //     margin: EdgeInsets.only(right: 20),
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Text(
        //           'Current',
        //           style: TextStyle(
        //             fontSize: 16,
        //             fontWeight: FontWeight.w500,
        //             color: Color(0xFF2D2D2D),
        //           ),
        //         ),
        //         SizedBox(width: 5),
        //         Icon(
        //           Icons.keyboard_arrow_down,
        //           color: Color(0xFF4A4B57),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              // length: 3,
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
                      insets:
                          EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                    ),
                    tabs: [
                      Tab(text: "Project Details"),
                      Tab(text: "Project Questions"),
                      // Tab(text: "Project Updates"),
                    ],
                  ),
                  ///////////////////////// tab bar end ///////////////////////

                  ///////////////////////// tab bar views start ///////////////////////
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        children: [
                          ///////////////// Project Details TabBarView start //////////////////
                          Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            margin: EdgeInsets.only(top: 15),
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              ),
                            ),
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Container(
                                child: Column(
                                  children: [
                                    /////////////////// project name start //////////////////
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 30, bottom: 15),
                                      child: Text(
                                        'Web Desiging and web UI/UX Design',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                    ),
                                    /////////////////// project name end //////////////////

                                    /////////////////// project description start //////////////////
                                    RichText(
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
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to desired screen
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                    /////////////////// project description end //////////////////

                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, bottom: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Client',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'poppins',
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6),
                                          Text(
                                            'Attached Files',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 7),
                                          child: CircleAvatar(
                                            radius: 25,
                                            child: Image.asset(
                                                'assets/images/man1.png'),
                                          ),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6.5),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 7,
                                              bottom: 7,
                                              left: 8,
                                              right: 8),
                                          margin: EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                45, 45, 45, 0.15),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Icon(
                                            Icons.picture_as_pdf,
                                            size: 35,
                                            color: Color(0xFFEC7A60),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 7,
                                              bottom: 7,
                                              left: 8,
                                              right: 8),
                                          margin: EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                45, 45, 45, 0.15),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Icon(
                                            FlutterIcons.file_document_mco,
                                            size: 35,
                                            color: Color(0xFF0101D3),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 7,
                                              bottom: 7,
                                              left: 8,
                                              right: 8),
                                          margin: EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                45, 45, 45, 0.15),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Icon(
                                            FlutterIcons.file_document_mco,
                                            size: 35,
                                            color: Color(0xFF0101D3),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Mr. Wanglu',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                45, 45, 45, 0.7)),
                                      ),
                                    ),

                                    //////////////////// deadline container start //////////////////////
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                right: 12,
                                                left: 14,
                                                top: 12,
                                                bottom: 12),
                                            margin: EdgeInsets.only(right: 20),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  1, 1, 211, 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Icon(
                                              FlutterIcons.calendar_clock_mco,
                                              color: Color(0xFF0101D3),
                                            ),
                                          ),
                                          Text(
                                            'Deadline: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  45, 45, 45, 0.7),
                                            ),
                                          ),
                                          Text(
                                            'Novermber 12:',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(45, 45, 45, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //////////////////// deadline container end //////////////////////

                                    ////////////////////// progress % container start /////////////////////////
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 30,
                                          bottom: 6,
                                          left: 5,
                                          right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Progress',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  45, 45, 45, 0.9),
                                            ),
                                          ),
                                          Text(
                                            '100%',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  45, 45, 45, 0.9),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        lineHeight: 8.0,
                                        percent: 0.8,
                                        backgroundColor: Color(0xFFF7F8FB),
                                        progressColor: Color(0xFF0101D3),
                                      ),
                                    ),
                                    ////////////////////// progress % container end /////////////////////////

                                    ///////////////////// project category start ///////////////////////
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 30, bottom: 15),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Category',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: FlatButton(
                                              color: Color(0xFF0101D3),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'Design',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'poppins',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Container(
                                            child: FlatButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                  width: 1,
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'Develop',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'poppins',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ///////////////////// project category end ///////////////////////

                                    ///////////////////// assignee container start //////////////////////
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 30, bottom: 15),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Assign To',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 30),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundImage: AssetImage(
                                                      'assets/images/man1.png',
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 45,
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
                                                  left: 90,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(15.5),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.white,
                                                        width: 1,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      color: Color(0xFF03AC62),
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
                                              padding: EdgeInsets.all(12),
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                                color: Color.fromRGBO(
                                                    45, 45, 45, 0.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ///////////////////// assignee container end //////////////////////

                                    //////////////////////// tasks list start //////////////////////////
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 0, bottom: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Tasks',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'poppins',
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              'Add New',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'poppins',
                                                color: Color.fromRGBO(
                                                    45, 45, 45, 0.6),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(1, 1, 211, 0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 20, right: 16),
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
                                                top: 0, bottom: 4, left: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Create Site map',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
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
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'poppins',
                                                    color: Color.fromRGBO(
                                                        45, 45, 45, 0.6),
                                                  ),
                                                ),
                                                SizedBox(width: 25),
                                                Text(
                                                  'Design',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
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
                                                        child: CircleAvatar(
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
                                                            border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 1,
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: CircleAvatar(
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
                                                        child: DottedBorder(
                                                          borderType:
                                                              BorderType.Circle,
                                                          dashPattern: [6, 3],
                                                          padding:
                                                              EdgeInsets.zero,
                                                          color: Color.fromRGBO(
                                                              45, 45, 45, 0.5),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
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
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'poppins',
                                                    color: Color.fromRGBO(
                                                        45, 45, 45, 1),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Color(0xFF4A4B57),
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //////////////////////// tasks list end //////////////////////////
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ///////////////// Project Details TabBarView end //////////////////

                          ///////////////// Project Questions TabBarView start //////////////////
                          Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 15),
                            margin: EdgeInsets.only(top: 15),
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              ),
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  //////////////////////// Add Question start //////////////////////////
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 0, bottom: 15, right: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            '+ Add Question',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'poppins',
                                              color: Color.fromRGBO(
                                                  45, 45, 45, 0.6),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //////////////////////// Add Question end //////////////////////////

                                  //////////////////////// Questions list start //////////////////////////
                                  Expanded(
                                    child: Container(
                                      child: ListView.builder(
                                        padding: EdgeInsets.only(
                                            left: 10.0, bottom: 5.0, top: 20),
                                        physics: BouncingScrollPhysics(),
                                        itemCount: 10,
                                        itemBuilder:
                                            (BuildContext ctx, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                ScaleRoute(
                                                  page:
                                                      ProjectAnswersClientPage(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 19),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 22.5,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Image.asset(
                                                          'assets/images/HomboltTechLogoLarge.png',
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 17),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    child: Text(
                                                                      'Administrator',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'poppins',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: Color(
                                                                            0xFF22215B),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      '14:59',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'poppins',
                                                                        fontSize:
                                                                            11,
                                                                        color: Color(
                                                                            0xFFAAAAAA),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            35),
                                                                child: Text(
                                                                  'new question',
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                              ),
                                                              // GestureDetector(
                                                              //   onTap: () {}, child:
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 3),
                                                                child: Text(
                                                                  '1 answer',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'poppins',
                                                                    fontSize:
                                                                        11,
                                                                    color: Color(
                                                                        0xFFAAAAAA),
                                                                  ),
                                                                ),
                                                              ),
                                                              // ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      top: 6,
                                                    ),
                                                    child: Divider(
                                                      color: Color.fromRGBO(
                                                          45, 45, 45, 0.1),
                                                      height: 1,
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
                                  //////////////////////// Questions list end //////////////////////////

                                  //////////////////////// Questions list start //////////////////////////

                                  //////////////////////// Questions list end //////////////////////////

                                  //////////////////////// Questions list start //////////////////////////

                                  //////////////////////// Questions list end //////////////////////////
                                ],
                              ),
                            ),
                          ),
                          ///////////////// Project Questions TabBarView end //////////////////

                          // ///////////////// Project Updates TabBarView start //////////////////
                          // Container(),
                          // ///////////////// Project Updates TabBarView end //////////////////
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
    );
  }
}
