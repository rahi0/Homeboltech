import 'package:flutter/material.dart';

class VideoCallAgentPage extends StatefulWidget {
  @override
  _VideoCallAgentPageState createState() => _VideoCallAgentPageState();
}

class _VideoCallAgentPageState extends State<VideoCallAgentPage> {
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
        title: Container(
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/man1.png',
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Micheal Jordan',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF2D2D2D),
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Manger',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF2D2D2D).withOpacity(0.5),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              right: 20,
            ),
            child: Text(
              '00:30',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // child: ClipRRect(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(35),
                //   ),
                child: Image.asset(
                  'assets/images/rectangle54.png',
                  fit: BoxFit.cover,
                ),
                // ),
              ),
              Positioned(
                bottom: 20,
                right: MediaQuery.of(context).size.width / 5,
                child: Container(
                  child: Row(
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
                      Container(
                        margin: EdgeInsets.only(bottom: 8, left: 20, right: 20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.videocam_off,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.chat,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
