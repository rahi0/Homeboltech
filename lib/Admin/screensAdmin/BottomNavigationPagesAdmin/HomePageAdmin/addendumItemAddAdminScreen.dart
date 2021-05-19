import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homeboltech/api/api.dart';

class AddendumItemAddAdminScreen extends StatefulWidget {
  @override
  _AddendumItemAddAdminScreenState createState() =>
      _AddendumItemAddAdminScreenState();
}

class _AddendumItemAddAdminScreenState
    extends State<AddendumItemAddAdminScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController seniorMgtPercentController = TextEditingController();
  TextEditingController salesPercentController = TextEditingController();
  TextEditingController techPercentController = TextEditingController();
  TextEditingController hourRateController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();

  bool _isEditable = false;

  ////////////////// add addendum method start //////////////////
  _handleSave() async {
    if (nameController.text.isEmpty) {
      return _showMsg('Addendum Name can\'t be empty!', 1);
    }
    if (seniorMgtPercentController.text.isEmpty) {
      return _showMsg('Enter Senior Management Percenatge!', 1);
    }
    if (salesPercentController.text.isEmpty) {
      return _showMsg('Enter Sales Director Percenatge!', 1);
    }
    if (techPercentController.text.isEmpty) {
      return _showMsg('Enter Technician Sales agent Percenatge!', 1);
    }
    if (hourRateController.text.isEmpty) {
      return _showMsg('Enter Billable Hour Rate!', 1);
    }
    if (minPriceController.text.isEmpty) {
      return _showMsg('Enter Min Price!', 1);
    }

    var data = {
      'name': nameController.text,
      'senior_management': seniorMgtPercentController.text,
      'sales_director': salesPercentController.text,
      'tech_sales_agent': techPercentController.text,
      'billable_hour': hourRateController.text,
      'min_price': minPriceController.text,
    };

    var res = await CallApi().postData(data, 'sadmin/addnewAddendum');
    print('res - $res');
    var body = json.decode(res.body);
    print('body - $body');
    print('res.statusCode  - ${res.statusCode}');

    if (res.statusCode == 200) {
      
    } else {}
  }
  ////////////////// add addendum method end //////////////////

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
          'Add New Addendum',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: ////////////////////// save button start //////////////////////
          Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            _handleSave();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            margin: EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
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
      ),
      ////////////////////// save button end //////////////////////

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
                          'Addendum Name',
                          nameController,
                          TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Senior Management %',
                          'Addendum Senior Management %',
                          seniorMgtPercentController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Sales Director %',
                          'Addendum Sales Director %',
                          salesPercentController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Technician Sales agent %',
                          'Addendum Technician Sales agent %',
                          techPercentController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Billable Hour rate',
                          'Addendum Billable Hour rate',
                          hourRateController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 20),
                        _buildProfileInfoContainer(
                          'Minimum Price',
                          'Addendum Minimum Price',
                          minPriceController,
                          TextInputType.numberWithOptions(),
                        ),
                        SizedBox(height: 100),
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
          Container(
            margin: EdgeInsets.only(bottom: 8),
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
        ],
      ),
    );
  }

  ////////////////
  _showMsg(msg, numb) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor:
            numb == 1 ? Colors.red.withOpacity(0.9) : Colors.green[400],
        textColor: Colors.white,
        fontSize: 13.0);
  }
  ////////////////

}
