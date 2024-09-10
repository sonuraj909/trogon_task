import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBarWidget extends StatelessWidget {
  const CustomRatingBarWidget({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemCount: 5,
      itemSize: 20.0,
      unratedColor: Colors.grey[300],
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.orange,
      ),
    );
  }
}
