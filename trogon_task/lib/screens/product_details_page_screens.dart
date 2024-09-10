import 'package:flutter/material.dart';
import 'package:trogon_task/widget/custom_rating_bar_widget.dart';
import '../models/product_model.dart';
import '../widget/custom_text_widget.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/id/1/200/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextWidget(
              text: product.name,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CustomRatingBarWidget(rating: product.rating),
                CustomTextWidget(
                  text: ' ${product.rating}',
                  color: Colors.orange,
                  fontSize: 14,
                ),
              ],
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: '\$${product.price} ',
                  fontSize: 16,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.grey,
                ),
                CustomTextWidget(
                  text: ' \$${(product.price * 0.9).toStringAsFixed(2)}',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ],
            ),
            CustomTextWidget(
              text: 'Brand: ${product.brand}',
              fontSize: 16,
            ),
            CustomTextWidget(
              text: 'Category: ${product.category}',
              fontSize: 16,
            ),
            const SizedBox(height: 20),
            const CustomTextWidget(
              text: 'Description',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomTextWidget(
              text: product.description,
              fontSize: 16,
              maxLines: 3,
              decoration: TextDecoration.none,
            ),
            const SizedBox(height: 20),
            const CustomTextWidget(
              text: 'Reviews',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ...product.reviews.map(
              (review) => Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'User ${review.userId}',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: review.comment,
                      fontSize: 14,
                    ),
                    CustomRatingBarWidget(rating: review.rating),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
