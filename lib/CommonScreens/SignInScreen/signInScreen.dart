import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavBarScreenAdmin/bottomNavBarScreenAdmin.dart';
import 'package:homeboltech/Agent/screensAgent/BottomNavBarAgentScreen/bottomNavBarAgentScreen.dart';
import 'package:homeboltech/Client/screensClient/BottomNavBarClientScreen/bottomNavBarClientScreen.dart';

import 'package:homeboltech/api/api.dart';
import 'package:homeboltech/main.dart';
import 'package:homeboltech/redux/action.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;
  bool _isChecked = false;
  bool _isLoading = false;

  ////////////////////// sign in method start ///////////////////
  Future<void> _handleSignIn() async {
    if (emailController.text.isEmpty) {
      return _showMsg('Email can\'t be empty!', 1);
    }
    if (passwordController.text.isEmpty) {
      return _showMsg('Password can\'t be empty!', 1);
    }

    setState(() {
      _isLoading = true;
    });

    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    print('----------------------data---------------------');
    print(data);
    print('----------------------data---------------------');

    var res = await CallApi().postData(data, 'sadmin/login');
    print('res - $res');
    var body = json.decode(res.body);
    print('body - $body');
    print('res.statusCode  - ${res.statusCode}');

    if (res.statusCode == 200 && body['success'] == true) {
      _showMsg(body['message'], 2);
      Navigator.pushReplacement(
          context,
          SlideLeftRoute(
            page: body['user']['user_type_id'] == 5
                ? BottomNavBarAdminScreen()
                : body['user']['user_type_id'] == 3
                    ? BottomNavBarClientScreen()
                    : BottomNavBarAgentScreen(),
          ));

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('userData', json.encode(body['user']));

      if (_isChecked == true) {
        data = {
          'email': emailController.text,
          'password': passwordController.text
        };
      } else {
        data = null;
      }

      print('****************** save data *********************');
      print(data);
      localStorage.setString('rememberCredentials', json.encode(data));
      print(localStorage.getString('rememberCredentials'));

      store.state.userDataState = body['user'];
      store.dispatch(UserDataAction(store.state.userDataState));
    } else {
      _showMsg(body['message'], 1);
    }

    setState(() {
      _isLoading = false;
    });
  }
  ////////////////////// sign in method end ///////////////////

  ///////////////////// remember login details mehtod start ////////////////
  var loginData;
  var emailData;
  var passData;

  void _rememberData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var body = localStorage.getString('rememberCredentials');

    print('...................... body...................');
    print(body);

    if (body != null) {
      loginData = json.decode(body);
      print(loginData);
      setState(() {
        if (loginData != null) {
          loginData['email'] == null
              ? emailData = ""
              : emailData = loginData['email'];
          loginData['password'] == null
              ? passData = ""
              : passData = loginData['password'];

          emailController.text = emailData;
          passwordController.text = passData;

          _isChecked = true;
        }
      });
    }
  }
  ///////////////////// remember login details mehtod end ////////////////

  @override
  void initState() {
    _rememberData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFFF7F8FB),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  ////////////////////// instruction text start //////////////////////
                  Container(
                    margin: EdgeInsets.only(top: 55, bottom: 20),
                    child: Text(
                      "Please Enter your email and password to Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ////////////////////// instruction text end //////////////////////

                  ////////////////////// email text field start //////////////////////
                  Container(
                    margin: EdgeInsets.only(
                      top: 35,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromRGBO(45, 45, 45, 0.1),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Color.fromRGBO(45, 45, 45, 0.35),
                        ),
                        hintText: "Email address",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 0.35),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 17, bottom: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  ////////////////////// email text field end //////////////////////

                  ////////////////////// password text field start //////////////////////
                  Container(
                    margin: EdgeInsets.only(top: 17, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromRGBO(45, 45, 45, 0.1),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color.fromRGBO(45, 45, 45, 0.35),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Color.fromRGBO(45, 45, 45, 0.35),
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 0.35),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 17, bottom: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ////////////////////// password text field end //////////////////////

                  ////////////////////// remember forgot row start //////////////////////
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isChecked = !_isChecked;
                            });
                          },
                          child: Container(
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
                                    'Remember me',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Text(
                              'Forgot password?',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ////////////////////// remember forgot row end //////////////////////

                  ////////////////////// sign in button start //////////////////////
                  GestureDetector(
                    onTap: () {
                      _isLoading ? null : _handleSignIn();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF0101D3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _isLoading ? 'Please Wait' : 'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ////////////////////// sign in button end //////////////////////

                  // ////////////////////// sign up option button start //////////////////////
                  // Container(
                  //   padding: EdgeInsets.only(bottom: 10.0),

                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         'Don\'t have an account? ',
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.pushReplacement(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => SignUpScreen()),
                  //           );
                  //         },
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             border: Border(
                  //               bottom: BorderSide(
                  //                 width: 2,
                  //                 color: Color(0xFF0101D3),
                  //               ),
                  //             ),
                  //           ),
                  //           child: Text(
                  //             'Sign Up',
                  //             style: TextStyle(
                  //               color: Color(0xFF0101D3),
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   // RichText(
                  //   //   textAlign: TextAlign.center,
                  //   //   text: TextSpan(
                  //   //     children: [
                  //   //       TextSpan(
                  //   //         text: 'Don\'t have an account? ',
                  //   //         style: TextStyle(
                  //   //           color: Colors.black,
                  //   //           fontWeight: FontWeight.w400,
                  //   //         ),
                  //   //       ),
                  //   //       TextSpan(
                  //   //         text: 'Sign Up',
                  //   //         style: TextStyle(
                  //   //           color: Color(0xFF0101D3),
                  //   //           fontWeight: FontWeight.w500,
                  //   //         ),
                  //   //         recognizer: TapGestureRecognizer()
                  //   //           ..onTap = () {
                  //   //             // navigate to desired screen
                  //   //             Navigator.pushReplacement(
                  //   //               context,
                  //   //               MaterialPageRoute(
                  //   //                   builder: (context) => SignUpScreen()),
                  //   //             );
                  //   //           },
                  //   //       ),
                  //   //     ],
                  //   //   ),
                  //   // ),
                  // ),
                  // ////////////////////// sign up option button end //////////////////////

                  // //// or ////
                  // Container(
                  //   margin: EdgeInsets.only(top: 25),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Flexible(
                  //         child: Container(
                  //           color: Color.fromRGBO(45, 45, 45, 0.3),
                  //           height: 2,
                  //           width: 30,
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(left: 5, right: 5),
                  //         child: Text(
                  //           'Or',
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //             color: Color(0xFF0101D3),
                  //           ),
                  //         ),
                  //       ),
                  //       Flexible(
                  //         child: Container(
                  //           color: Color.fromRGBO(45, 45, 45, 0.3),
                  //           height: 2,
                  //           width: 30,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // //// or ////

                  // ////////////////////// facebook sign in button start //////////////////////
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     padding: EdgeInsets.only(top: 15, bottom: 15),
                  //     margin: EdgeInsets.only(top: 30, bottom: 18),
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFF475993),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.asset('assets/images/fb.png'),
                  //         SizedBox(width: 8),
                  //         Text(
                  //           'Continue With Facebook',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w600,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // ////////////////////// facebook sign in button end //////////////////////

                  // ////////////////////// google sign in button start //////////////////////
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     padding: EdgeInsets.only(top: 15, bottom: 15),
                  //     margin: EdgeInsets.only(top: 0, bottom: 80),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(
                  //         color: Color.fromRGBO(45, 45, 45, 0.1),
                  //         width: 1,
                  //       ),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.asset('assets/images/google.png'),
                  //         SizedBox(width: 8),
                  //         Text(
                  //           'Continue With Google',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w600,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // ////////////////////// google sign in button end //////////////////////
                ],
              ),
            ),
          ),
        ),
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

  /////////////// on will pop start //////////////////
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            //   title: new Text('Are you sure?'),
            content: new Text(
              'Are you sure you want to exit this app?',
              style: TextStyle(
                fontFamily: 'poppins',
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: TextStyle(
                    color: Color(0xFF0101D3),
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              FlatButton(
                onPressed: () => exit(0),
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Color(0xFF0101D3),
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
  /////////////// on will pop start //////////////////

}
