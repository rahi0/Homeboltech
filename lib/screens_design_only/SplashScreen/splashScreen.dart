// import 'package:flutter/material.dart';
// import 'package:homeboltech/routeTransition/routeAnimation.dart';
// import 'package:homeboltech/screens/OnboardingScreen/onboardingScreen.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation<Offset> _offsetAnimation;

//   // Image image1;
//   // Image image2;

//   @override
//   void initState() {
//     // image1 = Image.asset("assets/images/BackgroundImage.png");
//     // image2 = Image.asset("assets/images/LoginLogo.png");
//     super.initState();
//     route();
//     anim();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();

//   //   precacheImage(image1.image, context);
//   //   precacheImage(image2.image, context);
//   // }

//   void route() async {
//     await Future.delayed(new Duration(seconds: 3));

//     Navigator.pushReplacement(context, FadeRoute(page: OnBoardingScreen()));
//   }

//   anim() async {
//     // await Future.delayed(new Duration(milliseconds: 300));
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     )..repeat(reverse: true);

//     _offsetAnimation = Tween<Offset>(
//       end: Offset.zero,
//       begin: const Offset(0.0, -1.0),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.fastLinearToSlowEaseIn,
//     ));
//   }
//   // @override
//   // void initState() {
//   //   // route();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Container(
//         child: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   // image: AssetImage("assets/images/compressimage.jpg"),
//                   image: AssetImage("assets/images/compressedimage.jpg"),
//                   // image: image1.image,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SafeArea(
//               child: Container(
//                 margin: EdgeInsets.only(
//                   left: MediaQuery.of(context).size.width / 6,
//                   right: MediaQuery.of(context).size.width / 6,
//                   top: MediaQuery.of(context).size.width / 5,
//                 ),
//                 child: SlideTransition(
//                   position: _offsetAnimation,
//                   child: Image.asset('assets/images/LoginLogo.png'),
//                   // child: image2,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
