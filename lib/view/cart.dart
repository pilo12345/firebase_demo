import 'package:firebase_demo/controller/itemcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  var increment = Get.put(Increment());
  List<Map<String, dynamic>> detail = [
    {
      "id": "1",
      "ProductName": "Apple",
      "Description": "Very Like Food",
      "Image": "assets/images/Googles.png",
      "price": "\$20"
    },
    {
      "id": "2",
      "ProductName": "Apple",
      "Description": "Very Like Food",
      "Image": "assets/images/Googles.png",
      "price": "\$30"
    },
    {
      "id": "3",
      "ProductName": "Apple",
      "Description": "Very Like Food",
      "Image": "assets/images/Googles.png",
      "price": "\$10"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${detail[index]["ProductName"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Text("${detail[index]["ProductName"]}")
                                ],
                              ),
                              Text("${detail[index]["price"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))
                            ],
                          ),
                          SizedBox(height: 5),
                          SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.orange,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.orange,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
          // SizedBox(height: 50),
          Text("Total Amount : "),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
