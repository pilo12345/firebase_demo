// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_demo/firbase_services/verifyotp.dart';
// import 'package:flutter/material.dart';
//
// import '../constant.dart';
//
// String? verficationCode;
//
// class EnterMobile extends StatefulWidget {
//   const EnterMobile({Key? key}) : super(key: key);
//
//   @override
//   _EnterMobileState createState() => _EnterMobileState();
// }
//
// class _EnterMobileState extends State<EnterMobile> {
//   Future sendOtp() async {
//     await kFirebaseAuth.verifyPhoneNumber(
//       phoneNumber: "+91" + _mobile.text,
//       verificationCompleted: (phoneAuthCredential) {
//         print("Verification Completed");
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//       codeSent: (String verificationId, int? forceResendingToken) {
//         setState(() {
//           verficationCode = verificationId;
//         });
//       },
//       verificationFailed: (FirebaseAuthException error) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("$error"),
//           ),
//         );
//       },
//     );
//   }
//
//   final _formKey = GlobalKey<FormState>();
//   final _mobile = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.blue.shade100,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(height: h * 0.2),
//               CircleAvatar(
//                 backgroundColor: Colors.blue.shade100,
//                 backgroundImage: AssetImage("assets/images/profile.png"),
//                 radius: 50,
//               ),
//               SizedBox(height: h * 0.03),
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return ("Please Enter the Mobile number");
//                   }
//                 },
//                 controller: _mobile,
//                 decoration: const InputDecoration(
//                   suffixIcon: Icon(
//                     Icons.phone_android,
//                     color: Colors.black,
//                   ),
//                   hintText: "Mobile Number",
//                 ),
//               ),
//               SizedBox(height: h * 0.03),
//               GestureDetector(
//                 onTap: () async {
//                   await sendOtp().then((value) => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => VerifyOtp(),
//                       )));
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.deepOrange,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   height: h * 0.08,
//                   width: w,
//                   child: const Center(
//                     child: Text(
//                       "Send OTP",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
