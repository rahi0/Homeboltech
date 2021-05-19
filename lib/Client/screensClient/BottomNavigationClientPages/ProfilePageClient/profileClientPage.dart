import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/Client/screensClient/BottomNavigationClientPages/ProfilePageClient/editProfileClientPage.dart';
import 'package:homeboltech/Client/screensClient/BottomNavigationClientPages/ProfilePageClient/settingsClientPage.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

class ProfileClientPage extends StatefulWidget {
  @override
  _ProfileClientPageState createState() => _ProfileClientPageState();
}

class _ProfileClientPageState extends State<ProfileClientPage> {
  bool _showProjectsSubList = false;
  bool _showTasksSubList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F8FB),
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Color(0xFF0101D3),
        //   ),
        // ),
        title: Text(
          'Profile',
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
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset('assets/images/man1.png'),
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
                            ScaleRoute(page: EditProfileClientPage()),
                          );
                        },
                        child: _buildListItemRow(
                          FlutterIcons.user_faw,
                          Color(0xFF0101D3),
                          Color.fromRGBO(1, 1, 211, 0.1),
                          'My Profile',
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       _showProjectsSubList = !_showProjectsSubList;
                      //     });
                      //   },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       _buildListItemRow(
                      //         FlutterIcons.text_document_inverted_ent,
                      //         Color(0xFFF5BF43),
                      //         Color.fromRGBO(245, 191, 67, 0.15),
                      //         'Projects',
                      //       ),
                      //       Container(
                      //         margin: EdgeInsets.only(top: 22),
                      //         child: Icon(
                      //           Icons.keyboard_arrow_down,
                      //           size: 28,
                      //           color: Color(0xFF9CA1B2),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // if (_showProjectsSubList)
                      //   Container(
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(
                      //               context,
                      //               ScaleRoute(page: CurrentProjectsPage()),
                      //             );
                      //           },
                      //           child: Container(
                      //             margin: EdgeInsets.only(top: 15),
                      //             child: Text(
                      //               'Current Projects',
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(
                      //               context,
                      //               ScaleRoute(page: CompletedProjectsPage()),
                      //             );
                      //           },
                      //           child: Container(
                      //             margin: EdgeInsets.only(top: 25, bottom: 25),
                      //             child: Text(
                      //               'Completed Projects',
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(
                      //               context,
                      //               ScaleRoute(page: PendingProjectsPage()),
                      //             );
                      //           },
                      //           child: Container(
                      //             margin: EdgeInsets.only(bottom: 25),
                      //             child: Text(
                      //               'Pending Projects',
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(
                      //               context,
                      //               ScaleRoute(page: CancelledProjectsPage()),
                      //             );
                      //           },
                      //           child: Container(
                      //             child: Text(
                      //               'Cancelled Projects',
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       ScaleRoute(page: PaymentAndBillingScreen()),
                      //     );
                      //   },
                      //   child: _buildListItemRow(
                      //     FlutterIcons.user_faw,
                      //     Color(0xFF03AC62),
                      //     Color.fromRGBO(3, 172, 98, 0.15),
                      //     'Payments & Billing',
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   // crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     _buildListItemRow(
                      //       Icons.assignment_turned_in,
                      //       Color(0xFFEC7A60),
                      //       Color.fromRGBO(236, 122, 96, 0.15),
                      //       'Task',
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.only(top: 22),
                      //       child: IconButton(
                      //         icon: Icon(
                      //           Icons.keyboard_arrow_down,
                      //           size: 28,
                      //           color: Color(0xFF9CA1B2),
                      //         ),
                      //         onPressed: () {
                      //           setState(() {
                      //             _showTasksSubList = !_showTasksSubList;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // if (_showTasksSubList)
                      //   Container(
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(
                      //               context,
                      //               ScaleRoute(page: CurrentTasksPage()),
                      //             );
                      //           },
                      //           child: Container(
                      //             margin: EdgeInsets.only(top: 15, bottom: 25),
                      //             child: Text(
                      //               'Current Task',
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(
                      //               context,
                      //               ScaleRoute(page: PendingTaskPage()),
                      //             );
                      //           },
                      //           child: Container(
                      //             child: Text(
                      //               'Pending Task',
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       ScaleRoute(page: AgentsListScreen()),
                      //     );
                      //   },
                      //   child: Container(
                      //     margin: EdgeInsets.only(top: 25, left: 10),
                      //     child: Row(
                      //       children: [
                      //         Container(
                      //           padding: EdgeInsets.all(16.5),
                      //           margin: EdgeInsets.only(right: 20),
                      //           decoration: BoxDecoration(
                      //             color: Color.fromRGBO(45, 45, 45, 0.15),
                      //             borderRadius: BorderRadius.circular(15),
                      //           ),
                      //           child:
                      //               Image.asset('assets/images/agentIcon.png'),
                      //         ),
                      //         Container(
                      //           child: Text(
                      //             'My Agents',
                      //             style: TextStyle(
                      //               fontSize: 16,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // // _buildListItemRow(
                      // //   // FlutterIcons.support_agent_mdi,
                      // //   Icons.people_outline,
                      // //   Color(0xFF2D2D2D),
                      // //   Color.fromRGBO(45, 45, 45, 0.15),
                      // //   'My Agents',
                      // // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            ScaleRoute(page: SettingsClientPage()),
                          );
                        },
                        child: _buildListItemRow(
                          Icons.settings,
                          Color(0xFF0101D3),
                          Color.fromRGBO(1, 1, 211, 0.1),
                          'Settings',
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
            padding: EdgeInsets.only(right: 12, left: 14, top: 12, bottom: 12),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: iconContainerColor,
              // color: Color.fromRGBO(1, 1, 211, 0.1),
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
