import 'package:flutter/material.dart';

class EditProfileAgentPage extends StatefulWidget {
  @override
  _EditProfileAgentPageState createState() => _EditProfileAgentPageState();
}

class _EditProfileAgentPageState extends State<EditProfileAgentPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();

  bool _isEditable = false;

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
          'My Profile',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
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
              margin: EdgeInsets.only(top: 25, bottom: 15),
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
            // Container(
            //   margin: EdgeInsets.only(top: 25, bottom: 15),
            //   child: Center(
            //     child: Image.asset(
            //       'assets/images/Group711.png',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                margin: EdgeInsets.only(top: 15),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: _buildProfileInfoContainer(
                                'Email',
                                'andrewmilan@gmail.com',
                                'Email address',
                                emailController,
                                TextInputType.emailAddress,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isEditable = !_isEditable;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    right: 11, left: 13, top: 11, bottom: 11),
                                margin: EdgeInsets.only(right: 15, left: 15),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(1, 1, 211, 0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Color(0xFF0101D3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Phone',
                          '864275787628',
                          'Phone number',
                          phoneController,
                          TextInputType.phone,
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Country',
                          'United States',
                          'Country',
                          countryController,
                          TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'City',
                          'Greenville',
                          'City',
                          cityController,
                          TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Postcode',
                          '29601',
                          'Postcode',
                          postCodeController,
                          TextInputType.numberWithOptions(),
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
          _isEditable
              ? Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: TextField(
                    // controller: emailController,
                    controller: controller,
                    // keyboardType: TextInputType.emailAddress,
                    keyboardType: keyboardType,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins',
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
                      contentPadding: EdgeInsets.only(bottom: 5, top: 3),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF0101D3),
                        ),
                      ),
                    ),
                  ),
                )
              : Text(
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
}
