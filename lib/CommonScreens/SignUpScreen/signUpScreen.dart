import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homeboltech/CommonScreens/OtpVerificationScreen/otpVerificationScreen.dart';
import 'package:homeboltech/CommonScreens/SignInScreen/signInScreen.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  void _handleSignUp() {
    if (emailController.text.isEmpty) {
      return _showMsg('Email can\'t be empty!', 1);
    }
    if (phoneController.text.isEmpty) {
      return _showMsg('Phone number can\'t be empty!', 1);
    }
    if (passwordController.text.isEmpty) {
      return _showMsg('Password can\'t be empty!', 1);
    }

    Navigator.pushReplacement(
        context, SlideLeftRoute(page: OtpVerificationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  margin:
                      EdgeInsets.only(top: 55, bottom: 20, left: 5, right: 5),
                  child: Text(
                    "Please Enter your all information to Sign Up",
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

                ////////////////////// v text field start //////////////////////
                Container(
                  margin: EdgeInsets.only(
                    top: 17,
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
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color.fromRGBO(45, 45, 45, 0.35),
                      ),
                      hintText: "Phone Number",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(45, 45, 45, 0.35),
                      ),
                      contentPadding:
                          EdgeInsets.only(left: 10, top: 17, bottom: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                ////////////////////// phone text field end //////////////////////

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

                ////////////////////// sign up button start //////////////////////
                GestureDetector(
                  onTap: () {
                    _handleSignUp();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF0101D3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Sign Up Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ////////////////////// sign up button end //////////////////////

                ////////////////////// sign in option button start //////////////////////
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: Color(0xFF0101D3),
                              ),
                            ),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xFF0101D3),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // RichText(
                  //   textAlign: TextAlign.center,
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: 'Already have an account? ',
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: 'Sign In',
                  //         style: TextStyle(
                  //           color: Color(0xFF0101D3),
                  //           fontWeight: FontWeight.w500,
                  //           decoration: TextDecoration.underline,
                  //         ),
                  //         recognizer: TapGestureRecognizer()
                  //           ..onTap = () {
                  //             // navigate to desired screen
                  //             Navigator.pushReplacement(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => SignInScreen()),
                  //             );
                  //           },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
                ////////////////////// sign in option button end //////////////////////

                //// or ////
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          color: Color.fromRGBO(45, 45, 45, 0.3),
                          height: 2,
                          width: 30,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          'Or',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0101D3),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          color: Color.fromRGBO(45, 45, 45, 0.3),
                          height: 2,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                //// or ////

                ////////////////////// facebook sign in button start //////////////////////
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    margin: EdgeInsets.only(top: 30, bottom: 18),
                    decoration: BoxDecoration(
                      color: Color(0xFF475993),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/fb.png'),
                        SizedBox(width: 8),
                        Text(
                          'Continue With Facebook',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ////////////////////// facebook sign in button end //////////////////////

                ////////////////////// google sign in button start //////////////////////
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    margin: EdgeInsets.only(top: 0, bottom: 80),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromRGBO(45, 45, 45, 0.1),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google.png'),
                        SizedBox(width: 8),
                        Text(
                          'Continue With Google',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ////////////////////// google sign in button end //////////////////////
              ],
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
}
