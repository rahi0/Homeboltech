import 'package:flutter/material.dart';

class TncAgentScreen extends StatefulWidget {
  @override
  _TncAgentScreenState createState() => _TncAgentScreenState();
}

class _TncAgentScreenState extends State<TncAgentScreen> {
  bool _isChecked = false;

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
          'Terms & Conditions',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      bottomNavigationBar:
          ////////////////////// Agree button start //////////////////////
          Container(
        height: 110,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isChecked = !_isChecked;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                          color: _isChecked
                              ? Color(0xFF0101D3)
                              : Color(0xFFF7F8FB),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 9),
                      child: Text(
                        'I agree to the terms & condition',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 15, bottom: 15),
                margin:
                    EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF0101D3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Agree',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ////////////////////// Agree button end //////////////////////

      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(
          children: [
            _buildTncItemContainer(
              'Conditions of Use',
              'Please read these terms of service (“terms”,”terms of service”) carefully before using [App] App (The “service”) operated by [name][“us”,”we”,”our”].',
            ),
            _buildTncItemContainer(
              'Copyright',
              'Please read these terms of service (“terms”,”terms of service”) carefully before using [App] App (The “service”) operated by [name][“us”,”we”,”our”].',
            ),
            _buildTncItemContainer(
              'Policy',
              'Please read these terms of service (“terms”,”terms of service”) carefully before using [App] App (The “service”) operated by [name][“us”,”we”,”our”].',
            ),
            _buildTncItemContainer(
              'Updating these terms',
              'Please read these terms of service (“terms”,”terms of service”) carefully before using [App] App (The “service”) operated by [name][“us”,”we”,”our”].',
            ),
          ],
        ),
      ),
    );
  }

  _buildTncItemContainer(var settingName, var settingDesc) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              // 'Profile (Public/Private)',
              settingName,
              style: TextStyle(
                color: Color(0xFF19191D),
                // fontFamily: 'poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            // 'After turning this on, your profile won’t be displayed.',
            settingDesc,
            style: TextStyle(
              color: Color(0xFF19191D),
            ),
          ),
        ],
      ),
    );
  }
}
