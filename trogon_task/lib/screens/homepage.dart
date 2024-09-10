import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_task/widget/custom_text_widget.dart';
import '../controller/product_controller.dart';
import '../widget/error_handling_widget.dart';
import '../widget/product_card.dart';
import 'product_details_page_screens.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Center(
              child: CustomTextWidget(
            text: 'E-commerce App',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productController.error.isNotEmpty) {
          return ErrorBoxWidget(productController: productController);
        }

        return RefreshIndicator(
          onRefresh: () async {
            print("Refresh triggered");
            productController.fetchProducts();
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CategoryList(
                        title: 'New Arrivals',
                        products: productController.productList),
                    CategoryList(
                        title: 'Trending Products',
                        products: productController.productList),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CategoryList extends StatelessWidget {
  final String title;
  final List products;

  const CategoryList({super.key, required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () => Get.to(ProductDetailPage(product: product)),
                  child: ProductCard(product: product),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
