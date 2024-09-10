import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:trogon_task/models/product_model.dart'; // Make sure this path is correct

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse('https://fake-store-api.mock.beeceptor.com/api/products'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List<dynamic>;

        if (data.isNotEmpty) {
          productList.value = data
              .where((item) => item != null)
              .map((product) {
                try {
                  return Product.fromJson(product as Map<String, dynamic>);
                } catch (e) {
                  return null;
                }
              })
              .whereType<Product>()
              .toList();
        } else {
          error('No products found.');
        }
      } else {
        error('Failed to fetch products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      error('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }
}
