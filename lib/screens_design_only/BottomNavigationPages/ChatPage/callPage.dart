import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0101D3),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///////////////////// photo start ////////////////////////
            Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/images/man1.png',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width / 2.65,
                  bottom: -1,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF03AC62),
                    ),
                    child: Icon(
                      Icons.volume_up,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ///////////////////// photo end ////////////////////////
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'Micheal Joshua',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Text(
                // 'Contacting',
                '00:34',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ///////////////////// call options start //////////////////////
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              right: 12, left: 14, top: 12, bottom: 12),
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            FlutterIcons.volume_mute_mco,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Mute',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(right: 30, left: 30, bottom: 8),
                          padding: EdgeInsets.only(
                              right: 12, left: 14, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.chat,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.only(
                              right: 12, left: 14, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.volume_up,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Speaker',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showCallInviteBottomSheet(context);
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.only(
                              right: 12, left: 14, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.person_add,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showLeaveVoiceMsgBottomSheet(context);
                    },
                    child: Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(right: 30, left: 30, bottom: 8),
                          padding: EdgeInsets.only(
                              right: 12, left: 14, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.mic,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Record',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.only(
                              right: 12, left: 14, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFFEC7A60),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.phone,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'End',
                          style: TextStyle(
                            color: Color(0xFFEC7A60),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ///////////////////// call options end //////////////////////
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text(
                    'Collapse',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //////////////////// show add to call BottomSheet start ///////////////////////
  _showCallInviteBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 45),
          child: Wrap(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 35),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        FlutterIcons.search_faw,
                        size: 28,
                        color: Color(0xFF322644),
                      ),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'Invite to Call',
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color(0xFF3F3D56),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Select user',
                              style: TextStyle(
                                color: Color(0xFF3F3D56).withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6FA),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 25,
                          color: Color(0xFF322644),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    _buildContactContainer('assets/images/man1.png', 'Andrew'),
                    _buildContactContainer('assets/images/man1.png', 'Jashu'),
                    _buildContactContainer('assets/images/man1.png', 'Sara'),
                    _buildContactContainer('assets/images/man1.png', 'Michael'),
                    _buildContactContainer('assets/images/man1.png', 'John'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    _buildContactContainer('assets/images/man1.png', 'Micheal'),
                    _buildContactContainer('assets/images/man1.png', 'Sara'),
                    _buildContactContainer('assets/images/man1.png', 'John'),
                    _buildContactContainer('assets/images/man1.png', 'Jashu'),
                    _buildContactContainer('assets/images/man1.png', 'Andrew'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildContactContainer(var img, var name) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
              img,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 12,
                color: Color(0xFF2D3F65),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //////////////////// show add to call BottomSheet end ///////////////////////

  //////////////////// show record voice msg BottomSheet start ///////////////////////
  //////////////////// show add to call BottomSheet start ///////////////////////
  _showLeaveVoiceMsgBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 45),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 25, left: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'Leave voice message',
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color(0xFF2D2D2D),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Start and talk',
                              style: TextStyle(
                                color: Color(0xFF3F3D56).withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6FA),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 25,
                          color: Color(0xFF322644),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              /////////////////////// record icon button start //////////////////////////
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(45),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6FA),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mic,
                      size: 70,
                      color: Color(0xFF0101D3),
                    ),
                  ),
                ),
              ),
              /////////////////////// record icon button end //////////////////////////
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 0),
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF5F6FA),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Go to chat',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  //////////////////// show record voice msg BottomSheet end ///////////////////////

}
