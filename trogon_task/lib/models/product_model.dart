class Product {
  final int productId;
  final String name;
  final String description;
  final double price;
  final String unit;
  final String image;
  final double discount;
  final bool availability;
  final String brand;
  final String category;
  final double rating;
  final List<Review> reviews;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.image,
    required this.discount,
    required this.availability,
    required this.brand,
    required this.category,
    required this.rating,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var reviewList = json['reviews'] as List;
    List<Review> reviews = reviewList.map((i) => Review.fromJson(i)).toList();

    return Product(
      productId: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      unit: json['unit'],
      image: json['image'],
      discount: json['discount'].toDouble(),
      availability: json['availability'],
      brand: json['brand'],
      category: json['category'],
      rating: json['rating'].toDouble(),
      reviews: reviews,
    );
  }
}

class Review {
  final int userId;
  final double rating;
  final String comment;

  Review({
    required this.userId,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userId: json['user_id'],
      rating: json['rating'].toDouble(),
      comment: json['comment'],
    );
  }
}
