import 'package:firebase_demo/controller/itemcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartDemo extends StatefulWidget {
  const CartDemo({Key? key}) : super(key: key);

  @override
  _CartDemoState createState() => _CartDemoState();
}

class _CartDemoState extends State<CartDemo> {
  var showTotalItem = Get.put(AddCart());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: showTotalItem.add.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          height: Get.height * 0.2,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                "${showTotalItem.add[index].imageLink}"),
                          )),
                        ),
                        Text("name"),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              ),
            ),
            Text("Total Amount:${showTotalItem.totalamount}")
          ],
        ),
      ),
    );
  }
}
