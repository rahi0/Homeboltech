import 'package:flutter/material.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

import 'conversationClientPage.dart';

class ChatListClientPage extends StatefulWidget {
  @override
  _ChatListClientPageState createState() => _ChatListClientPageState();
}

class _ChatListClientPageState extends State<ChatListClientPage> {
  TextEditingController searchController = TextEditingController();

  bool _showSearchField = false;

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
          'Chat',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _showSearchField = !_showSearchField;
              });
            },
            icon: Icon(
              Icons.search,
              color: _showSearchField ? Color(0xFFF7F8FB) : Color(0xFF0101D3),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ////////////////////// search text field start //////////////////////
              if (_showSearchField)
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

              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      ///////////////////// tab bar start ///////////////////////
                      TabBar(
                        labelColor: Color(0xFF0101D3),
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontFamily: 'poppins',
                        ),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xFF0101D3),
                          ),
                          insets: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 5),
                        ),
                        tabs: [
                          Tab(text: "All"),
                          Tab(text: "Agents"),
                          Tab(text: "Admins"),
                        ],
                      ),
                      ///////////////////////// tab bar end ///////////////////////

                      ///////////////////////// tab bar views start ///////////////////////
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 18, right: 18),
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          child: TabBarView(
                            children: [
                              ///////////////////// all tab bar view start ///////////////////////
                              Container(
                                child: Column(
                                  children: [
                                    /////////////////// story list start //////////////////
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6.5,
                                      decoration: BoxDecoration(
                                        // color: Theme.of(context).accentColor,
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xFFF0F0F0),
                                          ),
                                        ),
                                      ),
                                      child: ListView.builder(
                                        padding: EdgeInsets.only(
                                            left: 10.0, bottom: 5.0),
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: 10,
                                        itemBuilder:
                                            (BuildContext ctx, int index) {
                                          return Container(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 17, bottom: 9),
                                                  child: index == 0
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  9.5),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Color.fromRGBO(
                                                                    50,
                                                                    38,
                                                                    68,
                                                                    0.1),
                                                          ),
                                                          child: Icon(
                                                            Icons.add,
                                                            size: 22,
                                                            color: Color(
                                                                0xFF2D3F65),
                                                          ),
                                                        )
                                                      : CircleAvatar(
                                                          radius: 21.5,
                                                          backgroundImage:
                                                              AssetImage(
                                                            'assets/images/man1.png',
                                                          ),
                                                        ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    index == 0
                                                        ? 'Add New'
                                                        : 'Andrew',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Color(0xFF2D3F65),
                                                      fontFamily: 'poppins',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    /////////////////// story list end //////////////////

                                    ////////////////////// chat list start /////////////////////
                                    Expanded(
                                      child: Container(
                                        child: ListView.builder(
                                          padding: EdgeInsets.only(
                                              left: 10.0, bottom: 5.0, top: 20),
                                          physics: BouncingScrollPhysics(),
                                          itemCount: 10,
                                          itemBuilder:
                                              (BuildContext ctx, int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  ScaleRoute(
                                                    page:
                                                        ConversationClientPage(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 19),
                                                child: Row(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 21.5,
                                                          backgroundImage:
                                                              AssetImage(
                                                            'assets/images/man1.png',
                                                          ),
                                                        ),
                                                        if (index == 2)
                                                          Positioned(
                                                            right: 0,
                                                            top: -3,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFF773D),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Text(
                                                                '17',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'poppins',
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 17),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child: Text(
                                                                    'Micheal Joshua',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Color(
                                                                          0xFF22215B),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    '14:59',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'poppins',
                                                                      fontSize:
                                                                          11,
                                                                      color: Color(
                                                                          0xFFAAAAAA),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          35),
                                                              child: Text(
                                                                'Just reached my new location mate',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                            if (index == 1)
                                                              Container(
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          54,
                                                                      width: 54,
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                              top: 5),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              5),
                                                                        ),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/rectangle1.png',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          54,
                                                                      width: 54,
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              5,
                                                                          left:
                                                                              6,
                                                                          right:
                                                                              6),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              5),
                                                                        ),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/rectangle2.png',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          54,
                                                                      width: 54,
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                              top: 5),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              5),
                                                                        ),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/rectangle3.png',
                                                                          fit: BoxFit
                                                                              .cover,
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
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    ////////////////////// chat list end /////////////////////
                                  ],
                                ),
                              ),
                              ///////////////////// all tab bar view end ///////////////////////

                              ///////////////////// agents tab bar view start ///////////////////////
                              Container(
                                child: Column(
                                  children: [
                                    Text('agents'),
                                  ],
                                ),
                              ),
                              ///////////////////// agents tab bar view end ///////////////////////

                              ///////////////////// admins tab bar view start ///////////////////////
                              Container(
                                child: Column(
                                  children: [
                                    Text('admins'),
                                  ],
                                ),
                              ),
                              ///////////////////// admins tab bar view end ///////////////////////
                            ],
                          ),
                        ),
                      ),
                      ///////////////////////// tab bar views end ///////////////////////
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
