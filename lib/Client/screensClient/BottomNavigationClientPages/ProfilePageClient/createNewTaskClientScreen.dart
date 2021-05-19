import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:intl/intl.dart';

import 'currentTasksClientPage.dart';


class CreateNewTaskClientScreen extends StatefulWidget {
  @override
  _CreateNewTaskClientScreenState createState() => _CreateNewTaskClientScreenState();
}

class _CreateNewTaskClientScreenState extends State<CreateNewTaskClientScreen> {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();

  ///////////////////// Date Picker Essentials Start ///////////////////////
  String dateTo = '';
  DateTime selectedDateTo = DateTime.now();
  var dateTextController = new TextEditingController();

  Future<Null> _selectDateTo(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xFF0101D3),
              ),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        },
        context: context,
        initialDate: selectedDateTo,
        firstDate: DateTime(1964, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateTo) {
      setState(() {
        selectedDateTo = picked;
        // dateTo = "${DateFormat("dd/MM/yyyy").format(selectedDateTo)}";
        dateTo = "${DateFormat("yyyy-MM-dd").format(selectedDateTo)}";
      });
    }
  }
  ///////////////////// Date Picker Essentials End ///////////////////////

  List categoryList = ['Design', 'Develop', 'C', 'D'];
  var _currentItemSelected = 'Design';

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
          'Create New Task',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                    SizeRoute(page: CurrentTasksClientPage()),
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
                    'Create Task',
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
              _buildProfileInfoContainer(
                'Project Name',
                '',
                projectNameController,
                TextInputType.text,
              ),
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
              //           GestureDetector(
              //             onTap: () {
              //               _selectDateTo(context);
              //             },
              //             child: Row(
              //               children: [
              //                 Icon(
              //                   Icons.calendar_today,
              //                   color: Color(0xFF0101D3),
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.only(
              //                     left: 11,
              //                     right: 14,
              //                   ),
              //                   child: Text(
              //                     'July 10, 2020',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.w500,
              //                     ),
              //                   ),
              //                 ),
              //                 Icon(
              //                   Icons.keyboard_arrow_down,
              //                   color: Color(0xFF4A4B57),
              //                 ),
              //               ],
              //             ),
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
              //           GestureDetector(
              //             onTap: () {
              //               _selectDateTo(context);
              //             },
              //             child: Row(
              //               children: [
              //                 Icon(
              //                   Icons.calendar_today,
              //                   color: Color(0xFF0101D3),
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.only(
              //                     left: 11,
              //                     right: 14,
              //                   ),
              //                   child: Text(
              //                     'July 12, 2020',
              //                     style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.w500,
              //                     ),
              //                   ),
              //                 ),
              //                 Icon(
              //                   Icons.keyboard_arrow_down,
              //                   color: Color(0xFF4A4B57),
              //                 ),
              //               ],
              //             ),
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
                margin: EdgeInsets.only(bottom: 15),
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
              Divider(
                color: Color.fromRGBO(45, 45, 45, 0.1),
                height: 1,
              ),
              ///////////////////// assignee container end //////////////////////

              ///////////////////// Category selector field start //////////////////////
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category',
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
              Divider(
                color: Color.fromRGBO(45, 45, 45, 0.1),
                height: 1,
              ),
              ///////////////////// Category selector field end //////////////////////

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
}
