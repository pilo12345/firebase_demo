import 'package:firebase_demo/firbase_services/product_service.dart';
import 'package:firebase_demo/model/productmodel.dart';
import 'package:get/get.dart';

class Increment extends GetxController {
  RxInt count = 0.obs;

  counter() {
    count++;
    update();
  }

  counter1() {
    count--;
  }
}

/// get api countroller
class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      final product1 = await ProductApi.getProduct();

      if (product1 != null) {
        productList.value = product1;
      }
    } finally {
      isLoading(false);
    }
  }
}

///add cart

class AddCart extends GetxController {
  var add = <Product>[].obs;

  /// add cart ma item add thai hoy te jovi hoy tena mate
  int get addtotalitem => add.length;

  double get totalamount =>
      add.fold(0, (sum, item) => sum + double.parse(item.price!));

  additems(var product) {
    add.add(product);
  }
}
