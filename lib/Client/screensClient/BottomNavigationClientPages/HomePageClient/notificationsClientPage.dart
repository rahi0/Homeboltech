// NotificationsClientPage
import 'package:flutter/material.dart';

class NotificationsClientPage extends StatefulWidget {
  @override
  _NotificationsClientPageState createState() => _NotificationsClientPageState();
}

class _NotificationsClientPageState extends State<NotificationsClientPage> {
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
          'Notifications',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(top: 15),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(top: 0, bottom: 0),
              child: Column(
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 11,
                      top: 10,
                      bottom: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 0, top: 0),
                          padding: EdgeInsets.all(1.0),
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/man1.png'),
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.grey[50], // border color
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Charlie Pruette has created a new project-39",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "1 day ago",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
