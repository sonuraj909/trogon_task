import 'package:flutter/material.dart';

import 'custom_rating_bar_widget.dart';
import 'custom_text_widget.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 165,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image:
                            NetworkImage('https://picsum.photos/id/1/200/300'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              CustomTextWidget(
                text: product.name,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              Row(
                children: [
                  CustomTextWidget(
                    text: '\$${product.price} ',
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.grey,
                  ),
                  CustomTextWidget(
                    text: ' \$${(product.price * 0.9).toStringAsFixed(2)}',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              CustomTextWidget(
                text: '${product.brand}',
                fontSize: 12,
              ),
              CustomRatingBarWidget(rating: product.rating),
            ],
          ),
        ),
      ),
    );
  }
}
