import 'package:pcnc_task/features/shopping/models/category.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final AppCategory category;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  // Factory method to create a Product instance from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: AppCategory.fromJson(json['category']),
      images: List<String>.from(json['images']),
    );
  }

  // Method to convert a Product instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category.toJson(),
      'images': images,
    };
  }
}
