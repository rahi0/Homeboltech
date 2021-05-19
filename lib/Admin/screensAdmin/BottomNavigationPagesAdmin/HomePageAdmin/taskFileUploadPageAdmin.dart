import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskFileUploadAdminPage extends StatefulWidget {
  @override
  _TaskFileUploadAdminPageState createState() => _TaskFileUploadAdminPageState();
}

class _TaskFileUploadAdminPageState extends State<TaskFileUploadAdminPage> {
  bool _isUploading = true;

  _completeUpload() async {
    await Future.delayed(Duration(seconds: 5));

    setState(() {
      _isUploading = false;
    });
  }

  @override
  void initState() {
    _completeUpload();
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
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  // only(
                  //   topLeft: Radius.circular(35),
                  //   topRight: Radius.circular(35),
                  // ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 17, bottom: 21),
                      decoration: BoxDecoration(
                        color: Color(0xFFE9ECFE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: _isUploading
                          ? Center(
                              child: Image.asset(
                                'assets/images/imgPlaceholder.png',
                                fit: BoxFit.contain,
                              ),
                            )
                          : Image.asset(
                              'assets/images/rectangle89.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                    ////////////////  Uploading progress start /////////////////
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 17),
                      child: Text(
                        'Uploading',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4B4F5B),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // height: 30,
                          margin: EdgeInsets.only(top: 10),
                          child: Icon(
                            FlutterIcons.file_zip_o_faw,
                            size: 30,
                            color: Color(0xFF0101D3),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 18, bottom: 3, left: 25),
                              child: Row(
                                children: [
                                  Text(
                                    'Invoice_01',
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      color: Color(0xFF4B4F5B),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                  ),
                                  Text(
                                    _isUploading ? '70%' : '100%',
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 12,
                                      color: Color.fromRGBO(75, 79, 91, 0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //
                            Container(
                              margin: EdgeInsets.only(top: 3, left: 10),
                              child: LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width / 1.5,
                                lineHeight: 5.0,
                                percent: _isUploading ? 0.7 : 1.0,
                                backgroundColor: Color(0xFFE9ECFE),
                                progressColor: Color(0xFF0101D3),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: _isUploading
                                ? Color.fromRGBO(236, 122, 96, 0.1)
                                : Color.fromRGBO(3, 172, 98, 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            _isUploading ? Icons.close : Icons.check,
                            color: _isUploading
                                ? Color(0xFFEC7A60)
                                : Color(0xFF03AC62),
                          ),
                        ),
                      ],
                    ),
                    ////////////////  Uploading progress end /////////////////
                    SizedBox(height: 30),
                  ],
                ),
              ),
              ////////////////////// save button start //////////////////////
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  margin:
                      EdgeInsets.only(top: 50, bottom: 70, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF0101D3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ////////////////////// save button end //////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
