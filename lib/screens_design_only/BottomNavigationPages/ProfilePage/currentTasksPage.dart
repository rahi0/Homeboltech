import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:homeboltech/screens_design_only/BottomNavigationPages/ProfilePage/taskDetailsPage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CurrentTasksPage extends StatefulWidget {
  @override
  _CurrentTasksPageState createState() => _CurrentTasksPageState();
}

class _CurrentTasksPageState extends State<CurrentTasksPage> {
  TextEditingController searchController = TextEditingController();

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
          'Task',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
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
          child: Container(
            child: Column(
              children: [
                ////////////////////// search text field start //////////////////////
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F8FB),
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
                      hintText: "Search tasks",
                      hintStyle: TextStyle(
                        color: Color(0xFF9696A0),
                      ),
                      contentPadding:
                          EdgeInsets.only(left: 10, top: 17, bottom: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ////////////////////// search text field end //////////////////////

                //////////////////// current tasks text start /////////////////////
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Current Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                //////////////////// current tasks text end /////////////////////

                //////////////////// current tasks card grid start /////////////////////
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 0.8,
                    // childAspectRatio: MediaQuery.of(context).size.width /
                    //     (MediaQuery.of(context).size.height / 1.45),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          ScaleRoute(page: TaskDetailsPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(1, 1, 211, 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Sep 20, 2020',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(45, 45, 45, 0.8),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FlutterIcons.dots_two_vertical_ent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 15, bottom: 4, left: 15),
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
                              margin: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'by Andrew',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(45, 45, 45, 0.7),
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  Text(
                                    'Design',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(45, 45, 45, 0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'In Progress',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(45, 45, 45, 1),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 13),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFF4A4B57),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 20, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                              'assets/images/man1.png',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 15,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundImage: AssetImage(
                                                'assets/images/man1.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 30,
                                          child: Container(
                                            padding: EdgeInsets.all(5.5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              shape: BoxShape.circle,
                                              color: Color(0xFF2D2D2D),
                                            ),
                                            child: Text(
                                              '1+',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: DottedBorder(
                                            borderType: BorderType.Circle,
                                            dashPattern: [6, 3],
                                            padding: EdgeInsets.zero,
                                            color:
                                                Color.fromRGBO(45, 45, 45, 0.5),
                                            child: Container(
                                              padding: EdgeInsets.all(3.5),
                                              child: Icon(
                                                Icons.add,
                                                size: 12,
                                                color: Color.fromRGBO(
                                                    45, 45, 45, 0.5),
                                              ),
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
                    );
                  },
                ),
                //////////////////// current tasks card grid end /////////////////////
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
