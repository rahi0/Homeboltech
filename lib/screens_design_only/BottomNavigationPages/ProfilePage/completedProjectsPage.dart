import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CompletedProjectsPage extends StatefulWidget {
  @override
  _CompletedProjectsPageState createState() => _CompletedProjectsPageState();
}

class _CompletedProjectsPageState extends State<CompletedProjectsPage> {
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
          'Projects',
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
                      hintText: "Search projects",
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

                //////////////////// Completed projects text start /////////////////////
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Completed Projects',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                //////////////////// Completed projects text end /////////////////////

                //////////////////// Completed projects card grid start /////////////////////
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
                    return Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(3, 172, 98, 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            margin: EdgeInsets.only(top: 17, bottom: 4),
                            child: Text(
                              'Web Designing',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ),
                          Text(
                            'Prototyping',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(45, 45, 45, 0.7),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 18, bottom: 3, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Progress',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Color.fromRGBO(45, 45, 45, 0.9),
                                  ),
                                ),
                                Text(
                                  '100%',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Color.fromRGBO(45, 45, 45, 0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 3),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width / 2.9,
                              lineHeight: 5.0,
                              percent: 1.0,
                              backgroundColor: Colors.white,
                              progressColor: Color(0xFF03AC62),
                            ),
                          ),
                          //
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        right: 25,
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
                                        right: 10,
                                        child: Container(
                                          padding: EdgeInsets.all(5.5),
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
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Completed',
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                //////////////////// Completed projects card grid end /////////////////////
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
