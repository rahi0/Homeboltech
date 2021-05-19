import 'package:flutter/material.dart';

class AddendumItemDetailAdminScreen extends StatefulWidget {
  @override
  _AddendumItemDetailAdminScreenState createState() =>
      _AddendumItemDetailAdminScreenState();
}

class _AddendumItemDetailAdminScreenState
    extends State<AddendumItemDetailAdminScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController seniorMgtPercentController = TextEditingController();
  TextEditingController salesPercentController = TextEditingController();
  TextEditingController techPercentController = TextEditingController();
  TextEditingController hourRateController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();

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
        // title: Text(
        //   'ERP Database Development',
        //   style: TextStyle(
        //     color: Color(0xFF0101D3),
        //     fontFamily: 'poppins',
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isEditable = !_isEditable;
              });
            },
            child: Container(
              padding: EdgeInsets.only(right: 11, left: 13, top: 9, bottom: 9),
              margin: EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 5),
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
      body: Container(
        child: Column(
          children: [
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
                        _buildProfileInfoContainer(
                          'Addendum Name',
                          'ERP Database Development',
                          'Addendum Name',
                          nameController,
                          TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Senior Management %',
                          '29.41',
                          'Addendum Senior Management %',
                          seniorMgtPercentController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Sales Director %',
                          '29.51',
                          'Addendum Sales Director %',
                          salesPercentController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Technician Sales agent %',
                          '29.41',
                          'Addendum Technician Sales agent %',
                          techPercentController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Billable Hour rate',
                          '130',
                          'Addendum Billable Hour rate',
                          hourRateController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Minimum Price',
                          '0',
                          'Addendum Minimum Price',
                          minPriceController,
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
                    // controller: nameController,
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
                        // fontSize: 16,
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
