import 'package:flutter/material.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

import 'agentsListAgentScreen.dart';

class AddAgentAgentScreen extends StatefulWidget {
  @override
  _AddAgentAgentScreenState createState() => _AddAgentAgentScreenState();
}

class _AddAgentAgentScreenState extends State<AddAgentAgentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();

  @override
  void initState() {
    setState(() {
      nameController.text = 'John Doe';
      emailController.text = 'johndue@gmail.com';
      phoneController.text = '864275787628';
      countryController.text = 'United States';
      cityController.text = 'Greenville';
      postCodeController.text = '29601';
    });
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
        title: Text(
          'Add Agents',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: ////////////////////// save button start //////////////////////
          GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            SizeRoute(page: AgentsListAgentScreen()),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          margin: EdgeInsets.only(top: 0, bottom: 40, left: 20, right: 20),
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

      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            _buildProfileInfoContainer(
              'Agent Name',
              'Agent Name',
              nameController,
              TextInputType.text,
            ),
            _buildProfileInfoContainer(
              'Email',
              'Email address',
              emailController,
              TextInputType.emailAddress,
            ),
            Row(
              children: [
                Expanded(
                  child: _buildProfileInfoContainer(
                    'Phone',
                    'Phone number',
                    phoneController,
                    TextInputType.phone,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: _buildProfileInfoContainer(
                    'Country',
                    'Country',
                    countryController,
                    TextInputType.text,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildProfileInfoContainer(
                    'City',
                    'City',
                    cityController,
                    TextInputType.text,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: _buildProfileInfoContainer(
                    'Postcode',
                    'Postcode',
                    postCodeController,
                    TextInputType.numberWithOptions(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //

  Container _buildProfileInfoContainer(
    var label,
    var hintText,
    TextEditingController controller,
    TextInputType keyboardType,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 20),
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
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: TextField(
              // controller: emailController,
              controller: controller,
              // keyboardType: TextInputType.emailAddress,
              keyboardType: keyboardType,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                // fontFamily: 'poppins',
              ),
              decoration: InputDecoration(
                // hintText: "Email address",
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 0.35),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'poppins',
                ),
                // isDense: true,
                // contentPadding: EdgeInsets.only(bottom: 5, top: 3),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF0101D3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //
}
