// import 'dart:io';
//
// import 'package:firebase_demo/firbase_services/firebase_auth_services.dart';
// import 'package:firebase_demo/firbase_services/google_services.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'home_screen.dart';
//
// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);
//
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   final _formKey = GlobalKey<FormState>();
//
//   final _fName = TextEditingController();
//   final _lName = TextEditingController();
//   final _email = TextEditingController();
//   final _passWord = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _fName,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Firstname Required";
//                   }
//                 },
//                 decoration: InputDecoration(hintText: "First name"),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _lName,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Lastname Required";
//                   }
//                 },
//                 decoration: InputDecoration(hintText: "Last name"),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _email,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Email Required";
//                   }
//                 },
//                 decoration: InputDecoration(hintText: "Email"),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _passWord,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Password Required";
//                   } else if (value.length < 8) {
//                     return "Enter 8 charcter";
//                   }
//                 },
//                 decoration: InputDecoration(hintText: "Password"),
//               ),
//               SizedBox(height: 10),
//               MaterialButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     bool status = await FireBaseAuthServices.registerUser(
//                         email: _email.text, password: _passWord.text);
//                     if (status == true) {
//                       SharedPreferences pref =
//                           await SharedPreferences.getInstance();
//
//                       pref.setString("Email", _email.text).then(
//                             (value) => Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => HomeScreen(),
//                               ),
//                             ),
//                           );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("login Failed"),
//                         ),
//                       );
//                     }
//                   }
//                 },
//                 child: Text("Register"),
//                 color: Colors.blueAccent,
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               Text("----- Sign with ------"),
//               const SizedBox(
//                 height: 25,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   signInWithGoogle().then(
//                     (value) => Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HomeScreen(),
//                       ),
//                     ),
//                   );
//                 },
//                 child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     backgroundImage: AssetImage("assets/images/Googles.png")),
//               )
//               // RichText(
//               //   text: TextSpan(
//               //     text: "Create your account? ",
//               //     style: TextStyle(
//               //         fontWeight: FontWeight.bold,
//               //         fontSize: 16,
//               //         color: Colors.black),
//               //     children: const [
//               //       TextSpan(
//               //         text: "sign",
//               //         style: TextStyle(
//               //             fontWeight: FontWeight.bold,
//               //             fontSize: 16,
//               //             color: Colors.blueAccent),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
