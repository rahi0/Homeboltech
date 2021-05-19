import 'package:flutter/material.dart';

class IncomingCallAgentScreen extends StatefulWidget {
  @override
  _IncomingCallAgentScreenState createState() => _IncomingCallAgentScreenState();
}

class _IncomingCallAgentScreenState extends State<IncomingCallAgentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0101D3),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              child: Text(
                'Is Calling',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            //////////////////// receive/decline call buttons start ////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          Icons.call_end,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Decline',
                        style: TextStyle(
                          color: Color(0xFFEC7A60),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.only(
                              right: 12, left: 14, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFF03AC62),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.phone,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //////////////////// receive/decline call buttons end ////////////////////
          ],
        ),
      ),
    );
  }
}
