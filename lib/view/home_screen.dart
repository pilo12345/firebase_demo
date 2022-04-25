// import 'package:firebase_demo/firbase_services/firebase_auth_services.dart';
// import 'package:firebase_demo/firbase_services/google_services.dart';
// import 'package:firebase_demo/view/register_screen.dart';
//
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Welcome to HomeScreen",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             MaterialButton(
//               onPressed: () {
//                 FireBaseAuthServices.logout().then(
//                   (value) => Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Register(),
//                     ),
//                   ),
//                 );
//               },
//               child: Text("Logout"),
//               color: Colors.blueAccent,
//             ),
//             SizedBox(height: 20),
//             MaterialButton(
//               onPressed: () {
//                 signOutGoogle().then(
//                   (value) => Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Register(),
//                     ),
//                   ),
//                 );
//               },
//               child: Text("goggle Logout"),
//               color: Colors.blueAccent,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
