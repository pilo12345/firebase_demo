import 'package:firebase_demo/controller/itemcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXDemo extends StatelessWidget {
  const GetXDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Increment());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.counter();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Obx(() => Text("${controller.count.value}")),
      ),
    );
  }
}
