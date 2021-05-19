import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/ChatPageAdmin/callPageAdmin.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/ChatPageAdmin/videoCallPageAdmin.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

class ConversationAdminPage extends StatefulWidget {
  @override
  _ConversationAdminPageState createState() => _ConversationAdminPageState();
}

class _ConversationAdminPageState extends State<ConversationAdminPage> {
  TextEditingController msgController = TextEditingController();

  bool _showMediaOptions = false;

  final FocusNode focusNode = FocusNode();

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
        titleSpacing: 0,
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
                      'Online',
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(
                  page: CallAdminPage(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 7, bottom: 7),
              padding: EdgeInsets.only(right: 12, left: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.phone,
                color: Color(0xFF0101D3),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(
                  page: VideoCallAdminPage(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 7, bottom: 7),
              padding: EdgeInsets.only(right: 12, left: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.videocam,
                color: Color(0xFF0101D3),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 6,
                    reverse: true,
                    itemBuilder: (BuildContext ctx, int index) {
                      return index % 2 == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      color: Color(0xFFF5F6FA),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        // bottomRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                    // margin: EdgeInsets.all(8),
                                    margin: EdgeInsets.only(
                                        bottom: 15, top: index == 4 ? 15 : 0),
                                    // padding: EdgeInsets.all(16),
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 20,
                                        right: 15),
                                    width: MediaQuery.of(context).size.width /
                                        1.75,
                                    child: index == 2
                                        ? Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  right: 15,
                                                ),
                                                padding: EdgeInsets.only(
                                                    right: 12,
                                                    left: 14,
                                                    top: 12,
                                                    bottom: 12),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFF773D),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Icon(
                                                  FlutterIcons.mic_fea,
                                                  size: 28,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Voice Chat',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'Tap to call again',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xFF282828)
                                                          .withOpacity(0.7),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Text(
                                            'Can we make quick call to discuss more',
                                          ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                if (index != 3)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 9, top: index == 1 ? 37 : 15),
                                        child: CircleAvatar(
                                          radius: 16.5,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              'assets/images/man1.png'),
                                        ),
                                        decoration: new BoxDecoration(
                                          color:
                                              Colors.grey[50], // border color
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: new BoxDecoration(
                                                color: Color(0xFF0101D3),
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  // bottomLeft: Radius.circular(25),
                                                  topRight: Radius.circular(20),
                                                  topLeft: Radius.circular(20),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(
                                                  bottom:
                                                      index == 5 || index == 1
                                                          ? 9
                                                          : 15,
                                                  left: 9),
                                              padding: EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 15,
                                                  right: 20,
                                                  left: 15),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.75,
                                              child: index == 1
                                                  ? Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                            right: 10,
                                                          ),
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons.pause,
                                                            size: 28,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                          margin:
                                                              EdgeInsets.only(
                                                            right: 10,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/voiceNote.png',
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Container(
                                                            child: Text(
                                                              '02:30',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'poppins',
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Text(
                                                      'Hey there , What’s up?',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                            ),
                                            if (index == 1)
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 124,
                                                      width: 110,
                                                      margin: EdgeInsets.only(
                                                          top: 0, left: 10),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(5),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/rectangle88.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 124,
                                                      width: 110,
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(5),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/rectangle90.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                if (index == 5)
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width /
                                                4.5),
                                    child: Text(
                                      'Jan 25, 2020',
                                      style: TextStyle(
                                        color: Color(0xFFAAAAAA),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                    }),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 9, top: 5),
                child: Text(
                  'Micheal is Typing...',
                  style: TextStyle(
                    color: Color.fromRGBO(45, 45, 45, 0.3),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_showMediaOptions == false) {
                          setState(() {
                            _showMediaOptions = true;
                            focusNode.unfocus();
                          });
                        } else
                          _showAttachmentBottomSheet(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10, top: 0, bottom: 12),
                        padding: EdgeInsets.only(
                            right: 12, left: 14, top: 12, bottom: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFF0101D3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          _showMediaOptions
                              ? Icons.add
                              : Icons.keyboard_arrow_right,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (_showMediaOptions)
                      Container(
                        margin: EdgeInsets.only(
                            right: 5, top: 0, bottom: 12, left: 5),
                        child: IconButton(
                          onPressed: () {
                            showFilePicker(FileType.image);
                          },
                          icon: Icon(
                            FlutterIcons.camera_fea,
                            size: 28,
                            color: Color(0xFF0101D3),
                          ),
                        ),
                      ),
                    if (_showMediaOptions)
                      Container(
                        margin: EdgeInsets.only(right: 5, top: 0, bottom: 12),
                        child: IconButton(
                          onPressed: () {
                            showFilePicker(FileType.audio);
                          },
                          icon: Icon(
                            FlutterIcons.mic_fea,
                            size: 28,
                            color: Color(0xFF0101D3),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15, left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF5F6FA),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onTap: () {
                                  setState(() {
                                    _showMediaOptions = false;
                                  });
                                },
                                maxLines: null,
                                focusNode: focusNode,
                                controller: msgController,
                                decoration: InputDecoration(
                                  hintText: "Aa",
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(45, 45, 45, 0.35),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: 11, top: 20, bottom: 20),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10, left: 20, top: 7, bottom: 7),
                              padding: EdgeInsets.only(
                                  right: 12, left: 14, top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.send,
                                color: Color(0xFF0101D3),
                              ),
                            ),
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
    );
  }

  //////////////////// showAttachmentBottomSheet start ///////////////////////
  _showAttachmentBottomSheet(context) {
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
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 25, right: 20),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.videocam,
                    color: Color.fromRGBO(45, 45, 45, 0.9),
                  ),
                  title: Text('Video'),
                  onTap: () => showFilePicker(FileType.video),
                ),
                Divider(
                  color: Color.fromRGBO(45, 45, 45, 0.1),
                  height: 1,
                ),
                ListTile(
                  leading: Icon(
                    FlutterIcons.file_document_mco,
                    color: Color.fromRGBO(45, 45, 45, 0.9),
                  ),
                  title: Text('File'),
                  onTap: () => showFilePicker(FileType.any),
                ),
                Divider(
                  color: Color.fromRGBO(45, 45, 45, 0.1),
                  height: 1,
                ),
                ListTile(
                  leading: Icon(
                    Icons.image,
                    color: Color.fromRGBO(45, 45, 45, 0.9),
                  ),
                  title: Text('Image'),
                  onTap: () => showFilePicker(FileType.image),
                ),
              ],
            ),
          );
        });
  }
  //////////////////// showAttachmentBottomSheet end  ///////////////////////

  ////////////////
  showFilePicker(FileType fileType) async {
    // FilePickerResult filePickerResult =
    //     await FilePicker.platform.pickFiles(type: fileType);
    String file = await FilePicker.getFilePath(type: fileType);
    Navigator.pop(context);
    print('Sending attachment..');
  }
  /////////////////

}
