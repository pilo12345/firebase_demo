import 'package:firebase_demo/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'macup_homepage.dart';

class SignUPDemo extends StatefulWidget {
  const SignUPDemo({Key? key}) : super(key: key);

  @override
  _SignUPDemoState createState() => _SignUPDemoState();
}

class _SignUPDemoState extends State<SignUPDemo> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _email,
            decoration: InputDecoration(hintText: "E-mail"),
          ),
          TextFormField(
            controller: _password,
            decoration: InputDecoration(hintText: "PassWord"),
          ),
          SizedBox(height: Get.height * 0.002),
          ElevatedButton(
              onPressed: () {
                getStorage.write("E-mail", _email.text).then(
                      (value) => Get.to(
                        () => ProductHomePage(),
                      ),
                    );
              },
              child: Text("signUp"))
        ],
      ),
    );
  }
}
