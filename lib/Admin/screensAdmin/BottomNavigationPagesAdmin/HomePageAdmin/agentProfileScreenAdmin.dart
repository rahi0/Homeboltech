import 'package:flutter/material.dart';

class AgentProfileAdminScreen extends StatefulWidget {
  @override
  _AgentProfileAdminScreenState createState() => _AgentProfileAdminScreenState();
}

class _AgentProfileAdminScreenState extends State<AgentProfileAdminScreen> {
  // TextEditingController idController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController countryController = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  // TextEditingController postCodeController = TextEditingController();

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
        actions: [
          Container(
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              icon: Icon(
                Icons.more_vert,
                color: Color(0xFF2D2D2D),
              ),
              itemBuilder: (_) => <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  child: GestureDetector(
                    onTap: () {
                      _showConfirmDeleteBottomSheet(context);
                    },
                    child: Text('Delete Agent'),
                  ),
                ),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     // _showConfirmDeleteBottomSheet(context);
          //     showMenu(
          //       context: context,
          //       position: null,
          //       items: [
          //         PopupMenuItem(
          //           child: Text('Delete Agent'),
          //         ),
          //       ],
          //     );
          //   },
          //   icon: Icon(
          //     Icons.more_vert,
          //     color: Color(0xFF2D2D2D),
          //   ),
          // ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/proBg.png"),
                  // fit: BoxFit.cover,
                ),
              ),
              margin: EdgeInsets.only(top: 25, bottom: 12),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 50,
                        child: Image.asset('assets/images/man1.png'),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Andrew milan',
                      style: TextStyle(
                        color: Color(0xFF2D2D2D),
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Assigned Projects: ',
                    style: TextStyle(
                      color: Color.fromRGBO(45, 45, 45, 0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '20',
                    style: TextStyle(
                      color: Color.fromRGBO(45, 45, 45, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                margin: EdgeInsets.only(top: 17),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.only(top: 25, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfileInfoContainer(
                          'ID',
                          '2023',
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Email',
                          'andrewmilan@gmail.com',
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Phone',
                          '864275787628',
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Country',
                          'United States',
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'City',
                          'Greenville',
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Postcode',
                          '29601',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildProfileInfoContainer(
    var label,
    var text,
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
          Text(
            // 'andrewmilan@gmail.com',
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'poppins',
            ),
          ),
        ],
      ),
    );
  }


  ///////////////////// delete confiration modal start ////////////////////////
  _showConfirmDeleteBottomSheet(context) {
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
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child:
              //  Wrap(
              //   children: <Widget>[
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 35, bottom: 30),
                child: Text(
                  'Do you want to delete “John Due” permanantly?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //////////// no button start //////////////
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        margin: EdgeInsets.only(
                            top: 0, bottom: 40, left: 0, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F8FB),
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    //////////// no button end //////////////

                    //////////// yes button start //////////////
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        margin: EdgeInsets.only(
                            top: 0, bottom: 40, left: 20, right: 0),
                        decoration: BoxDecoration(
                          color: Color(0xFF0101D3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    //////////// yes button end //////////////
                  ],
                ),
              ),
            ],
          ),
          //   ],
          // ),
        );
      },
    );
  }
  ///////////////////// delete confiration modal end ////////////////////////
}
