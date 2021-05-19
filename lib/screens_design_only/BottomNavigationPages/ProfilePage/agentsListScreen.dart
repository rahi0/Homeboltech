import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

import 'agentProfileScreen.dart';

class AgentsListScreen extends StatefulWidget {
  @override
  _AgentsListScreenState createState() => _AgentsListScreenState();
}

class _AgentsListScreenState extends State<AgentsListScreen> {
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
          'Agents',
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
              ////////////////////// search text field start //////////////////////
              Container(
                margin:
                    EdgeInsets.only(top: 19, left: 20, right: 20, bottom: 5),
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
                    hintText: "Search",
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

              //////////////////// agents grid view start /////////////////////
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 0.85,
                    // childAspectRatio: MediaQuery.of(context).size.width /
                    //     (MediaQuery.of(context).size.height / 1.5),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          ScaleRoute(page: AgentProfileScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FlutterIcons.dots_two_vertical_ent,
                                ),
                              ),
                            ),
                            Container(
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                  'assets/images/man1.png',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 3, top: 13),
                              child: Text(
                                'John Due',
                                style: TextStyle(
                                  color: Color(0xFF2D2D2D),
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'ID:2023',
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 45, 45, 0.7),
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              //////////////////// agents grid view end /////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
