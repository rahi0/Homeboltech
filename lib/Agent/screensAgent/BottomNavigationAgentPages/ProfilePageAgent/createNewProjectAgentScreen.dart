import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

import 'currentProjectsAgentPage.dart';

class CreateNewProjectAgentScreen extends StatefulWidget {
  @override
  _CreateNewProjectAgentScreenState createState() =>
      _CreateNewProjectAgentScreenState();
}

class _CreateNewProjectAgentScreenState
    extends State<CreateNewProjectAgentScreen> {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();

  List categoryList = ['Select Category', 'Design', 'Develop', 'C', 'D'];
  var _currentItemSelected = 'Select Category';

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
      print('_currentItemSelected ----------------------- ');
      print(_currentItemSelected);
    });
  }

  @override
  void initState() {
    setState(() {
      clientNameController.text = 'Mr. Wanglu';
      projectNameController.text = 'Web designing and Web UI/UX';
    });
    // TODO: implement initState
    super.initState();
  }

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
          'Create New Project',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // bottomNavigationBar:
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildProfileInfoContainer(
              //   'Description',
              //   '',
              //   projectDescriptionController,
              //   TextInputType.text,
              // ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: TextField(
                  maxLines: null,
                  controller: projectDescriptionController,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(45, 45, 45, 0.7),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 10, top: 5),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF0101D3),
                        width: 1,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(45, 45, 45, 0.1),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              ////////////////////// create task  button start //////////////////////
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SizeRoute(page: CurrentProjectsAgentPage()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 6, bottom: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF0101D3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Create Project',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ////////////////////// create task button end //////////////////////
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildProfileInfoContainer(
                'Client Name',
                '',
                clientNameController,
                TextInputType.text,
              ),
              SizedBox(height: 20),
              ///////////////////// Project Category selector field start //////////////////////
              Container(
                // margin: EdgeInsets.only(top: 10, bottom: 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Project Type',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(45, 45, 45, 0.7),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    value: _currentItemSelected,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2D2D2D),
                    ),
                    items: categoryList.map((var value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (var newValueSelected) {
                      _onDropDownItemSelected(newValueSelected);
                      // print(newValueSelected);
                    },
                  ),
                ),
              ),
              if (_currentItemSelected != 'Select Category')
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Questions',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ),
              Divider(
                color: Color.fromRGBO(45, 45, 45, 0.1),
                height: 1,
              ),
              ///////////////////// Project Category selector field end //////////////////////

              // _buildProfileInfoContainer(
              //   'Project Name',
              //   '',
              //   projectNameController,
              //   TextInputType.text,
              // ),
              // SizedBox(height: 20),

              // ///////////////////// Deadline entry field start //////////////////////
              // Container(
              //   margin: EdgeInsets.only(top: 30, bottom: 15),
              //   alignment: Alignment.centerLeft,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Deadline from',
              //             style: TextStyle(
              //               fontSize: 14,
              //               color: Color.fromRGBO(45, 45, 45, 0.7),
              //             ),
              //           ),
              //           SizedBox(height: 7),
              //           Row(
              //             children: [
              //               Icon(
              //                 Icons.calendar_today,
              //                 color: Color(0xFF0101D3),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.only(
              //                   left: 11,
              //                   right: 14,
              //                 ),
              //                 child: Text(
              //                   'July 10, 2020',
              //                   style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //               ),
              //               Icon(
              //                 Icons.keyboard_arrow_down,
              //                 color: Color(0xFF4A4B57),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Deadline to',
              //             style: TextStyle(
              //               fontSize: 14,
              //               color: Color.fromRGBO(45, 45, 45, 0.7),
              //             ),
              //           ),
              //           SizedBox(height: 7),
              //           Row(
              //             children: [
              //               Icon(
              //                 Icons.calendar_today,
              //                 color: Color(0xFF0101D3),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.only(
              //                   left: 11,
              //                   right: 14,
              //                 ),
              //                 child: Text(
              //                   'July 12, 2020',
              //                   style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //               ),
              //               Icon(
              //                 Icons.keyboard_arrow_down,
              //                 color: Color(0xFF4A4B57),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Divider(
              //   color: Color.fromRGBO(45, 45, 45, 0.1),
              //   height: 1,
              // ),
              // ///////////////////// Deadline entry field end //////////////////////

              ///////////////////// Attach File field start //////////////////////
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Attach File',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(45, 45, 45, 0.7),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 7, bottom: 7, left: 8, right: 8),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.picture_as_pdf,
                          size: 35,
                          color: Color(0xFFEC7A60),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 7, bottom: 7, left: 8, right: 8),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Color(0xFFC4C4C4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _showFilePicker();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 1),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        dashPattern: [6, 3],
                        padding: EdgeInsets.zero,
                        color: Color.fromRGBO(45, 45, 45, 0.5),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Color.fromRGBO(45, 45, 45, 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ///////////////////// Attach File field end //////////////////////

              ///////////////////// assignee container start //////////////////////
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Assign To',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(45, 45, 45, 0.7),
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
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: Color(0xFFC4C4C4),
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
                              padding: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                color: Color(0xFFC4C4C4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      child: DottedBorder(
                        borderType: BorderType.Circle,
                        dashPattern: [6, 3],
                        padding: EdgeInsets.zero,
                        color: Color.fromRGBO(45, 45, 45, 0.5),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Color.fromRGBO(45, 45, 45, 0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ///////////////////// assignee container end //////////////////////

              SizedBox(height: 250),
            ],
          ),
        ),
      ),
    );
  }

//
  Container _buildProfileInfoContainer(
    var label,
    var hintText,
    TextEditingController controller,
    TextInputType keyboardType,
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // 'Email',
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(45, 45, 45, 0.7),
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: TextField(
              maxLines: null,
              // controller: emailController,
              controller: controller,
              // keyboardType: TextInputType.emailAddress,
              keyboardType: keyboardType,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                // fontFamily: 'poppins',
              ),
              decoration: InputDecoration(
                // hintText: "Email address",
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 0.35),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(bottom: 12, top: 5),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF0101D3),
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(45, 45, 45, 0.1),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //
  ////////////////
  _showFilePicker() async {
    String file = await FilePicker.getFilePath(type: FileType.any);
    Navigator.pop(context);
    print('Sending attachment..');
  }
  /////////////////
}
