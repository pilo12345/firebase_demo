import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/view/localdatastore_in_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.openBox<String>("todo");
  runApp(
    const MyApp(),
  );

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage1(),
    );
  }
}
