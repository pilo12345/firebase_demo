import 'package:firebase_demo/api_shortcut/api_shortcut1.dart';
import 'package:firebase_demo/model/productmodel.dart';

class ProductApi {
  // static Future<List<Product>?> getProduct() async {
  //   http.Response response = await http.get(Uri.parse(
  //       "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
  //
  //   if (response.statusCode == 200) {
  //     print(jsonDecode(response.body));
  //     return productFromJson(response.body);
  //   }
  // }

  static Future<List<Product>?> getProduct() async {
    var response = await API.apiHandler(
        url:
            "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline",
        apiType: ApiType.aGet);
    return productFromJson(response);
  }
}
