// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:homeboltech/routeTransition/routeAnimation.dart';
// import 'package:homeboltech/screens/SignInScreen/signInScreen.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   @override
//   _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   TextEditingController textEditingController = TextEditingController();
//   StreamController<ErrorAnimationType> errorController;
//   var currentText;
//   bool _isCompleted = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF7F8FB),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Container(
//             margin: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 ////////////////////// instruction text start //////////////////////
//                 Container(
//                   margin: EdgeInsets.only(top: 55, bottom: 20),
//                   child: Text(
//                     "Please enter OTP to complete Sign Up",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'poppins',
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 ////////////////////// instruction text end //////////////////////

//                 ////////////////////// instruction text start //////////////////////
//                 Container(
//                   margin:
//                       EdgeInsets.only(top: 15, bottom: 35, left: 30, right: 30),
//                   child: Text(
//                     "We have send the OTP to +89 858286. Will apply to the field",
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 ////////////////////// instruction text end //////////////////////

//                 ////////////////////// otp input field start //////////////////////
//                 PinCodeTextField(
//                   appContext: context,
//                   length: 4,
//                   obscureText: false,
//                   animationType: AnimationType.fade,
//                   keyboardType: TextInputType.number,
//                   textStyle: TextStyle(
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'poppins',
//                   ),
//                   pinTheme: PinTheme(
//                     shape: PinCodeFieldShape.box,
//                     borderRadius: BorderRadius.circular(10),
//                     borderWidth: 1,
//                     fieldHeight: 70,
//                     fieldWidth: 70,
//                     activeFillColor: Colors.white,
//                     inactiveFillColor: Colors.white,
//                     selectedFillColor: Colors.white,
//                     selectedColor: Color.fromRGBO(45, 45, 45, 0.1),
//                     inactiveColor: Color.fromRGBO(45, 45, 45, 0.1),
//                     // activeColor: Color(0xFF0101D3),
//                     activeColor: Colors.white,
//                   ),
//                   animationDuration: Duration(milliseconds: 300),
//                   backgroundColor: Color(0xFFF7F8FB),
//                   enableActiveFill: true,
//                   errorAnimationController: errorController,
//                   controller: textEditingController,
//                   onCompleted: (v) {
//                     print("Completed");
//                     setState(() {
//                       _isCompleted = true;
//                     });
//                     _showMsg('OTP verified successfully!', 2);

//                     Navigator.pushReplacement(
//                         context, SlideLeftRoute(page: SignInScreen()));
//                   },
//                   onChanged: (value) {
//                     print(value);
//                     setState(() {
//                       currentText = value;

//                       if (currentText.length < 4) _isCompleted = false;
//                     });
//                   },
//                 ),
//                 ////////////////////// otp input field start //////////////////////

//                 ////////////////////// verify button start //////////////////////
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     padding: EdgeInsets.only(top: 15, bottom: 15),
//                     margin: EdgeInsets.only(top: 30, bottom: 20),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF0101D3),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       _isCompleted ? 'Login' : 'Verify',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 ////////////////////// verify button end //////////////////////

//                 ////////////////////// instruction text start //////////////////////
//                 if (!_isCompleted)
//                   Container(
//                     margin: EdgeInsets.only(
//                         top: 17, bottom: 10, left: 30, right: 30),
//                     child: Text(
//                       "I didn’t get a code",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ////////////////////// instruction text end //////////////////////

//                 ////////////////////// resend code button start //////////////////////
//                 if (!_isCompleted)
//                   Container(
//                     padding: EdgeInsets.only(),
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 2,
//                           color: Color(0xFF0101D3),
//                         ),
//                       ),
//                     ),
//                     child: Text(
//                       "Resend code",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF0101D3),
//                         fontWeight: FontWeight.w500,
//                         // decoration: TextDecoration.underline,
//                         // decorationThickness: 2,
//                         // decorationStyle: TextDecorationStyle.solid,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ////////////////////// resend code button end //////////////////////
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   ////////////////
//   _showMsg(msg, numb) {
//     Fluttertoast.showToast(
//         msg: msg,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor:
//             numb == 1 ? Colors.red.withOpacity(0.9) : Colors.green[400],
//         textColor: Colors.white,
//         fontSize: 13.0);
//   }
//   ////////////////
// }
