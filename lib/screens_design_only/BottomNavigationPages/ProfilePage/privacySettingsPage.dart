import 'package:flutter/material.dart';

class PrivacySettings extends StatefulWidget {
  @override
  _PrivacySettingsState createState() => _PrivacySettingsState();
}

class _PrivacySettingsState extends State<PrivacySettings> {
  bool isSwitched = false;

  toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
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
          'Privacy settings',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            children: [
              _buildPrivacySettingContainer(
                'Profile (Public/Private)',
                'After turning this on, your profile won’t be displayed.',
              ),
              _buildPrivacySettingContainer(
                'Hide Yourself in Online',
                'After turning this on, your won’t appear in online people.',
              ),
              _buildPrivacySettingContainer(
                'Hide Yourself in Nearby',
                'After turning this on, your won’t appear in online people.',
              ),
              _buildPrivacySettingContainer(
                'Hide Your Recent Active Time',
                'After turning this on, Other’s wont see your recent active time',
              ),
              _buildPrivacySettingContainer(
                'Don’t Recommend me to my Friends',
                'After turning this on, your won’t be recommended to your friends.',
              ),
              _buildPrivacySettingContainer(
                'Close Screenshots in profile',
                'After turning this on, other’s could not download or screenshot you photos in  profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPrivacySettingContainer(var settingName, var settingDesc) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.35,
            child: Text(
              // 'Profile (Public/Private)',
              settingName,
              style: TextStyle(
                color: Color(0xFF19191D),
                fontFamily: 'poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  // 'After turning this on, your profile won’t be displayed.',
                  settingDesc,
                  style: TextStyle(
                    color: Color(0xFF19191D),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Transform.scale(
                  scale: 1.25,
                  child: Switch(
                    onChanged: toggleSwitch,
                    value: isSwitched,
                    activeColor: Color(0xFF03AC62),
                    activeTrackColor: Color.fromRGBO(45, 45, 45, 0.1),
                    inactiveThumbColor: Color(0xFF03AC62),
                    inactiveTrackColor: Color.fromRGBO(45, 45, 45, 0.1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
