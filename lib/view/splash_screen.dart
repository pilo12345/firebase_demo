// import 'dart:async';
//
// import 'package:firebase_demo/view/home_screen.dart';
// import 'package:firebase_demo/view/register_screen.dart';
// import 'package:flutter/material.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   String? userData;
//   Timer? timer;
//
//   Future getEmail() async {
//     SharedPreferences pref1 = await SharedPreferences.getInstance();
//     var storeData = pref1.getString("Email");
//     setState(() {
//       userData = storeData;
//     });
//   }
//
//   @override
//   void initState() {
//     getEmail().whenComplete(
//       () => timer = Timer(
//         Duration(seconds: 3),
//         () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   userData == null ? Register() : HomeScreen(),
//             ),
//           );
//         },
//       ),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.network(
//           "https://wallpapercave.com/fwp/wp10948577.jpg",
//           height: double.infinity,
//           width: double.infinity,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
