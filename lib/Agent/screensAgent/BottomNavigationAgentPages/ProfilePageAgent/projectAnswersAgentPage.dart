import 'package:flutter/material.dart';

class ProjectAnswersAgentPage extends StatefulWidget {
  @override
  _ProjectAnswersAgentPageState createState() => _ProjectAnswersAgentPageState();
}

class _ProjectAnswersAgentPageState extends State<ProjectAnswersAgentPage> {
  TextEditingController answerController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  var _showReplyFieldIndex = -1;
  var _showReplyIndex = -1;

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
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFF5F6FA),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  maxLines: null,
                  focusNode: focusNode,
                  controller: answerController,
                  decoration: InputDecoration(
                    hintText: "Write an answer",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(45, 45, 45, 0.35),
                    ),
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(left: 11, top: 12, bottom: 12),
                    border: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin:
                      EdgeInsets.only(right: 10, left: 20, top: 6, bottom: 6),
                  padding:
                      EdgeInsets.only(right: 11, left: 13, top: 11, bottom: 11),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.send,
                    color: Color(0xFF0101D3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //////////////////////// answer count start //////////////////////////
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 12, right: 0),
              child: Text(
                '10 answers',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                  color: Color.fromRGBO(45, 45, 45, 0.6),
                ),
              ),
            ),
            //////////////////////// answer count end //////////////////////////

            Divider(
              color: Color.fromRGBO(45, 45, 45, 0.1),
              height: 1,
            ),

            //////////////////////// answer list start //////////////////////////
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 20),
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 19),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 22.5,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'assets/images/HomboltTechLogoLarge.png',
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 17),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Administrator',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'poppins',
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF22215B),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              '14:59',
                                              style: TextStyle(
                                                fontFamily: 'poppins',
                                                fontSize: 11,
                                                color: Color(0xFFAAAAAA),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 35),
                                        child: Text(
                                          'new question new questionnew questionnew questionnew questionnew question new question new question new question new question',
                                          // maxLines: 1,
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _showReplyIndex = index;
                                                });
                                              },
                                              child: Text(
                                                '1 reply',
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 11,
                                                  color: Color(0xFFAAAAAA),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _showReplyFieldIndex = index;
                                                });
                                              },
                                              child: Text(
                                                'Reply',
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFFAAAAAA),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (index == _showReplyFieldIndex)
                                        _buildReplyField(),
                                      if (index == _showReplyIndex)
                                        _buildReplyContainer(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            //////////////////////// answer list end //////////////////////////
          ],
        ),
      ),
    );
  }

  ///////////////// reply textField container start ////////////////////
  _buildReplyField() {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 7, left: 0, right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFF5F6FA),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              focusNode: focusNode,
              controller: answerController,
              decoration: InputDecoration(
                hintText: "Write a reply",
                hintStyle: TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 0.35),
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(left: 11, top: 14, bottom: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 7),
              child: Icon(
                Icons.send,
                color: Color(0xFF0101D3),
              ),
            ),
          ),
        ],
      ),
    );
  }
  ///////////////// reply textField container end ////////////////////

  ////////////////// reply container start //////////////////////
  _buildReplyContainer() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22.5,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/HomboltTechLogoLarge.png',
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Administrator',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF22215B),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '14:59',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 11,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 35),
                    child: Text(
                      'new question question new  new new question new question',
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(),
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
  ////////////////// reply container end //////////////////////
}
