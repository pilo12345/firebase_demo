import 'package:firebase_demo/controller/itemcontroller.dart';
import 'package:firebase_demo/view/textpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'cartscreendemo.dart';
import 'facv.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({Key? key}) : super(key: key);

  @override
  _ProductHomePageState createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  ProductController productController1 = Get.put(ProductController());

  AddCart addCart = Get.put(AddCart());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Texts(size: 16, text: "HomePage", fontWeight: FontWeight.bold),
          actions: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(CartDemo());
                    },
                    icon: Icon(Icons.shopping_cart)),
                Positioned(
                  top: 5,
                  child: CircleAvatar(
                    radius: 9,
                    child: Center(
                      child: Obx(
                        () => Text("${addCart.addtotalitem}"),
                      ),
                    ),
                  ),
                )
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ))
          ],
        ),
        body: Obx(() {
          if (productController1.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MasonryGridView.count(
              itemCount: productController1.productList.length,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: Get.height * 0.22,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${productController1.productList[index].imageLink}"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Favi()
                          ],
                        ),
                        Text(
                          "${productController1.productList[index].name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Container(
                          height: Get.height * 0.04,
                          width: Get.width * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${productController1.productList[index].rating}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${productController1.productList[index].price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            GestureDetector(
                              onTap: () {
                                addCart.additems(
                                    productController1.productList[index]);
                              },
                              child: Container(
                                height: Get.height * 0.04,
                                width: Get.width * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "Add Cart",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.01),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }));
  }
}
